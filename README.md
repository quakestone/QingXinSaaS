<p align="center">
	<img alt="logo" src="https://oscimg.oschina.net/oscnet/up-b99b286755aef70355a7084753f89cdb7c9.png">
</p>
<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">氢信SaaS基座</h1>
<h4 align="center">基于 Vue/Element UI 和 Spring Cloud & Alibaba 前后端分离的分布式微服务架构</h4>


## 平台简介

氢信SaaS基座为中大型企业提供灵活、可扩展的云服务解决方案，支持多租户管理、业务流程管理（BPM）、支付集成、区块链、商业智能（BI）和即时通讯（IM）等功能模块，毫无保留给个人及企业免费使用。

* 采用前后端分离的模式，微服务版本前端(基于 [RuoYi-Vue](https://gitee.com/y_project/RuoYi-Vue))。
* 后端采用Spring Cloud & Alibaba。
* 注册中心、配置中心选型Nacos，权限认证使用Redis。
* 流量控制框架选型Sentinel，分布式事务选型Seata。

## 系统模块

~~~
com.ruoyi     
├── ruoyi-ui              // 前端框架 [80]
├── ruoyi-gateway         // 网关模块 [8080]
├── ruoyi-auth            // 认证中心 [9200]
├── ruoyi-api             // 接口模块
│       └── ruoyi-api-system                          // 系统接口
├── ruoyi-common          // 通用模块
│       └── ruoyi-common-core                         // 核心模块
│       └── ruoyi-common-datascope                    // 权限范围
│       └── ruoyi-common-datasource                   // 多数据源
│       └── ruoyi-common-log                          // 日志记录
│       └── ruoyi-common-redis                        // 缓存服务
│       └── ruoyi-common-seata                        // 分布式事务
│       └── ruoyi-common-security                     // 安全模块
│       └── ruoyi-common-swagger                      // 系统接口
├── ruoyi-modules         // 业务模块
│       └── ruoyi-system                              // 系统模块 [9201]
│       └── ruoyi-gen                                 // 代码生成 [9202]
│       └── ruoyi-job                                 // 定时任务 [9203]
│       └── ruoyi-file                                // 文件服务 [9300]
├── ruoyi-visual          // 图形化管理模块
│       └── ruoyi-visual-monitor                      // 监控中心 [9100]
├──pom.xml                // 公共依赖
~~~

## 架构图

<img src="https://oscimg.oschina.net/oscnet/up-82e9722ecb846786405a904bafcf19f73f3.png"/>

## 五位一体（核心功能）

* **SaaS多租户**

  多租户的数据隔离采用方案：

  DATASOURCE 模式：独立数据库

  一个租户一个数据库，这种方案的用户数据隔离级别最高，安全性最好。

  1. **层级关系**

     •	租户A是上级租户，拥有对子租户B和C的管理权限。

  ​	•	租户B和租户C是租户A的子租户，但它们之间相互独立。

  2. **权限授予**

     •	租户A负责定义和分配租户B的基础权限（如角色和菜单）。

  ​	•	租户B会将其最高权限账户信息同步给租户A和总租户，以便上级能监管和访问关键账户。

  3. **权限管理与隔离**

     •	租户级权限隔离：租户B的所有用户、部门和岗位的权限设置仅在租户B的数据库中生效，其他租户（如租户C）无法访问。

     •	RBAC模型应用：租户B可独立管理自己的用户、部门、岗位和角色，按照自己的业务需求定义权限策略。

  4. **数据权限过滤**

     •	部门、岗位、角色的权限过滤：这些数据访问规则只适用于租户B内部，即用户在租户B中的权限不会影响租户A或其他租户。

  **总结**：

  ​	在RBAC框架下，租户A定义和控制子租户B的权限边界，但租户B在此基础上具备对自己用户、部门和岗位的自主管理能力，并且所有权限控制严格限定在各自租户的数据范围内。

  ​	在租户 b 向租户 a 和总租户同步其最高权限账户信息时，涉及数据源切换与数据插入的操作。由于这种场景涉及多个数据源，需要确保事务的一致性。

  l **多数据源事务管理**

  ​	在这种情况下，项目中可以使用 Dynamic Datasource 提供的 @DSTransactional 注解来实现多数据源下的事务管理。@DSTransactional 适用于单机环境下的多数据源操作，能够支持在同一个事务中切换数据源。相比传统的 @Transactional，@Transactional 在多数据源场景下无法自动切换数据源，而 @DSTransactional 可以有效解决这个问题。

  l **避免分布式事务开销**

  ​	对于项目中仅涉及简单的数据源切换操作，可以避免引入分布式事务框架（如 Seata）。虽然 Seata 可以用于微服务架构中的分布式事务，但由于其较低的效率和较大的开销，在本项目中并不适合。因此，使用 @DSTransactional 注解可以更高效地处理多数据源的事务。

  ​	这样设计可以有效解决租户信息同步时多数据源切换的需求，同时避免了分布式事务带来的性能瓶颈。

* **RBAC权限管理**

  ​	为了在 RuoYi-Vue 框架下实现多租户环境中的权限管理，基于 RBAC 模型扩展了租户维度的权限设计，涉及以下几个核心表结构：

  l **sys_tenant（租户表）**

  ​	存储租户的基础信息，如租户名称、状态、套餐类型等。每个租户都有唯一标识，以便区分不同租户的权限体系。

  l **sys_user_tenant（用户-租户关联表）**

  ​	用于关联用户与租户的关系，记录用户属于哪个租户。一个用户可以属于多个租户，通过该表来实现多租户的用户身份管理。该表的关键字段包括用户 ID、租	户 ID，以及用户在该租户中的角色或权限等级。

  l **sys_tenant_menu（租户-菜单权限表）**

  ​	存储每个租户的菜单权限配置，控制租户能访问哪些功能模块。通过该表，租户可以根据其套餐类型或定制化需求，分配不同的菜单权限。

* **登录**

  **l** **租户区分**

  ​	在多租户系统中，用户登录时首先输入 Tenant 信息（即租户标识），系统根据这个 Tenant 确定要连接的租户数据库。这一过程在总租户库中查找该租户的配置信息，以动态切换到该租户的独立数据源

  **l** **身份验证**

  ​	用户（如 zhangsan）在租户 a 和租户 b 中密码相同，但登录时，系统会依据用户选择的 Tenant 来定位具体的租户库，然后在对应的租户库中校验用户的登录信息。因此，即便 zhangsan 在两个租户中的密码相同，系统仍会根据用户输入的 Tenant 来决定应该连接哪个租户库进行登录验证。

  **l** **权限控制**

  ​	RBAC 体系下，zhangsan 的权限是基于角色的，不同租户会为其分配不同的角色和权限。虽然用户 zhangsan 在租户 a 和租户 b 中可以成功登录，但他在两个租户中的权限取决于在每个租户中被分配的角色。也就是说，系统会从当前租户的数据库中获取他对应的角色及其权限信息，并根据这些角色来控制他在该租户下的操作权限。

  ​	-角色：每个租户为用户定义不同的角色，例如在租户 a 中可能分配 Admin 角色，而在租户 b 中可能分配 User 角色。

  ​	-权限：基于角色的权限差异，使得 zhangsan 在租户 a 中可能拥有管理员级别的权限，而在租户 b 中可能只有普通用户的权限。

  **总结：**

  ​	在 RBAC 框架下，尽管用户在多个租户中可以使用相同的凭据登录，但每个租户会为该用户分配独立的角色与权限，决定他在该租户下的访问控制策略。这种分离使得同一用户在不同租户的权限范围完全独立。

* **API网关**

  ​	API 网关的主要功能是将请求转发至由不同语言实现的 Restful API 服务。各租户的 Restful API 服务配置由总租户统一管理。

  ​	在氢信 SaaS 基座中，API 网关的核心作用是请求转发，且响应格式为 JSON。然而，面对大量 JSON 数据时，数据隔离难度较大。因此，数据隔离工作在其他服务中完成，处理后的数据再返回给基座，由基座最终返回给前端。

  ​	在转发请求时，API 网关会在请求头中添加相应的 Tenant 信息，其他服务通过该 Tenant 值切换数据源或进行数据隔离。经过隔离后的数据以 JSON 格式返回给基座，再由基座传递给前端。

* **Flowable工作流**

  ​	在项目中，Flowable 工作流引擎的核心表共用存储在总租户库中。项目启动时，工作流引擎会初始化并确定使用的工作流引擎表数据源，这一选择在初始化后不可更改。

  ​	为了实现流程数据的租户级隔离，在创建租户时，系统会为每个租户初始化独立的流程数据表。这样，每个租户的工作流数据可以存储在各自的表中，与其他租户完全隔离。具体设计如下：

  **l** **工作流引擎表共用：**

  ​	工作流引擎的核心配置表（如流程定义、任务配置等）统一存放在总租户库中，确保全局的流程配置管理。这些表在项目启动时初始化并与总租户库绑定，后续不允许切换数据源。

  **l** **流程数据表独立：**

  ​	为了确保租户的流程数据隔离，每当创建一个新租户时，系统会为该租户生成独立的流程实例数据表、任务数据表等。这些表用于存储该租户的工作流运行数据，确保不同租户之间的数据相互隔离，不会互相干扰。

  **l** **租户级隔离优势：**

  ​	通过为每个租户初始化独立的流程数据表，能够实现以下目标：数据安全：不同租户的流程数据完全隔离，确保租户之间无法访问或影响彼此的数据。性能优化：租户独立的数据表设计有助于分散工作流引擎的负载，避免在大规模多租户场景下出现性能瓶颈。

  **l** **设计灵活性：**

  ​	这种设计使得租户的流程数据隔离不仅局限于数据库逻辑层，也可以根据需要进一步实现物理数据库隔离，提供更多的部署和扩展灵活性。

## 内置功能

1.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.  部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
3.  岗位管理：配置系统用户所属担任职务。
4.  菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5.  角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7.  参数管理：对系统动态配置常用参数。
8.  通知公告：系统通知公告信息发布维护。
9.  操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
10.  登录日志：系统登录日志记录查询包含登录异常。
11.  在线用户：当前系统中活跃用户状态监控。
12.  定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
13.  代码生成：前后端代码的生成（java、html、xml、sql）支持CRUD下载 。
14.  系统接口：根据业务代码自动生成相关的api接口文档。
15.  服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
16.  在线构建器：拖动表单元素生成相应的HTML代码。
17.  连接池监视：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。
18.  租户管理：实现租户管理与权限控制

## 在线体验

- admin/admin123  
- 陆陆续续收到一些打赏，为了更好的体验已用于演示服务器升级。谢谢各位小伙伴。

演示地址：http://ruoyi.vip  

## 演示图

<table>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/cd1f90be5f2684f4560c9519c0f2a232ee8.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/1cbcf0e6f257c7d3a063c0e3f2ff989e4b3.jpg"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-8074972883b5ba0622e13246738ebba237a.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-9f88719cdfca9af2e58b352a20e23d43b12.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-39bf2584ec3a529b0d5a3b70d15c9b37646.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-4148b24f58660a9dc347761e4cf6162f28f.png"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-b2d62ceb95d2dd9b3fbe157bb70d26001e9.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-d67451d308b7a79ad6819723396f7c3d77a.png"/></td>
    </tr>	 
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/5e8c387724954459291aafd5eb52b456f53.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/644e78da53c2e92a95dfda4f76e6d117c4b.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-8370a0d02977eebf6dbf854c8450293c937.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-49003ed83f60f633e7153609a53a2b644f7.png"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-d4fe726319ece268d4746602c39cffc0621.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-c195234bbcd30be6927f037a6755e6ab69c.png"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-ece3fd37a3d4bb75a3926e905a3c5629055.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-92ffb7f3835855cff100fa0f754a6be0d99.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-ff9e3066561574aca73005c5730c6a41f15.png"/></td>
    </tr>
</table>
