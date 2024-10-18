<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">氢信SaaS云基座开发文档-集成Mybatis-Plus20241018</h1>

## 项目文件结构

<img src="..\pic\ProjectFileStructure.png" alt="avatar" />

**整体方向：**

​	在原有模块上新增common-mybatisplus,common-tanant,modules-flowable,modules-apigateway模块，改造升级modules-system,auth,common-redis模块。

## 整合Mybatis-Plus

1. 在根目录的pom文件中引入Mybatis-Plus依赖

   ```
   <mybatis-plus.version>3.5.4</mybatis-plus.version>
   
   <!-- mybatis-plus -->
   <dependency>
   	<groupId>com.baomidou</groupId>
   	<artifactId>mybatis-plus-boot-starter</artifactId>
   	<version>${mybatis-plus.version}</version>
   </dependency>
   ```

2. 在 [qingxinsaas-common](../qingxinsaas-common) 下新建 [qingxinsaas-common-mybatisplus](qingxinsaas-common\qingxinsaas-common-mybatisplus) 模块，在mybatis-plus模块的pom文件中加入对应依赖

   <img src="..\pic\common-mp1.png" alt="avatar" />

3. 在项目pom文件中加入mybatis-plus模块依赖

   ```
   <!-- MP -->
   <dependency>
   	<groupId>com.qingxinsaas</groupId>
   	<artifactId>qingxinsaas-common-mybatisplus</artifactId>
   	<version>${qingxinsaas.version}</version>
   </dependency>
   ```

4. 在mybatis-plus模块创建对应的包

   <img src="..\pic\common-mp2.png" alt="avatar" />

   新建config包，添加mybatis-plus配置类并注入

   ```java
   @EnableTransactionManagement(proxyTargetClass = true)
   @Configuration
   public class MybatisPlusConfig {
   
       @Bean
       public MybatisPlusInterceptor mybatisPlusInterceptor()
       {
           MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
           // 分页插件
           interceptor.addInnerInterceptor(paginationInnerInterceptor());
           // 乐观锁插件
           interceptor.addInnerInterceptor(optimisticLockerInnerInterceptor());
           // 阻断插件
           interceptor.addInnerInterceptor(blockAttackInnerInterceptor());
           return interceptor;
       }
   
       /**
        * 分页插件，自动识别数据库类型 https://baomidou.com/guide/interceptor-pagination.html
        */
       public PaginationInnerInterceptor paginationInnerInterceptor()
       {
           PaginationInnerInterceptor paginationInnerInterceptor = new PaginationInnerInterceptor();
           // 设置数据库类型为mysql
           paginationInnerInterceptor.setDbType(DbType.MYSQL);
           // 设置最大单页限制数量，默认 500 条，-1 不受限制
           paginationInnerInterceptor.setMaxLimit(-1L);
           return paginationInnerInterceptor;
       }
   
       /**
        * 乐观锁插件 https://baomidou.com/guide/interceptor-optimistic-locker.html
        */
       public OptimisticLockerInnerInterceptor optimisticLockerInnerInterceptor()
       {
           return new OptimisticLockerInnerInterceptor();
       }
   
       /**
        * 如果是对全表的删除或更新操作，就会终止该操作 https://baomidou.com/guide/interceptor-block-attack.html
        */
       public BlockAttackInnerInterceptor blockAttackInnerInterceptor()
       {
           return new BlockAttackInnerInterceptor();
       }
   
       @Bean
       public MetaObjectHandler defaultMetaObjectHandler(){
           // 自动填充参数类
           return new DefaultDBFieldHandler();
       }
   
   }
   ```

5. 添加注入类

   <img src="..\pic\common-mp3.png" alt="avatar" />

