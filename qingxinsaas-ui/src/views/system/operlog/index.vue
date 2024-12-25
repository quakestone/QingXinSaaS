<template>
  <div class="app-container">
    <!-- 查询表单部分 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item :label="$t('h.system.operlog.operIp')" prop="operIp">
        <el-input
          v-model="queryParams.operIp"
          :placeholder="$t('h.system.operlog.pleaseInputOperIp')"
          clearable
          style="width: 240px;"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('h.system.operlog.title')" prop="title">
        <el-input
          v-model="queryParams.title"
          :placeholder="$t('h.system.operlog.pleaseInputTitle')"
          clearable
          style="width: 240px;"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('h.system.operlog.operName')" prop="operName">
        <el-input
          v-model="queryParams.operName"
          :placeholder="$t('h.system.operlog.pleaseInputOperName')"
          clearable
          style="width: 240px;"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('h.system.operlog.businessType')" prop="businessType">
        <el-select
          v-model="queryParams.businessType"
          :placeholder="$t('h.system.operlog.businessType')"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.sys_oper_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item :label="$t('h.system.operlog.status')" prop="status">
        <el-select
          v-model="queryParams.status"
          :placeholder="$t('h.system.operlog.status')"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.sys_common_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item :label="$t('h.system.operlog.operTime')">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd HH:mm:ss"
          type="daterange"
          range-separator="-"
          :start-placeholder="$t('h.system.operlog.startDate')"
          :end-placeholder="$t('h.system.operlog.endDate')"
          :default-time="['00:00:00', '23:59:59']"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">{{$t('h.system.operlog.search')}}</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">{{$t('h.system.operlog.reset')}}</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作按钮行部分 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:operlog:remove']"
        >{{$t('h.system.operlog.delete')}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          @click="handleClean"
          v-hasPermi="['system:operlog:remove']"
        >{{$t('h.system.operlog.clean')}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:operlog:export']"
        >{{$t('h.system.operlog.export')}}</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 操作日志表格部分 -->
    <el-table ref="tables" v-loading="loading" :data="list" @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column :label="$t('h.system.operlog.logId')" align="center" prop="operId" />
      <el-table-column :label="$t('h.system.operlog.title')" align="center" prop="title" :show-overflow-tooltip="true" />
      <el-table-column :label="$t('h.system.operlog.businessType')" align="center" prop="businessType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_oper_type" :value="scope.row.businessType"/>
        </template>
      </el-table-column>
      <el-table-column :label="$t('h.system.operlog.requestMethod')" align="center" prop="requestMethod" />
      <el-table-column :label="$t('h.system.operlog.operName')" align="center" prop="operName" width="110" :show-overflow-tooltip="true" sortable="custom" :sort-orders="['descending', 'ascending']"/>
      <el-table-column :label="$t('h.system.operlog.operIp')" align="center" prop="operIp" width="130" :show-overflow-tooltip="true" />
      <el-table-column :label="$t('h.system.operlog.status')" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_common_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column :label="$t('h.system.operlog.operTime')" align="center" prop="operTime" width="180" sortable="custom" :sort-orders="['descending', 'ascending']">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.operTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column :label="$t('h.system.operlog.costTime')" align="center" prop="costTime" width="110" :show-overflow-tooltip="true" sortable="custom" :sort-orders="['descending', 'ascending']">
        <template slot-scope="scope">
          <span>{{ scope.row.costTime }}毫秒</span>
        </template>
      </el-table-column>
      <el-table-column :label="$t('h.system.operlog.operation')" align="center" class="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row,scope.index)"
            v-hasPermi="['system:operlog:query']"
          >{{$t('h.system.operlog.view')}}</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页部分 -->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 操作日志详细对话框 -->
    <el-dialog :title="$t('h.system.operlog.titleView')" :visible.sync="detailVisible" width="800px" append-to-body>
      <el-form ref="form" :model="form" label-width="100px" size="mini">
        <el-row>
          <el-col :span="12">
            <el-form-item :label="$t('h.system.operlog.operModule')">{{ form.title }} / {{ typeFormat(form) }}</el-form-item>
            <el-form-item
              :label="$t('h.system.operlog.loginInfo')"
            >{{ form.operName }} / {{ form.operIp }}</el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('h.system.operlog.requestUrl')">{{ form.operUrl }}</el-form-item>
            <el-form-item :label="$t('h.system.operlog.requestMethodLabel')">{{ form.requestMethod }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item :label="$t('h.system.operlog.operMethod')">{{ form.method }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item :label="$t('h.system.operlog.requestParam')">{{ form.operParam }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item :label="$t('h.system.operlog.returnParam')">{{ form.jsonResult }}</el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item :label="$t('h.system.operlog.operStatus')">
              <div v-if="form.status === 0">{{$t('h.system.operlog.common')}}</div>
              <div v-else-if="form.status === 1">{{$t('h.system.operlog.fail')}}</div>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item :label="$t('h.system.operlog.costTimeLabel')">{{ form.costTime }}ms</el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item :label="$t('h.system.operlog.operTimeLabel')">{{ parseTime(form.operTime) }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item :label="$t('h.system.operlog.errorMsg')" v-if="form.status === 1">{{ form.errorMsg }}</el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="detailVisible = false">{{$t('h.system.operlog.close')}}</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { list, delOperlog, cleanOperlog } from "@/api/system/operlog";

export default {
  name: "Operlog",
  dicts: ['sys_oper_type', 'sys_common_status'],
  data() {
    return {
      // 遮罩层，用于显示加载状态
      loading: true,
      // 选中的日志数据项的id数组
      ids: [],
      // 控制是否禁用相关按钮（非多个选中时禁用某些操作按钮）
      multiple: true,
      // 是否显示搜索条件区域
      showSearch: true,
      // 总数据条数，用于分页显示
      total: 0,
      // 操作日志表格展示的数据列表
      list: [],
      // 控制操作日志详细对话框是否显示，初始为false，即隐藏状态
      detailVisible: false,
      // 日期范围选择器绑定的数据
      dateRange: [],
      // 默认排序设置
      defaultSort: {prop: 'operTime', order: 'descending'},
      // 表单数据对象，用于在操作日志详细对话框中展示对应日志的详细信息
      form: {},
      // 查询参数对象，包含各种查询过滤条件相关的数据
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        operIp: undefined,
        title: undefined,
        operName: undefined,
        businessType: undefined,
        status: undefined
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /**
     * 查询操作日志列表的方法
     * 先设置加载状态为true，发起请求获取数据后，处理数据并更新列表，最后设置加载状态为false
     */
    getList() {
      this.loading = true;
      list(this.addDateRange(this.queryParams, this.dateRange)).then( response => {
          this.list = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    // 操作日志类型字典翻译方法，根据类型字典转换对应显示文本
    typeFormat(row, column) {
      return this.selectDictLabel(this.dict.type.sys_oper_type, row.businessType);
    },
    /**
     * 搜索按钮点击时的处理方法
     * 将查询参数的页码重置为1，然后调用获取列表数据的方法更新展示内容
     */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /**
     * 重置按钮点击时的处理方法
     * 清空日期范围选择器的值，重置查询表单，将查询参数页码重置为1，同时恢复表格默认排序
     */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.queryParams.pageNum = 1;
      this.$refs.tables.sort(this.defaultSort.prop, this.defaultSort.order);
    },
    /**
     * 多选框选中数据变化时的处理方法
     * 更新选中数据项的id数组，并根据选中数量设置相关按钮的禁用状态
     */
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.operId);
      this.multiple =!selection.length;
    },
    /**
     * 表格排序触发事件的处理方法
     * 根据排序的列、属性以及顺序，更新查询参数中的排序相关设置，然后调用获取列表数据的方法更新展示内容
     */
    handleSortChange(column, prop, order) {
      this.queryParams.orderByColumn = column.prop;
      this.queryParams.isAsc = column.order;
      this.getList();
    },
    /**
     * 详细按钮点击时的处理方法
     * 设置操作日志详细对话框为显示状态（`detailVisible` 为 `true`），并将对应日志的数据赋值给 `form` 用于对话框中展示详情
     */
    handleView(row, index) {
      this.detailVisible = true;
      this.form = row;
    },
    /**
     * 删除按钮点击时的处理方法
     * 弹出确认框询问是否删除，用户确认后发起删除请求，成功后刷新列表数据并给出删除成功提示
     */
    handleDelete(row) {
      const operIds = row.operId || this.ids;
      this.$modal.confirm(this.$t('h.system.operlog.confirmDelete', { operIds: operIds })).then(() => {
        return delOperlog(operIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(this.$t('h.system.operlog.deleteSuccess'));
      }).catch(() => {});
    },
    /**
     * 清空按钮点击时的处理方法
     * 弹出确认框询问是否清空所有操作日志数据，用户确认后发起清空请求，成功后刷新列表数据并给出清空成功提示
     */
    handleClean() {
      this.$modal.confirm(this.$t('h.system.operlog.confirmClean', {})).then(() => {
        return cleanOperlog();
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(this.$t('h.system.operlog.cleanSuccess'));
      }).catch(() => {});
    },
    /**
     * 导出按钮点击时的处理方法
     * 调用下载相关方法（这里假设 `download` 函数已正确定义用于下载文件），传递相应参数进行文件导出操作
     */
    handleExport() {
      this.download('system/operlog/export', {
       ...this.queryParams
      }, `operlog_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

