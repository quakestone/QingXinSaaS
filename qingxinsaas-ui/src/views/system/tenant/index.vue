<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="租户名称" prop="tenantName">
        <el-input v-model="queryParams.tenantName" placeholder="请输入租户名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="联系人" prop="contactName">
        <el-input v-model="queryParams.contactName" placeholder="请输入联系人" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
                   v-hasPermi="['system:tenant:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
                   v-hasPermi="['system:tenant:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
                   v-hasPermi="['system:tenant:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
                   v-hasPermi="['system:tenant:export']">导出</el-button>
      </el-col>
      <el-button plain icon="el-icon-receiving" @click="datasourcemanager = true" type="primary" size="mini"
                 style="margin-left: 16px;">
        数据源
      </el-button>
      <el-button plain icon="el-icon-set-up" @click="packagemanager = true" type="primary" size="mini"
                 style="margin-left: 16px;">
        套餐
      </el-button>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 租户数据源管理抽屉 TenantDataSourceManager-->
    <el-drawer title="租户数据源管理" :visible.sync="datasourcemanager" :direction="datasourcedirection"
               :before-close="handleClose" size="40%">

      <div>
        <TenantDataSourceManager></TenantDataSourceManager>
      </div>
    </el-drawer>

    <!-- 套餐管理 PackageManager-->
    <el-drawer title="套餐管理" :visible.sync="packagemanager" :direction="packagedirection" :before-close="handleClose"
               size="40%">
      <div>
        <PackageManager></PackageManager>
      </div>
    </el-drawer>

    <el-table v-loading="loading" :data="tenantList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="租户ID" align="center" prop="tenantId" />
      <el-table-column label="租户名称" align="center" prop="tenantName" />
      <!-- <el-table-column label="数据源ID" align="center" prop="datasourceId" /> -->
      <el-table-column label="租户域名" align="center" prop="domainName" />
      <el-table-column label="租户logo" align="center" prop="logo" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.logo" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="联系人" align="center" prop="contactName" />
      <el-table-column label="联系人电话" align="center" prop="contactPhone" />
      <!-- <el-table-column label="租户套餐ID" align="center" prop="packageId" /> -->
      <el-table-column label="过期时间" align="center" prop="expireTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.expireTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="租户状态" align="center" prop="status">
        <template slot-scope="scope">
          <el-switch :options="dict.type.sys_normal_disable" :value="scope.row.status"
                     v-model="scope.row.status"
                     active-value="0" inactive-value="1"
                     @change="handleStatusChange(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="父租户名称" align="center" prop="parentId" />

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="350px">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
                     v-hasPermi="['system:tenant:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
                     v-hasPermi="['system:tenant:remove']">删除</el-button>
          <!-- 数据源按钮 -->
          <el-button size="mini" type="text" icon="el-icon-coin" @click="handleDataSourceManager(scope.row)"
                     v-hasPermi="['system:tenant:edit']">数据源</el-button>
          <!-- 套餐按钮 -->
          <el-button size="mini" type="text" icon="el-icon-notebook-1" @click="handlePackageManager(scope.row)"
                     v-hasPermi="['system:tenant:edit']">套餐</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改租户管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="90px">
        <el-form-item label="租户名称" prop="tenantName">
          <el-input v-model="form.tenantName" placeholder="请输入租户名称" />
        </el-form-item>
        <el-form-item label="数据源ID" prop="datasourceId">
          <el-input v-model="form.datasourceId" placeholder="请输入数据源ID" />
        </el-form-item>
        <el-form-item label="租户域名" prop="domainName">
          <el-input v-model="form.domainName" placeholder="请输入租户域名" />
        </el-form-item>
        <el-form-item label="租户logo" prop="logo">
          <image-upload v-model="form.logo" />
        </el-form-item>
        <el-form-item label="联系人" prop="contactName">
          <el-input v-model="form.contactName" placeholder="请输入联系人" />
        </el-form-item>
        <el-form-item label="联系人电话" prop="contactPhone">
          <el-input v-model="form.contactPhone" placeholder="请输入联系人电话" />
        </el-form-item>
        <el-form-item label="租户套餐ID" prop="packageId">
          <el-input v-model="form.packageId" placeholder="请输入租户套餐ID" />
        </el-form-item>
        <el-form-item label="过期时间" prop="expireTime">
          <el-date-picker clearable v-model="form.expireTime" type="date" value-format="yyyy-MM-dd"
                          placeholder="请选择过期时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="租户状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio v-for="dict in dict.type.sys_normal_disable" :key="dict.value" :label="dict.value">{{ dict.label
              }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="父租户ID" prop="parentId">
          <el-input v-model="form.parentId" placeholder="请输入父租户ID" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 数据源管理 -->
    <el-dialog :title="title" :visible.sync="openDataSource" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="90px">
        <el-form-item label="数据源" prop="datasourceId">
          <el-select v-model="form.datasourceId" placeholder="请选择数据源">
            <el-option v-for="(item, index) in dataSourceOptions" :key="index" :label="item.value"
                       :value="item.label"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 套餐管理 -->
    <el-dialog :title="title" :visible.sync="openPackageManager" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="90px">
        <el-form-item label="套餐" prop="packageId">
          <el-select v-model="form.packageId" placeholder="请选择套餐" @change="handleSelectPackage">
            <el-option v-for="(item, index) in packageOptions" :key="index" :label="item.value"
                       :value="item.label"></el-option>
          </el-select>
        </el-form-item>
      </el-form>


      <!-- 菜单权限 -->
      <el-checkbox v-model="menuExpand" @change="handleCheckedTreeExpand($event)">展开/折叠</el-checkbox>
      <el-tree class="tree-border" :data="menuOptions" show-checkbox ref="menu" node-key="id"
               :check-strictly="!menuCheckStrictly" empty-text="加载中，请稍候" :props="defaultProps"></el-tree>

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>
<script>
import { listTenant, getTenant, delTenant, addTenant, updateTenant, changeTenantStatus } from "@/api/system/tenant";
import { treeselect as menuTreeselect } from "@/api/system/menu";
import { listDatasource } from "../../../api/system/datasource";
import { listPackage, getPackage } from "../../../api/system/package";
import TenantDataSourceManager from '../../../components/TenantDataSourceManager/index.vue';
import PackageManager from '../../../components/ProductManager/index.vue';

export default {
  components: {
    TenantDataSourceManager,
    PackageManager
  },
  name: "Tenant",
  dicts: ['sys_normal_disable'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 租户管理表格数据
      tenantList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示弹出数据源管理
      openDataSource: false,
      // 是否显示弹出套餐管理
      openPackageManager: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        tenantName: null,
        contactName: null,
      },
      // 表单参数
      form: {},
      defaultProps: {
        children: "children",
        label: "label",
        disabled: () => {
          return true
        }
      },
      // 表单校验
      rules: {
        tenantName: [
          { required: true, message: "租户名称不能为空", trigger: "blur" }
        ],
      },
      // 是否显示弹出层（数据权限）
      menuExpand: false,
      menuNodeAll: false,
      menuCheckStrictly: true,
      // 菜单列表
      menuOptions: [],
      // 数据源选项
      dataSourceOptions: [],
      // 套餐选项
      packageOptions: [],
      // 数据源抽屉开关
      datasourcemanager: false,
      datasourcedirection: 'rtl',
      // 套餐抽屉
      packagemanager: false,
      packagedirection: 'rtl'
    };
  },
  created() {
    this.getList();
    this.getMenuTreeselect();
  },
  methods: {
    // 租户抽屉开关
    handleClose(done) {
      this.$confirm('确认关闭？')
        .then(_ => {
          done();
        })
        .catch(_ => { });
    },
    /** 查询租户管理列表 */
    getList() {
      this.loading = true;
      listTenant(this.queryParams).then(response => {
        this.tenantList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.openDataSource = false;
      this.openPackageManager = false;
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      if (this.$refs.menu !== undefined) {
        this.$refs.menu.setCheckedKeys([]);
      }
      this.form = {
        tenantId: null,
        tenantName: null,
        datasourceId: null,
        domainName: null,
        logo: null,
        contactName: null,
        contactPhone: null,
        packageId: null,
        expireTime: null,
        status: null,
        delFlag: null,
        parentId: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.tenantId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加租户管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const tenantId = row.tenantId || this.ids;
      getTenant(tenantId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改租户管理";
      });
    },
    /** 数据源按钮操作 */
    handleDataSourceManager(row) {
      this.reset();
      const tenantId = row.tenantId || this.ids;
      listDatasource().then(response => {
        this.dataSourceOptions = response.rows.map(item => ({ label: item.datasourceId, value: item.name }));
      });
      getTenant(tenantId).then(response => {
        this.form = response.data;
        this.openDataSource = true;
        this.title = "租户数据源配置";
      });
    },
    /** 租户套餐操作 */
    handlePackageManager(row) {
      this.reset();
      const tenantId = row.tenantId || this.ids;
      listPackage().then(response => {
        this.packageOptions = response.rows.map(item => ({ label: item.packageId, value: item.packageName }));
      });
      getTenant(tenantId).then(response => {
        this.form = response.data;
        this.openPackageManager = true;
        this.title = "租户套餐配置";
        if (response.data.packageId) {
          this.getPackage(response.data.packageId);
        }
      });
    },
    getPackage(packageId) {
      getPackage(packageId).then(response => {
        this.setCheckedMenu(response.data.menuIds);
      });
    },
    setCheckedMenu(menuIds) {
      // 将 menuIds 字符串拆分为数组
      const checkedKeys = menuIds.split(',');
      // 使用 $nextTick 确保 DOM 更新完成
      this.$nextTick(() => {
        if (this.$refs.menu) {
          this.$refs.menu.setCheckedKeys(checkedKeys);
        }
      });
    },
    /** 租户选择的套餐 */
    handleSelectPackage(value) {
      this.$refs.menu.setCheckedKeys([]);
      this.getPackage(value);
    },
    // 租户状态修改
    handleStatusChange(row) {
      let text = row.status === "0" ? "启用" : "停用";
      this.$modal.confirm('确认要"' + text + '""' + row.tenantName + '"用户吗？').then(function () {
        return changeTenantStatus(row.tenantId, row.status);
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function () {
        row.status = row.status === "0" ? "1" : "0";
      });
    },
    // 树权限（展开/折叠）
    handleCheckedTreeExpand(value) {
      let treeList = this.menuOptions;
      for (let i = 0; i < treeList.length; i++) {
        this.$refs.menu.store.nodesMap[treeList[i].id].expanded = value;
      }
    },
    /** 查询菜单树结构 */
    getMenuTreeselect() {
      menuTreeselect().then(response => {
        this.menuOptions = response.data;
      });
    },
    // 所有菜单节点数据
    getMenuAllCheckedKeys() {
      // 目前被选中的菜单节点
      let checkedKeys = this.$refs.menu.getCheckedKeys();
      // 半选中的菜单节点
      let halfCheckedKeys = this.$refs.menu.getHalfCheckedKeys();
      checkedKeys.unshift.apply(checkedKeys, halfCheckedKeys);
      return checkedKeys.toString();
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.tenantId != null) {
            updateTenant(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.openDataSource = false;
              this.openPackageManager = false;
              this.getList();
            });
          } else {
            addTenant(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const tenantIds = row.tenantId || this.ids;
      this.$modal.confirm('是否确认删除租户管理编号为"' + tenantIds + '"的数据项？').then(() => {
        return delTenant(tenantIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/tenant/export', {
        ...this.queryParams
      }, `tenant_${new Date().getTime()}.xlsx`);
    }
  }
};
</script>

<style>
.el-checkbox__input.is-disabled.is-checked.el-checkbox__inner::after {
  border-color: #09a2a0;
}
</style>
