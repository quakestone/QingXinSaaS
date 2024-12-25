<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
      <el-form-item :label="$t('h.system.menu.menuName')" prop="menuName">
        <el-input
          v-model="queryParams.menuName"
          :placeholder="$t('h.system.menu.pleaseInputMenuName')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('h.system.menu.status')" prop="status">
        <el-select v-model="queryParams.status" :placeholder="$t('h.system.menu.status')" clearable>
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">{{$t('h.system.menu.search')}}</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">{{$t('h.system.menu.reset')}}</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:menu:add']"
        >{{$t('h.system.menu.add')}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-sort"
          size="mini"
          @click="toggleExpandAll"
        >{{$t('h.system.menu.expandCollapse')}}</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="menuList"
      row-key="menuId"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column prop="menuName" :label="$t('h.system.menu.menuName')" :show-overflow-tooltip="true" width="160"></el-table-column>
      <el-table-column prop="icon" :label="$t('h.system.menu.icon')" align="center" width="100">
        <template slot-scope="scope">
          <svg-icon :icon-class="scope.row.icon" />
        </template>
      </el-table-column>
      <el-table-column prop="orderNum" :label="$t('h.system.menu.orderNum')" width="60"></el-table-column>
      <el-table-column prop="perms" :label="$t('h.system.menu.perms')" :show-overflow-tooltip="true"></el-table-column>
      <el-table-column prop="component" :label="$t('h.system.menu.component')" :show-overflow-tooltip="true"></el-table-column>
      <el-table-column prop="status" :label="$t('h.system.menu.status')" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column :label="$t('h.system.menu.createTime')" align="center" prop="createTime">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column :label="$t('h.system.menu.operation')" align="center" class="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:menu:edit']"
          >{{$t('h.system.menu.update')}}</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAdd(scope.row)"
            v-hasPermi="['system:menu:add']"
          >{{$t('h.system.menu.add')}}</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:menu:remove']"
          >{{$t('h.system.menu.delete')}}</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改菜单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="680px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item :label="$t('h.system.menu.parentMenu')" prop="parentId">
              <treeselect
                v-model="form.parentId"
                :options="menuOptions"
                :normalizer="normalizer"
                :show-count="true"
                :placeholder="$t('h.system.menu.pleaseSelectParentMenu')"
              />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item :label="$t('h.system.menu.menuType')" prop="menuType">
              <el-radio-group v-model="form.menuType">
                <el-radio label="M">{{$t('h.system.menu.directory')}}</el-radio>
                <el-radio label="C">{{$t('h.system.menu.menuItem')}}</el-radio>
                <el-radio label="F">{{$t('h.system.menu.button')}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="24" v-if="form.menuType!= 'F'">
            <el-form-item :label="$t('h.system.menu.icon')" prop="icon">
              <el-popover
                placement="bottom-start"
                width="460"
                trigger="click"
                @show="$refs['iconSelect'].reset()"
              >
                <IconSelect ref="iconSelect" @selected="selected" :active-icon="form.icon" />
                <el-input slot="reference" v-model="form.icon" :placeholder="$t('h.system.menu.pleaseSelectIcon')" readonly>
                  <svg-icon
                    v-if="form.icon"
                    slot="prefix"
                    :icon-class="form.icon"
                    style="width: 25px;"
                  />
                  <i v-else slot="prefix" class="el-icon-search el-input__icon" />
                </el-input>
              </el-popover>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('h.system.menu.menuName')" prop="menuName">
              <el-input v-model="form.menuName" :placeholder="$t('h.system.menu.pleaseInputMenuName')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('h.system.menu.orderNum')" prop="orderNum">
              <el-input-number v-model="form.orderNum" controls-position="right" :min="0" />
            </el-form-item>
          </el-col>
          <el-col :span="12" v-if="form.menuType!= 'F'">
            <el-form-item prop="isFrame">
              <span slot="label">
                <el-tooltip content="选择是外链则路由地址需要以`http(s)://`开头" placement="top">
                <i class="el-icon-question"></i>
                </el-tooltip>
                {{$t('h.system.menu.isFrame')}}
              </span>
              <el-radio-group v-model="form.isFrame">
                <el-radio label="0">{{$t('h.system.menu.yes')}}</el-radio>
                <el-radio label="1">{{$t('h.system.menu.no')}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12" v-if="form.menuType!= 'F'">
            <el-form-item prop="path">
              <span slot="label">
                <el-tooltip content="访问的路由地址，如：`user`，如外网地址需内链访问则以`http(s)://`开头" placement="top">
                <i class="el-icon-question"></i>
                </el-tooltip>
                {{$t('h.system.menu.path')}}
              </span>
              <el-input v-model="form.path" :placeholder="$t('h.system.menu.pleaseInputRouteAddress')" />
            </el-form-item>
          </el-col>
          <el-col :span="12" v-if="form.menuType == 'C'">
            <el-form-item prop="component">
              <span slot="label">
                <el-tooltip content="访问的组件路径，如：`system/user/index`，默认在`views`目录下" placement="top">
                <i class="el-icon-question"></i>
                </el-tooltip>
                {{$t('h.system.menu.component')}}
              </span>
              <el-input v-model="form.component" :placeholder="$t('h.system.menu.pleaseInputComponentPath')" />
            </el-form-item>
          </el-col>
          <el-col :span="12" v-if="form.menuType!= 'F'">
            <el-form-item prop="perms">
              <el-input v-model="form.perms" :placeholder="$t('h.system.menu.pleaseInputPermissionIdentifier')" maxlength="100" />
              <span slot="label">
                <el-tooltip content="控制器中定义的权限字符，如：@PreAuthorize(`@ss.hasPermi('system:user:list')`)" placement="top">
                <i class="el-icon-question"></i>
                </el-tooltip>
                {{$t('h.system.menu.permissionCharacter')}}
              </span>
            </el-form-item>
          </el-col>
          <el-col :span="12" v-if="form.menuType == 'C'">
            <el-form-item prop="query">
                <el-input v-model="form.query" :placeholder="$t('h.system.menu.pleaseInputRouteParameter')" maxlength="255" />
                <span slot="label">
                    <el-tooltip content='访问路由的默认传递参数，如：`{"id": 1, "name": "ry"}`' placement="top">
                    <i class="el-icon-question"></i>
                    </el-tooltip>
                    {{$t('h.system.menu.routeParameter')}}
                </span>
            </el-form-item>
        </el-col>
        <el-col :span="12" v-if="form.menuType == 'C'">
            <el-form-item prop="isCache">
                <span slot="label">
                    <el-tooltip content="选择是则会被`keep-alive`缓存，需要匹配组件的`name`和地址保持一致" placement="top">
                    <i class="el-icon-question"></i>
                    </el-tooltip>
                    {{$t('h.system.menu.isCached')}}
                </span>
                <el-radio-group v-model="form.isCache">
                    <el-radio label="0">{{$t('h.system.menu.cache')}}</el-radio>
                    <el-radio label="1">{{$t('h.system.menu.notCache')}}</el-radio>
                </el-radio-group>
            </el-form-item>
        </el-col>
        <el-col :span="12" v-if="form.menuType!= 'F'">
            <el-form-item prop="visible">
                <span slot="label">
                    <el-tooltip content="选择隐藏则路由将不会出现在侧边栏，但仍然可以访问" placement="top">
                    <i class="el-icon-question"></i>
                    </el-tooltip>
                    {{$t('h.system.menu.visibleStatus')}}
                </span>
                <el-radio-group v-model="form.visible">
                    <el-radio
                        v-for="dict in dict.type.sys_show_hide"
                        :key="dict.value"
                        :label="dict.value"
                    >{{dict.label}}</el-radio>
                </el-radio-group>
            </el-form-item>
        </el-col>
        <el-col :span="12">
            <el-form-item prop="status">
                <span slot="label">
                    <el-tooltip content="选择停用则路由将不会出现在侧边栏，也不能被访问" placement="top">
                    <i class="el-icon-question"></i>
                    </el-tooltip>
                    {{$t('h.system.menu.menuStatus')}}
                </span>
                <el-radio-group v-model="form.status">
                    <el-radio
                        v-for="dict in dict.type.sys_normal_disable"
                        :key="dict.value"
                        :label="dict.value"
                    >{{dict.label}}</el-radio>
                </el-radio-group>
            </el-form-item>
        </el-col>
      </el-row>
    </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">{{$t('h.system.menu.confirm')}}</el-button>
        <el-button @click="cancel">{{$t('h.system.menu.cancel')}}</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listMenu, getMenu, delMenu, addMenu, updateMenu } from "@/api/system/menu";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import IconSelect from "@/components/IconSelect";

export default {
  name: "Menu",
  dicts: ['sys_show_hide', 'sys_normal_disable'],
  components: { Treeselect, IconSelect },
  data() {
    return {
      // 遮罩层，用于显示加载状态
      loading: true,
      // 是否显示搜索条件区域
      showSearch: true,
      // 菜单表格展示的树状数据列表
      menuList: [],
      // 用于生成菜单树选择框的选项数据
      menuOptions: [],
      // 弹出层（新增/修改菜单对话框）的标题
      title: "",
      // 控制弹出层是否显示
      open: false,
      // 是否展开菜单树表格，默认全部折叠
      isExpandAll: false,
      // 用于控制表格重新渲染，优化交互体验
      refreshTable: true,
      // 查询菜单的参数对象
      queryParams: {
        menuName: undefined,
        visible: undefined,
        status: undefined
      },
      // 表单数据对象，对应新增/修改菜单时的表单输入内容
      form: {},
      // 表单验证规则对象
      rules: {
        menuName: [
          { required: true, message: this.$t('h.system.menu.menuNameRequired'), trigger: "blur" }
        ],
        orderNum: [
          { required: true, message: this.$t('h.system.menu.orderNumRequired'), trigger: "blur" }
        ],
        path: [
          { required: true, message: this.$t('h.system.menu.pathRequired'), trigger: "blur" }
        ]
      }
    };
  },
  created() {
    // 组件创建时，获取菜单列表数据
    this.getList();
  },
  methods: {
    // 选择图标时的回调函数，更新表单中的图标字段
    selected(name) {
      this.form.icon = name;
    },
    /**
     * 获取菜单列表数据的方法
     * 会先设置加载状态为true，发起请求获取数据后，处理数据结构并更新菜单列表，最后设置加载状态为false
     */
    getList() {
      this.loading = true;
      listMenu(this.queryParams).then(response => {
        this.menuList = this.handleTree(response.data, "menuId");
        this.loading = false;
      });
    },
    /**
     * 转换菜单数据结构的方法，将原始菜单数据处理为适合组件展示的树状结构格式
     * 如果节点的子节点为空数组，则删除该子节点属性
     * 返回处理后的节点对象，包含id、label和children属性
     */
    normalizer(node) {
      if (node.children &&!node.children.length) {
        delete node.children;
      }
      return {
        id: node.menuId,
        label: node.menuName,
        children: node.children
      };
    },
    /**
     * 获取菜单下拉树结构数据的方法
     * 发起请求获取菜单数据，处理后构建包含主类目和子菜单的菜单树选项数据，赋值给menuOptions
     */
    getTreeselect() {
      listMenu().then(response => {
        this.menuOptions = [];
        const menu = { menuId: 0, menuName: this.$t('h.system.menu.mainCategory'), children: [] };
        menu.children = this.handleTree(response.data, "menuId");
        this.menuOptions.push(menu);
      });
    },
    // 取消按钮点击时的处理方法
    // 关闭弹出层，并重置表单数据
    cancel() {
      this.open = false;
      this.reset();
    },
    // 重置表单数据的方法
    reset() {
      this.form = {
        menuId: undefined,
        parentId: 0,
        menuName: undefined,
        icon: undefined,
        menuType: "M",
        orderNum: undefined,
        isFrame: "1",
        isCache: "0",
        visible: "0",
        status: "0",
        path: undefined,
        component: undefined,
        perms: undefined,
        query: undefined
      };
      this.resetForm("form");
    },
    /**
     * 搜索按钮点击时的处理方法，调用获取菜单列表数据的方法
     */
    handleQuery() {
      this.getList();
    },
    /**
     * 重置查询条件按钮点击时的处理方法
     * 先重置查询表单，再调用查询菜单列表数据的方法
     */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /**
     * 新增按钮点击时的处理方法
     * 重置表单数据，获取菜单树结构数据，根据传入的行数据（如果有）设置上级菜单id，打开弹出层并设置标题为新增菜单相关文本
     */
    handleAdd(row) {
      this.reset();
      this.getTreeselect();
      if (row!= null && row.menuId) {
        this.form.parentId = row.menuId;
      } else {
        this.form.parentId = 0;
      }
      this.open = true;
      this.title = this.$t('h.system.menu.title.add');
    },
    /**
     * 展开/折叠菜单树表格的方法
     * 先设置刷新表格状态为false，切换展开/折叠状态，然后通过 $nextTick 在DOM更新后再设置刷新表格状态为true
     */
    toggleExpandAll() {
      this.refreshTable = false;
      this.isExpandAll =!this.isExpandAll;
      this.$nextTick(() => {
        this.refreshTable = true;
      });
    },
    /**
     * 修改按钮点击时的处理方法
     * 重置表单数据，获取菜单树结构数据，根据传入的菜单id获取对应菜单详情数据填充到表单，打开弹出层并设置标题为修改菜单相关文本
     */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      getMenu(row.menuId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = this.$t('h.system.menu.title.update');
      });
    },
    /**
     * 提交表单（新增/修改菜单）的方法
     * 先进行表单验证，如果验证通过，根据表单中菜单id是否存在判断是新增还是修改操作，发起相应请求，成功后给出提示并关闭弹出层、刷新菜单列表数据
     */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.menuId!= undefined) {
            updateMenu(this.form).then(response => {
              this.$modal.msgSuccess(this.$t('h.system.menu.updateSuccess'));
              this.open = false;
              this.getList();
            });
          } else {
            addMenu(this.form).then(response => {
              this.$modal.msgSuccess(this.$t('h.system.menu.addSuccess'));
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /**
     * 删除按钮点击时的处理方法
     * 弹出确认框询问是否删除，用户确认后发起删除请求，成功后刷新菜单列表数据并给出删除成功提示
     */
    handleDelete(row) {
      this.$modal.confirm(this.$t('h.system.menu.confirmDelete', { menuName: row.menuName })).then(() => {
        return delMenu(row.menuId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(this.$t('h.system.menu.deleteSuccess'));
      }).catch(() => {});
    }
  }
};
</script>