<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item :label="$t('h.system.logininfo.loginAddress')" prop="ipaddr">
        <el-input
          v-model="queryParams.ipaddr"
          :placeholder="$t('h.system.logininfo.pleaseInputLoginAddress')"
          clearable
          style="width: 240px;"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('h.system.logininfo.userName')" prop="userName">
        <el-input
          v-model="queryParams.userName"
          :placeholder="$t('h.system.logininfo.pleaseInputUserName')"
          clearable
          style="width: 240px;"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('h.system.logininfo.status')" prop="status">
        <el-select
          v-model="queryParams.status"
          :placeholder="$t('h.system.logininfo.loginStatus')"
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
      <el-form-item :label="$t('h.system.logininfo.accessTime')" prop="accessTime">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd HH:mm:ss"
          type="daterange"
          range-separator="-"
          start-placeholder="$t('h.system.logininfo.startPlaceholder')"
          end-placeholder="$t('h.system.logininfo.endPlaceholder')"
          :default-time="['00:00:00', '23:59:59']"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">{{$t('h.system.logininfo.search')}}</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">{{$t('h.system.logininfo.reset')}}</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:logininfor:remove']"
        >{{$t('h.system.logininfo.delete')}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          @click="handleClean"
          v-hasPermi="['system:logininfor:remove']"
        >{{$t('h.system.logininfo.clean')}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-unlock"
          size="mini"
          :disabled="single"
          @click="handleUnlock"
          v-hasPermi="['system:logininfor:unlock']"
        >{{$t('h.system.logininfo.unlock')}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:logininfor:export']"
        >{{$t('h.system.logininfo.export')}}</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table ref="tables" v-loading="loading" :data="list" @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column :label="$t('h.system.logininfo.accessId')" align="center" prop="infoId" />
      <el-table-column :label="$t('h.system.logininfo.userName')" align="center" prop="userName" :show-overflow-tooltip="true" sortable="custom" :sort-orders="['descending', 'ascending']" />
      <el-table-column :label="$t('h.system.logininfo.address')" align="center" prop="ipaddr" width="130" :show-overflow-tooltip="true" />
      <el-table-column :label="$t('h.system.logininfo.status')" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_common_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column :label="$t('h.system.logininfo.description')" align="center" prop="msg" :show-overflow-tooltip="true" />
      <el-table-column :label="$t('h.system.logininfo.accessTime')" align="center" prop="accessTime" sortable="custom" :sort-orders="['descending', 'ascending']" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.accessTime) }}</span>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import { list, delLogininfor, cleanLogininfor, unlockLogininfor } from "@/api/system/logininfor";
export default {
  name: "Logininfor",
  dicts: ['sys_common_status'],
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
      // 选择用户名
      selectName: "",
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 表格数据
      list: [],
      // 日期范围
      dateRange: [],
      // 默认排序
      defaultSort: {prop: 'accessTime', order: 'descending'},
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        ipaddr: undefined,
        userName: undefined,
        status: undefined
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询登录日志列表 */
    getList() {
      this.loading = true;
      list(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
          this.list = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.queryParams.pageNum = 1;
      this.$refs.tables.sort(this.defaultSort.prop, this.defaultSort.order)
    },
    /** 多选框选中数据 */
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.infoId)
      this.single = selection.length!= 1
      this.multiple =!selection.length
      this.selectName = selection.map(item => item.userName);
    },
    /** 排序触发事件 */
    handleSortChange(column, prop, order) {
      this.queryParams.orderByColumn = column.prop;
      this.queryParams.isAsc = column.order;
      this.getList();
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const infoIds = row.infoId || this.ids;
      this.$modal.confirm(this.$t('h.system.logininfo.confirmDelete', {infoIds: infoIds}))
.then(() => {
          return delLogininfor(infoIds);
        })
.then(() => {
          this.getList();
          this.$modal.msgSuccess(this.$t('h.system.logininfo.deleteSuccess'));
        })
.catch(() => {});
    },
    /** 清空按钮操作 */
    handleClean() {
      this.$modal.confirm(this.$t('h.system.logininfo.confirmClean', {})).then(function() {
        return cleanLogininfor();
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(this.$t('h.system.logininfo.cleanSuccess'));
      }).catch(() => {});
    },
    /** 解锁按钮操作 */
    handleUnlock() {
      const username = this.selectName;
      this.$modal.confirm(this.$t('h.system.logininfo.confirmUnlock', {username: username}))
.then(() => {
          return unlockLogininfor(username);
        })
.then(() => {
          this.$modal.msgSuccess(this.$t('h.system.logininfo.unlockSuccess'));
        })
.catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/logininfor/export', {
...this.queryParams
      }, `logininfor_${new Date().getTime()}.xlsx`);
    }
  }
};
</script>