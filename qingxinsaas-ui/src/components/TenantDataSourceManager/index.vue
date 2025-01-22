<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="名称" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['system:datasource:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['system:datasource:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['system:datasource:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['system:datasource:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-row :gutter="20">
      <el-col v-for="(item, index) in datasourceList" :key="index" :span="8">
        <div class="postcard">
          <div class="postcard-content">
            <div>数据源ID：{{ item.datasourceId }}</div>
            <div>名称：{{ item.name }}</div>
            <div>连接地址：{{ item.url }}</div>
            <div>用户名：{{ item.username }}</div>
            <div>密码：{{ item.password }}</div>
            <div class="postcard-actions">
              <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(item)"
                v-hasPermi="['system:datasource:edit']">修改</el-button>
              <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(item)"
                v-hasPermi="['system:datasource:remove']">删除</el-button>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>


    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />




    <!-- 添加或修改数据源配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="连接地址" prop="url">
          <el-input v-model="form.url" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="用户名" prop="username">
          <el-input v-model="form.username" placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="form.password" placeholder="请输入密码" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import { listDatasource, getDatasource, delDatasource, addDatasource, updateDatasource } from "@/api/system/datasource";
  export default {
    name: "Datasource",
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
        // 数据源配置表格数据
        datasourceList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          name: null,
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {}
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询数据源配置列表 */
      getList() {
        this.loading = true;
        listDatasource(this.queryParams).then(response => {
          this.datasourceList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      },
      // 取消按钮
      cancel() {
        this.open = false;
        this.reset();
      },
      // 表单重置
      reset() {
        this.form = {
          datasourceId: null,
          name: null,
          url: null,
          username: null,
          password: null,
          status: null,
          delFlag: null,
          createBy: null,
          createTime: null,
          updateBy: null,
          updateTime: null,
          remark: null
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
        this.ids = selection.map(item => item.datasourceId);
        this.single = selection.length!==1;
        this.multiple =!selection.length;
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加数据源配置";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const datasourceId = row.datasourceId || this.ids;
        getDatasource(datasourceId).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改数据源配置";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.datasourceId!= null) {
              updateDatasource(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
                addDatasource(this.form).then(response => {
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
        const datasourceIds = row.datasourceId || this.ids;
        this.$modal.confirm('是否确认删除数据源配置编号为"' + datasourceIds + '"的数据项？').then(function() {
          return delDatasource(datasourceIds);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('system/datasource/export', {
      ...this.queryParams
        }, `datasource_${new Date().getTime()}.xlsx`);
      }
    }
  };
</script>

<style scoped>
  /* 定义明信片样式 */
.postcard {
  border: 1px solid #ddd;
  border-radius: 10px;
  padding: 10px;
  background-color: #f9f9f9;
  margin-bottom: 20px;
}
.postcard-content {
  overflow: hidden;
}
.postcard-content div {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  margin-bottom: 5px;
}
.postcard-actions {
  display: flex;
  justify-content: flex-end;
}
</style>