6. 在 MyBatis Plus 的基础上进行拓展，提供更多的能力

   <img src="..\pic\common-mp4.png" alt="avatar" />

   添加对应包和文件，BaseDO基础实体对象，为Flowable工作流的集成做准备

   ```java
   public abstract class BaseDO implements Serializable {
   
       /**
        * 创建时间
        */
       @TableField(fill = FieldFill.INSERT)
       private Date createTime;
       /**
        * 最后更新时间
        */
       @TableField(fill = FieldFill.INSERT_UPDATE)
       private Date updateTime;
       /**
        * 创建者，目前使用 SysUser 的 id 编号
        *
        * 使用 String 类型的原因是，未来可能会存在非数值的情况，留好拓展性。
        */
       @TableField(fill = FieldFill.INSERT, jdbcType = JdbcType.VARCHAR)
       private String creator;
       /**
        * 更新者，目前使用 SysUser 的 id 编号
        *
        * 使用 String 类型的原因是，未来可能会存在非数值的情况，留好拓展性。
        */
       @TableField(fill = FieldFill.INSERT_UPDATE, jdbcType = JdbcType.VARCHAR)
       private String updater;
       /**
        * 是否删除
        */
       @TableLogic
       private Boolean deleted;
   
   }
   ```

   DefaultDBFieldHandler通用参数填充实现类

   ```java
   public class DefaultDBFieldHandler implements MetaObjectHandler {
   
       @Override
       public void insertFill(MetaObject metaObject) {
           if (Objects.nonNull(metaObject) && metaObject.getOriginalObject() instanceof BaseDO) {
               BaseDO baseDO = (BaseDO) metaObject.getOriginalObject();
   
               Date current = new Date();
               // 创建时间为空，则以当前时间为插入时间
               if (Objects.isNull(baseDO.getCreateTime())) {
                   baseDO.setCreateTime(current);
               }
               // 更新时间为空，则以当前时间为更新时间
               if (Objects.isNull(baseDO.getUpdateTime())) {
                   baseDO.setUpdateTime(current);
               }
   
               Long userId = SecurityUtils.getUserId();
               // 当前登录用户不为空，创建人为空，则当前登录用户为创建人
               if (Objects.nonNull(userId) && Objects.isNull(baseDO.getCreator())) {
                   baseDO.setCreator(userId.toString());
               }
               // 当前登录用户不为空，更新人为空，则当前登录用户为更新人
               if (Objects.nonNull(userId) && Objects.isNull(baseDO.getUpdater())) {
                   baseDO.setUpdater(userId.toString());
               }
           }
       }
   
       @Override
       public void updateFill(MetaObject metaObject) {
           // 更新时间为空，则以当前时间为更新时间
           Object modifyTime = getFieldValByName("updateTime", metaObject);
           if (Objects.isNull(modifyTime)) {
               setFieldValByName("updateTime", new Date(), metaObject);
           }
   
           // 当前登录用户不为空，更新人为空，则当前登录用户为更新人
           Object modifier = getFieldValByName("updater", metaObject);
           Long userId = SecurityUtils.getUserId();
           if (Objects.nonNull(userId) && Objects.isNull(modifier)) {
               setFieldValByName("updater", userId.toString(), metaObject);
           }
       }
   }
   ```

   BaseMapperX在 MyBatis Plus 的 BaseMapper 的基础上拓展，提供更多的能力

   ```java
   public interface BaseMapperX<T> extends BaseMapper<T> {
   
       default PageResult<T> selectPage(PageParam pageParam, @Param("ew") Wrapper<T> queryWrapper) {
           // MyBatis Plus 查询
           IPage<T> mpPage = MyBatisUtils.buildPage(pageParam);
           selectPage(mpPage, queryWrapper);
           // 转换返回
           return new PageResult<>(mpPage.getRecords(), mpPage.getTotal());
       }
   
       default T selectOne(String field, Object value) {
           return selectOne(new QueryWrapper<T>().eq(field, value));
       }
   
       default T selectOne(SFunction<T, ?> field, Object value) {
           return selectOne(new LambdaQueryWrapper<T>().eq(field, value));
       }
   
       default T selectOne(String field1, Object value1, String field2, Object value2) {
           return selectOne(new QueryWrapper<T>().eq(field1, value1).eq(field2, value2));
       }
   
       default T selectOne(SFunction<T, ?> field1, Object value1, SFunction<T, ?> field2, Object value2) {
           return selectOne(new LambdaQueryWrapper<T>().eq(field1, value1).eq(field2, value2));
       }
   
       default Long selectCount() {
           return selectCount(new QueryWrapper<T>());
       }
   
       default Long selectCount(String field, Object value) {
           return selectCount(new QueryWrapper<T>().eq(field, value));
       }
   
       default Long selectCount(SFunction<T, ?> field, Object value) {
           return selectCount(new LambdaQueryWrapper<T>().eq(field, value));
       }
   
       default List<T> selectList() {
           return selectList(new QueryWrapper<>());
       }
   
       default List<T> selectList(String field, Object value) {
           return selectList(new QueryWrapper<T>().eq(field, value));
       }
   
       default List<T> selectList(SFunction<T, ?> field, Object value) {
           return selectList(new LambdaQueryWrapper<T>().eq(field, value));
       }
   
       default List<T> selectList(String field, Collection<?> values) {
           return selectList(new QueryWrapper<T>().in(field, values));
       }
   
       default List<T> selectList(SFunction<T, ?> field, Collection<?> values) {
           return selectList(new LambdaQueryWrapper<T>().in(field, values));
       }
   
       /**
        * 逐条插入，适合少量数据插入，或者对性能要求不高的场景
        *
        * 如果大量，请使用 {@link com.baomidou.mybatisplus.extension.service.impl.ServiceImpl#saveBatch(Collection)} 方法
        * 使用示例，可见 RoleMenuBatchInsertMapper、UserRoleBatchInsertMapper 类
        *
        * @param entities 实体们
        */
       default void insertBatch(Collection<T> entities) {
           entities.forEach(this::insert);
       }
   
       default void updateBatch(T update) {
           update(update, new QueryWrapper<>());
       }
   
   }
   ```

   PageParam

   ```java
   @ApiModel("分页参数")
   @Data
   public class PageParam implements Serializable {
   
       private static final Integer PAGE_NO = 1;
       private static final Integer PAGE_SIZE = 10;
   
       @ApiModelProperty(value = "页码，从 1 开始", required = true,example = "1")
       @NotNull(message = "页码不能为空")
       @Min(value = 1, message = "页码最小值为 1")
       private Integer pageNo = PAGE_NO;
   
       @ApiModelProperty(value = "每页条数，最大值为 100", required = true, example = "10")
       @NotNull(message = "每页条数不能为空")
       @Min(value = 1, message = "每页条数最小值为 1")
       @Max(value = 100, message = "每页条数最大值为 100")
       private Integer pageSize = PAGE_SIZE;
   
   }
   ```

   PageResult

   ```java
   public final class PageResult<T> implements Serializable {
   
       @ApiModelProperty(value = "数据", required = true)
       private List<T> list;
   
       @ApiModelProperty(value = "总量", required = true)
       private Long total;
   
       public PageResult() {
       }
   
       public PageResult(List<T> list, Long total) {
           this.list = list;
           this.total = total;
       }
   
       public PageResult(Long total) {
           this.list = new ArrayList<>();
           this.total = total;
       }
   
       public static <T> PageResult<T> empty() {
           return new PageResult<>(0L);
       }
   
       public static <T> PageResult<T> empty(Long total) {
           return new PageResult<>(total);
       }
   
   }
   ```

   SortingField排序字段 DTO

   ```java
   public class SortingField implements Serializable {
   
       /**
        * 顺序 - 升序
        */
       public static final String ORDER_ASC = "asc";
       /**
        * 顺序 - 降序
        */
       public static final String ORDER_DESC = "desc";
   
       /**
        * 字段
        */
       private String field;
       /**
        * 顺序
        */
       private String order;
   
       // 空构造方法，解决反序列化
       public SortingField() {
       }
   
       public SortingField(String field, String order) {
           this.field = field;
           this.order = order;
       }
   
       public String getField() {
           return field;
       }
   
       public SortingField setField(String field) {
           this.field = field;
           return this;
       }
   
       public String getOrder() {
           return order;
       }
   
       public SortingField setOrder(String order) {
           this.order = order;
           return this;
       }
   }
   ```

   LambdaQueryWrapperX拓展 MyBatis Plus QueryWrapper 类，主要增加如下功能：

   拼接条件的方法，增加 xxxIfPresent 方法，用于判断值不存在的时候，不要拼接到条件中。

   ```java
   public class LambdaQueryWrapperX<T> extends LambdaQueryWrapper<T> {
   
       public LambdaQueryWrapperX<T> likeIfPresent(SFunction<T, ?> column, String val) {
           if (StringUtils.hasText(val)) {
               return (LambdaQueryWrapperX<T>) super.like(column, val);
           }
           return this;
       }
   
       public LambdaQueryWrapperX<T> inIfPresent(SFunction<T, ?> column, Collection<?> values) {
           if (!CollectionUtils.isEmpty(values)) {
               return (LambdaQueryWrapperX<T>) super.in(column, values);
           }
           return this;
       }
   
       public LambdaQueryWrapperX<T> inIfPresent(SFunction<T, ?> column, Object... values) {
           if (!ArrayUtil.isEmpty(values)) {
               return (LambdaQueryWrapperX<T>) super.in(column, values);
           }
           return this;
       }
   
       public LambdaQueryWrapperX<T> eqIfPresent(SFunction<T, ?> column, Object val) {
           if (val != null) {
               return (LambdaQueryWrapperX<T>) super.eq(column, val);
           }
           return this;
       }
   
       public LambdaQueryWrapperX<T> neIfPresent(SFunction<T, ?> column, Object val) {
           if (val != null) {
               return (LambdaQueryWrapperX<T>) super.ne(column, val);
           }
           return this;
       }
   
       public LambdaQueryWrapperX<T> gtIfPresent(SFunction<T, ?> column, Object val) {
           if (val != null) {
               return (LambdaQueryWrapperX<T>) super.gt(column, val);
           }
           return this;
       }
   
       public LambdaQueryWrapperX<T> geIfPresent(SFunction<T, ?> column, Object val) {
           if (val != null) {
               return (LambdaQueryWrapperX<T>) super.ge(column, val);
           }
           return this;
       }
   
       public LambdaQueryWrapperX<T> ltIfPresent(SFunction<T, ?> column, Object val) {
           if (val != null) {
               return (LambdaQueryWrapperX<T>) super.lt(column, val);
           }
           return this;
       }
   
       public LambdaQueryWrapperX<T> leIfPresent(SFunction<T, ?> column, Object val) {
           if (val != null) {
               return (LambdaQueryWrapperX<T>) super.le(column, val);
           }
           return this;
       }
   
       public LambdaQueryWrapperX<T> betweenIfPresent(SFunction<T, ?> column, Object val1, Object val2) {
           if (val1 != null && val2 != null) {
               return (LambdaQueryWrapperX<T>) super.between(column, val1, val2);
           }
           if (val1 != null) {
               return (LambdaQueryWrapperX<T>) ge(column, val1);
           }
           if (val2 != null) {
               return (LambdaQueryWrapperX<T>) le(column, val2);
           }
           return this;
       }
   
       public LambdaQueryWrapperX<T> betweenIfPresent(SFunction<T, ?> column, Object[] values) {
           Object val1 = ArrayUtils.get(values, 0);
           Object val2 = ArrayUtils.get(values, 1);
           return betweenIfPresent(column, val1, val2);
       }
   
       // ========== 重写父类方法，方便链式调用 ==========
   
       @Override
       public LambdaQueryWrapperX<T> eq(boolean condition, SFunction<T, ?> column, Object val) {
           super.eq(condition, column, val);
           return this;
       }
   
       @Override
       public LambdaQueryWrapperX<T> eq(SFunction<T, ?> column, Object val) {
           super.eq(column, val);
           return this;
       }
   
       @Override
       public LambdaQueryWrapperX<T> orderByDesc(SFunction<T, ?> column) {
           super.orderByDesc(true, column);
           return this;
       }
   
       @Override
       public LambdaQueryWrapperX<T> last(String lastSql) {
           super.last(lastSql);
           return this;
       }
   
       @Override
       public LambdaQueryWrapperX<T> in(SFunction<T, ?> column, Collection<?> coll) {
           super.in(column, coll);
           return this;
       }
   
   }
   ```

   QueryWrapperX拓展 MyBatis Plus QueryWrapper 类，主要增加如下功能：

   拼接条件的方法，增加 xxxIfPresent 方法，用于判断值不存在的时候，不要拼接到条件中。

   ```java
   public class QueryWrapperX<T> extends QueryWrapper<T> {
   
       public QueryWrapperX<T> likeIfPresent(String column, String val) {
           if (StringUtils.hasText(val)) {
               return (QueryWrapperX<T>) super.like(column, val);
           }
           return this;
       }
   
       public QueryWrapperX<T> inIfPresent(String column, Collection<?> values) {
           if (!CollectionUtils.isEmpty(values)) {
               return (QueryWrapperX<T>) super.in(column, values);
           }
           return this;
       }
   
       public QueryWrapperX<T> inIfPresent(String column, Object... values) {
           if (!ArrayUtils.isEmpty(values)) {
               return (QueryWrapperX<T>) super.in(column, values);
           }
           return this;
       }
   
       public QueryWrapperX<T> eqIfPresent(String column, Object val) {
           if (val != null) {
               return (QueryWrapperX<T>) super.eq(column, val);
           }
           return this;
       }
   
       public QueryWrapperX<T> neIfPresent(String column, Object val) {
           if (val != null) {
               return (QueryWrapperX<T>) super.ne(column, val);
           }
           return this;
       }
   
       public QueryWrapperX<T> gtIfPresent(String column, Object val) {
           if (val != null) {
               return (QueryWrapperX<T>) super.gt(column, val);
           }
           return this;
       }
   
       public QueryWrapperX<T> geIfPresent(String column, Object val) {
           if (val != null) {
               return (QueryWrapperX<T>) super.ge(column, val);
           }
           return this;
       }
   
       public QueryWrapperX<T> ltIfPresent(String column, Object val) {
           if (val != null) {
               return (QueryWrapperX<T>) super.lt(column, val);
           }
           return this;
       }
   
       public QueryWrapperX<T> leIfPresent(String column, Object val) {
           if (val != null) {
               return (QueryWrapperX<T>) super.le(column, val);
           }
           return this;
       }
   
       public QueryWrapperX<T> betweenIfPresent(String column, Object val1, Object val2) {
           if (val1 != null && val2 != null) {
               return (QueryWrapperX<T>) super.between(column, val1, val2);
           }
           if (val1 != null) {
               return (QueryWrapperX<T>) ge(column, val1);
           }
           if (val2 != null) {
               return (QueryWrapperX<T>) le(column, val2);
           }
           return this;
       }
   
       public QueryWrapperX<T> betweenIfPresent(String column, Object[] values) {
           if (values!= null && values.length != 0 && values[0] != null && values[1] != null) {
               return (QueryWrapperX<T>) super.between(column, values[0], values[1]);
           }
           if (values!= null && values.length != 0 && values[0] != null) {
               return (QueryWrapperX<T>) ge(column, values[0]);
           }
           if (values!= null && values.length != 0 && values[1] != null) {
               return (QueryWrapperX<T>) le(column, values[1]);
           }
           return this;
       }
   
       // ========== 重写父类方法，方便链式调用 ==========
   
       @Override
       public QueryWrapperX<T> eq(boolean condition, String column, Object val) {
           super.eq(condition, column, val);
           return this;
       }
   
       @Override
       public QueryWrapperX<T> eq(String column, Object val) {
           super.eq(column, val);
           return this;
       }
   
       @Override
       public QueryWrapperX<T> orderByDesc(String column) {
           super.orderByDesc(true, column);
           return this;
       }
   
       @Override
       public QueryWrapperX<T> last(String lastSql) {
           super.last(lastSql);
           return this;
       }
   
       @Override
       public QueryWrapperX<T> in(String column, Collection<?> coll) {
           super.in(column, coll);
           return this;
       }
   
   }
   ```

   JdbcUtils JDBC 工具类

   ```java
   public class JdbcUtils {
   
       /**
        * 判断连接是否正确
        *
        * @param url      数据源连接
        * @param username 账号
        * @param password 密码
        * @return 是否正确
        */
       public static boolean isConnectionOK(String url, String username, String password) {
           try (Connection ignored = DriverManager.getConnection(url, username, password)) {
               return true;
           } catch (Exception ex) {
               return false;
           }
       }
   
       /**
        * 获得 URL 对应的 DB 类型
        *
        * @param url URL
        * @return DB 类型
        */
       public static DbType getDbType(String url) {
           String name = com.alibaba.druid.util.JdbcUtils.getDbType(url, null);
           return DbType.getDbType(name);
       }
   
   }
   ```

   MyBatisUtils MyBatis 工具类

   ```java
   public class MyBatisUtils {
   
       private static final String MYSQL_ESCAPE_CHARACTER = "`";
   
       public static <T> Page<T> buildPage(PageParam pageParam) {
           return buildPage(pageParam, null);
       }
   
       public static <T> Page<T> buildPage(PageParam pageParam, Collection<SortingField> sortingFields) {
           // 页码 + 数量
           Page<T> page = new Page<>(pageParam.getPageNo(), pageParam.getPageSize());
           // 排序字段
           if (!CollectionUtil.isEmpty(sortingFields)) {
               page.addOrder(sortingFields.stream().map(sortingField -> SortingField.ORDER_ASC.equals(sortingField.getOrder()) ?
                       OrderItem.asc(sortingField.getField()) : OrderItem.desc(sortingField.getField()))
                       .collect(Collectors.toList()));
           }
           return page;
       }
   
       /**
        * 将拦截器添加到链中
        * 由于 MybatisPlusInterceptor 不支持添加拦截器，所以只能全量设置
        *
        * @param interceptor 链
        * @param inner 拦截器
        * @param index 位置
        */
       public static void addInterceptor(MybatisPlusInterceptor interceptor, InnerInterceptor inner, int index) {
           List<InnerInterceptor> inners = new ArrayList<>(interceptor.getInterceptors());
           inners.add(index, inner);
           interceptor.setInterceptors(inners);
       }
   
       /**
        * 获得 Table 对应的表名
        *
        * 兼容 MySQL 转义表名 `t_xxx`
        *
        * @param table 表
        * @return 去除转移字符后的表名
        */
       public static String getTableName(Table table) {
           String tableName = table.getName();
           if (tableName.startsWith(MYSQL_ESCAPE_CHARACTER) && tableName.endsWith(MYSQL_ESCAPE_CHARACTER)) {
               tableName = tableName.substring(1, tableName.length() - 1);
           }
           return tableName;
       }
   
       /**
        * 构建 Column 对象
        *
        * @param tableName 表名
        * @param tableAlias 别名
        * @param column 字段名
        * @return Column 对象
        */
       public static Column buildColumn(String tableName, Alias tableAlias, String column) {
           return new Column(tableAlias != null ? tableAlias.getName() + "." + column : column);
       }
   
   }
   ```

7. 在common-core模块中，com.qingxinsaas.common.core.utils下添加collections包和工具类

   ArrayUtils Array 工具类

   ```java
   public class ArrayUtils {
   
       /**
        * 将 object 和 newElements 合并成一个数组
        *
        * @param object      对象
        * @param newElements 数组
        * @param <T>         泛型
        * @return 结果数组
        */
       @SafeVarargs
       public static <T> Consumer<T>[] append(Consumer<T> object, Consumer<T>... newElements) {
           if (object == null) {
               return newElements;
           }
           Consumer<T>[] result = ArrayUtil.newArray(Consumer.class, 1 + newElements.length);
           result[0] = object;
           System.arraycopy(newElements, 0, result, 1, newElements.length);
           return result;
       }
   
       public static <T, V> V[] toArray(Collection<T> from, Function<T, V> mapper) {
           return toArray(convertList(from, mapper));
       }
   
       @SuppressWarnings("unchecked")
       public static <T> T[] toArray(Collection<T> from) {
           if (CollectionUtil.isEmpty(from)) {
               return (T[]) (new Object[0]);
           }
           return ArrayUtil.toArray(from, (Class<T>) IterUtil.getElementType(from.iterator()));
       }
   
       public static <T> T get(T[] array, int index) {
           if (null == array || index >= array.length) {
               return null;
           }
           return array[index];
       }
   
   }
   ```

   CollectionUtils Collection 工具类

   ```java
   public class CollectionUtils {
   
       public static boolean containsAny(Object source, Object... targets) {
           return Arrays.asList(targets).contains(source);
       }
   
       public static boolean isAnyEmpty(Collection<?>... collections) {
           return Arrays.stream(collections).anyMatch(CollectionUtil::isEmpty);
       }
   
       public static <T> List<T> filterList(Collection<T> from, Predicate<T> predicate) {
           if (CollUtil.isEmpty(from)) {
               return new ArrayList<>();
           }
           return from.stream().filter(predicate).collect(Collectors.toList());
       }
   
       public static <T, R> List<T> distinct(Collection<T> from, Function<T, R> keyMapper) {
           if (CollUtil.isEmpty(from)) {
               return new ArrayList<>();
           }
           return distinct(from, keyMapper, (t1, t2) -> t1);
       }
   
       public static <T, R> List<T> distinct(Collection<T> from, Function<T, R> keyMapper, BinaryOperator<T> cover) {
           if (CollUtil.isEmpty(from)) {
               return new ArrayList<>();
           }
           return new ArrayList<>(convertMap(from, keyMapper, Function.identity(), cover).values());
       }
   
       public static <T, U> List<U> convertList(Collection<T> from, Function<T, U> func) {
           if (CollUtil.isEmpty(from)) {
               return new ArrayList<>();
           }
           return from.stream().map(func).filter(Objects::nonNull).collect(Collectors.toList());
       }
   
       public static <T, U> List<U> convertList(Collection<T> from, Function<T, U> func, Predicate<T> filter) {
           if (CollUtil.isEmpty(from)) {
               return new ArrayList<>();
           }
           return from.stream().filter(filter).map(func).filter(Objects::nonNull).collect(Collectors.toList());
       }
   
       public static <T, U> Set<U> convertSet(Collection<T> from, Function<T, U> func) {
           if (CollUtil.isEmpty(from)) {
               return new HashSet<>();
           }
           return from.stream().map(func).filter(Objects::nonNull).collect(Collectors.toSet());
       }
   
       public static <T, U> Set<U> convertSet(Collection<T> from, Function<T, U> func, Predicate<T> filter) {
           if (CollUtil.isEmpty(from)) {
               return new HashSet<>();
           }
           return from.stream().filter(filter).map(func).filter(Objects::nonNull).collect(Collectors.toSet());
       }
   
       public static <T, K> Map<K, T> convertMap(Collection<T> from, Function<T, K> keyFunc) {
           if (CollUtil.isEmpty(from)) {
               return new HashMap<>();
           }
           return convertMap(from, keyFunc, Function.identity());
       }
   
       public static <T, K> Map<K, T> convertMap(Collection<T> from, Function<T, K> keyFunc, Supplier<? extends Map<K, T>> supplier) {
           if (CollUtil.isEmpty(from)) {
               return supplier.get();
           }
           return convertMap(from, keyFunc, Function.identity(), supplier);
       }
   
       public static <T, K, V> Map<K, V> convertMap(Collection<T> from, Function<T, K> keyFunc, Function<T, V> valueFunc) {
           if (CollUtil.isEmpty(from)) {
               return new HashMap<>();
           }
           return convertMap(from, keyFunc, valueFunc, (v1, v2) -> v1);
       }
   
       public static <T, K, V> Map<K, V> convertMap(Collection<T> from, Function<T, K> keyFunc, Function<T, V> valueFunc, BinaryOperator<V> mergeFunction) {
           if (CollUtil.isEmpty(from)) {
               return new HashMap<>();
           }
           return convertMap(from, keyFunc, valueFunc, mergeFunction, HashMap::new);
       }
   
       public static <T, K, V> Map<K, V> convertMap(Collection<T> from, Function<T, K> keyFunc, Function<T, V> valueFunc, Supplier<? extends Map<K, V>> supplier) {
           if (CollUtil.isEmpty(from)) {
               return supplier.get();
           }
           return convertMap(from, keyFunc, valueFunc, (v1, v2) -> v1, supplier);
       }
   
       public static <T, K, V> Map<K, V> convertMap(Collection<T> from, Function<T, K> keyFunc, Function<T, V> valueFunc, BinaryOperator<V> mergeFunction, Supplier<? extends Map<K, V>> supplier) {
           if (CollUtil.isEmpty(from)) {
               return new HashMap<>();
           }
           return from.stream().collect(Collectors.toMap(keyFunc, valueFunc, mergeFunction, supplier));
       }
   
       public static <T, K> Map<K, List<T>> convertMultiMap(Collection<T> from, Function<T, K> keyFunc) {
           if (CollUtil.isEmpty(from)) {
               return new HashMap<>();
           }
           return from.stream().collect(Collectors.groupingBy(keyFunc, Collectors.mapping(t -> t, Collectors.toList())));
       }
   
       public static <T, K, V> Map<K, List<V>> convertMultiMap(Collection<T> from, Function<T, K> keyFunc, Function<T, V> valueFunc) {
           if (CollUtil.isEmpty(from)) {
               return new HashMap<>();
           }
           return from.stream()
                   .collect(Collectors.groupingBy(keyFunc, Collectors.mapping(valueFunc, Collectors.toList())));
       }
   
       // 暂时没想好名字，先以 2 结尾噶
       public static <T, K, V> Map<K, Set<V>> convertMultiMap2(Collection<T> from, Function<T, K> keyFunc, Function<T, V> valueFunc) {
           if (CollUtil.isEmpty(from)) {
               return new HashMap<>();
           }
           return from.stream().collect(Collectors.groupingBy(keyFunc, Collectors.mapping(valueFunc, Collectors.toSet())));
       }
   
       public static <T, K> Map<K, T> convertImmutableMap(Collection<T> from, Function<T, K> keyFunc) {
           if (CollUtil.isEmpty(from)) {
               return Collections.emptyMap();
           }
           ImmutableMap.Builder<K, T> builder = ImmutableMap.builder();
           from.forEach(item -> builder.put(keyFunc.apply(item), item));
           return builder.build();
       }
   
       public static boolean containsAny(Collection<?> source, Collection<?> candidates) {
           return org.springframework.util.CollectionUtils.containsAny(source, candidates);
       }
   
       public static <T> T getFirst(List<T> from) {
           return !CollectionUtil.isEmpty(from) ? from.get(0) : null;
       }
   
       public static <T> T findFirst(List<T> from, Predicate<T> predicate) {
           if (CollUtil.isEmpty(from)) {
               return null;
           }
           return from.stream().filter(predicate).findFirst().orElse(null);
       }
   
       public static <T, V extends Comparable<? super V>> V getMaxValue(List<T> from, Function<T, V> valueFunc) {
           if (CollUtil.isEmpty(from)) {
               return null;
           }
           assert from.size() > 0; // 断言，避免告警
           T t = from.stream().max(Comparator.comparing(valueFunc)).get();
           return valueFunc.apply(t);
       }
   
       public static <T> void addIfNotNull(Collection<T> coll, T item) {
           if (item == null) {
               return;
           }
           coll.add(item);
       }
   
       public static <T> Collection<T> singleton(T deptId) {
           return deptId == null ? Collections.emptyList() : Collections.singleton(deptId);
       }
   
   }
   ```

   KeyValue Key Value 的键值对

   ```java
   @Data
   @NoArgsConstructor
   @AllArgsConstructor
   public class KeyValue<K, V> {
   
       private K key;
       private V value;
   
   }
   ```

   MapUtils Map 工具类

   ```java
   public class MapUtils {
   
       /**
        * 从哈希表表中，获得 keys 对应的所有 value 数组
        *
        * @param multimap 哈希表
        * @param keys keys
        * @return value 数组
        */
       public static <K, V> List<V> getList(Multimap<K, V> multimap, Collection<K> keys) {
           List<V> result = new ArrayList<>();
           keys.forEach(k -> {
               Collection<V> values = multimap.get(k);
               if (CollectionUtil.isEmpty(values)) {
                   return;
               }
               result.addAll(values);
           });
           return result;
       }
   
       /**
        * 从哈希表查找到 key 对应的 value，然后进一步处理
        * 注意，如果查找到的 value 为 null 时，不进行处理
        *
        * @param map 哈希表
        * @param key key
        * @param consumer 进一步处理的逻辑
        */
       public static <K, V> void findAndThen(Map<K, V> map, K key, Consumer<V> consumer) {
           if (CollUtil.isEmpty(map)) {
               return;
           }
           V value = map.get(key);
           if (value == null) {
               return;
           }
           consumer.accept(value);
       }
   
       public static <K, V> Map<K, V> convertMap(List<KeyValue<K, V>> keyValues) {
           Map<K, V> map = Maps.newLinkedHashMapWithExpectedSize(keyValues.size());
           keyValues.forEach(keyValue -> map.put(keyValue.getKey(), keyValue.getValue()));
           return map;
       }
   
   }
   ```

   SetUtils Set 工具类

   ```java
   public class SetUtils {
   
       public static <T> Set<T> asSet(T... objs) {
           return new HashSet<>(Arrays.asList(objs));
       }
   
   }
   ```

   

8. 添加上面文件使用到的对应的第三方依赖

   - 在项目pom中添加依赖管理

     ```
     <lombok.version>1.18.12</lombok.version>
     <knife4j.version>3.0.3</knife4j.version>
     <hutool.version>5.8.5</hutool.version>
     <mapstruct.version>1.4.1.Final</mapstruct.version>
     
     <!-- Lombok能以简单的注解形式来简化java代码，提高开发效率-->
     <dependency>
     	<groupId>org.projectlombok</groupId>
     	<artifactId>lombok</artifactId>
     	<optional>true</optional>
     	<version>${lombok.version}</version>
     </dependency>
     
     <!-- knife4j -->
     <dependency>
     	<groupId>com.github.xiaoymin</groupId>
     	<artifactId>knife4j-spring-boot-starter</artifactId>
     	<version>${knife4j.version}</version>
     	<exclusions>
     		<exclusion>
     			<artifactId>mapstruct</artifactId>
     			<groupId>org.mapstruct</groupId> <!-- 避免冲突 -->
     		</exclusion>
     		<exclusion>
     			<groupId>io.springfox</groupId>
     			<artifactId>springfox-boot-starter</artifactId>
     		</exclusion>
     		<exclusion>
     			<groupId>io.springfox</groupId>
     			<artifactId>springfox-swagger</artifactId>
     		</exclusion>
     	</exclusions>
     </dependency>
     
     <!-- 工具包 -->
     <dependency>
     	<groupId>cn.hutool</groupId>
     	<artifactId>hutool-all</artifactId>
     	<version>${hutool.version}</version>
     </dependency>
     
     <!-- Druid -->
     <dependency>
     	<groupId>com.alibaba</groupId>
     	<artifactId>druid-spring-boot-starter</artifactId>
     	<version>${druid.version}</version>
     </dependency>
     
     <dependency>
     	<groupId>org.mapstruct</groupId>
     	<artifactId>mapstruct</artifactId> <!-- use mapstruct-jdk8 for Java 8 or higher -->
     	<version>${mapstruct.version}</version>
     </dependency>
     <dependency>
     	<groupId>org.mapstruct</groupId>
     	<artifactId>mapstruct-jdk8</artifactId>
     	<version>${mapstruct.version}</version>
     </dependency>
     <dependency>
     	<groupId>org.mapstruct</groupId>
     	<artifactId>mapstruct-processor</artifactId>
     	<version>${mapstruct.version}</version>
     </dependency>
     ```

   - 在mybatis-plus模块中引入依赖

     ```
             <!-- lombok -->
             <dependency>
                 <groupId>org.projectlombok</groupId>
                 <artifactId>lombok</artifactId>
                 <optional>true</optional>
             </dependency>
     
             <!-- 工具包 -->
             <dependency>
                 <groupId>cn.hutool</groupId>
                 <artifactId>hutool-all</artifactId>
             </dependency>
     
             <!-- Druid -->
             <dependency>
                 <groupId>com.alibaba</groupId>
                 <artifactId>druid-spring-boot-starter</artifactId>
             </dependency>
     
             <!-- knife4j -->
             <dependency>
                 <groupId>com.github.xiaoymin</groupId>
                 <artifactId>knife4j-spring-boot-starter</artifactId>
             </dependency>
     
             <dependency>
                 <groupId>org.mapstruct</groupId>
                 <artifactId>mapstruct</artifactId> <!-- use mapstruct-jdk8 for Java 8 or higher -->
             </dependency>
             <dependency>
                 <groupId>org.mapstruct</groupId>
                 <artifactId>mapstruct-jdk8</artifactId>
             </dependency>
             <dependency>
                 <groupId>org.mapstruct</groupId>
                 <artifactId>mapstruct-processor</artifactId>
             </dependency>
     ```

9. 在common-core的pom文件中引入对应依赖

   ```
           <!-- lombok -->
           <dependency>
               <groupId>org.projectlombok</groupId>
               <artifactId>lombok</artifactId>
               <optional>true</optional>
           </dependency>
   
           <!-- 工具包 -->
           <dependency>
               <groupId>cn.hutool</groupId>
               <artifactId>hutool-all</artifactId>
           </dependency>
   
           <!-- knife4j -->
           <dependency>
               <groupId>com.github.xiaoymin</groupId>
               <artifactId>knife4j-spring-boot-starter</artifactId>
           </dependency>
   
           <dependency>
               <groupId>org.mapstruct</groupId>
               <artifactId>mapstruct</artifactId> <!-- use mapstruct-jdk8 for Java 8 or higher -->
           </dependency>
           <dependency>
               <groupId>org.mapstruct</groupId>
               <artifactId>mapstruct-jdk8</artifactId>
           </dependency>
           <dependency>
               <groupId>org.mapstruct</groupId>
               <artifactId>mapstruct-processor</artifactId>
           </dependency>
   ```

10. 在需要使用mybatis-plus的模块下引入mybatis-plus的模块的依赖

    例如：在modules-system的pom中引入mybatis-plus的模块

    <img src="..\pic\modules-system1.png" alt="avatar" />

11. 更新nacos中modules-system模块的mybatis-plus的配置文件

    <img src="..\pic\nacos1.png" alt="avatar" />

12. 在对应xxxService，xxxServiceImpl，xxxMapper继承IService<T>，ServiceImpl<M,T>，BaseMapperX<T>配置Mybatis-Plus

    ```java
    public interface ISysDeptService extends IService<SysDept>
    public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper,SysDept> implements ISysDeptService
    public interface SysDeptMapper extends BaseMapperX<SysDept>
    
    public interface ISysDictDataService extends IService<SysDictData>
    public class SysDictDataServiceImpl extends ServiceImpl<SysDictDataMapper, SysDictData> implements ISysDictDataService
    public interface SysDictDataMapper extends BaseMapperX<SysDictData>
        
    public interface ISysDictTypeService extends IService<SysDictType>
    public class SysDictTypeServiceImpl extends ServiceImpl<SysDictTypeMapper, SysDictType> implements ISysDictTypeService
    public interface SysDictTypeMapper extends BaseMapperX<SysDictType>
    
    public interface ISysMenuService extends IService<SysMenu>
    public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper,SysMenu> implements ISysMenuService
    public interface SysMenuMapper extends BaseMapperX<SysMenu>
        
    public interface ISysPostService extends IService<SysPost>
    public class SysPostServiceImpl extends ServiceImpl<SysPostMapper,SysPost> implements ISysPostService
    public interface SysPostMapper extends BaseMapperX<SysPost>
        
    public interface ISysRoleService extends IService<SysRole>
    public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper,SysRole> implements ISysRoleService
    public interface SysRoleMapper extends BaseMapperX<SysRole>
        
    public interface ISysUserService extends IService<SysUser>
    public class SysUserServiceImpl extends ServiceImpl<SysUserMapper,SysUser> implements ISysUserService
    public interface SysUserMapper extends BaseMapperX<SysUser>
    ```

13. 在qingxinsaas-api-system模块添加mybatis-plus-annotation

    ```
    <!-- mybatis-plus -->
    <dependency>
    	<groupId>com.baomidou</groupId>
    	<artifactId>mybatis-plus-annotation</artifactId>
    	<version>3.5.4</version>
    </dependency>
    ```

14. 在对应的domian实体加上@TableId注解，使mybatis-plus能够识别

    ```java
    	/** 部门ID */
        @TableId(type = IdType.AUTO)
        private Long deptId;
    
        /** 字典编码 */
        @Excel(name = "字典编码", cellType = ColumnType.NUMERIC)
        @TableId(type = IdType.AUTO)
        private Long dictCode;
    
        /** 字典主键 */
        @Excel(name = "字典主键", cellType = ColumnType.NUMERIC)
        @TableId(type = IdType.AUTO)
        private Long dictId;
    
        /** 角色ID */
        @Excel(name = "角色序号", cellType = ColumnType.NUMERIC)
        @TableId(type = IdType.AUTO)
        private Long roleId;
    
        /** 用户ID */
        @Excel(name = "用户序号", type = Type.EXPORT, cellType = ColumnType.NUMERIC, prompt = "用户编号")
        @TableId(type = IdType.AUTO)
        private Long userId;
    
        /** 菜单ID */
        @TableId(type = IdType.AUTO)
        private Long menuId;
    
        /** 岗位序号 */
        @Excel(name = "岗位序号", cellType = ColumnType.NUMERIC)
        @TableId(type = IdType.AUTO)
        private Long postId;
    ```

15. 启动modules-system模块测试

    <img src="..\pic\modules-system2.png" alt="avatar" />
