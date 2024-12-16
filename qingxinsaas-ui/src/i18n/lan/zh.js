import PanelGroup from "../../views/dashboard/PanelGroup.vue";

export const h = {
    login: {
        title: "Vue后台管理系统",
        tenant: "请选择租户",
        username: "用户名",
        password: "密码",
        code: "验证码",
        rememberme: "记住我",
        logIn: "登录",
        loginIng: "登录中...",
        wxLogin: "微信登录",
        aliLogin: "支付宝登录",
        SignUp: "立即注册",
        wxTitle: "微信登录",
        wxDes: "微信扫码前，请先选择租户!!!",
        wxCode: "微信二维码",
        cancel: "取消"
    },

    innerLink: {
        loading: "正在加载页面，请稍候！"
    },

    settings: {
        themeStyle: "主题风格设置",
        themeColor: "主题颜色",
        themeLayout: "系统布局设置",
        openTopNav: "开启 TopNav",
        opemTagsViews: "开启 Tags-Views",
        fixedHeader: "固定 Header",
        showLogo: "显示 Logo",
        dynamicTitles: "动态标题",
        saveSetting: "保存设置",
        resetSetting: "重置设置"
    },

    tagsVies: {
        loadPage: "刷新页面",
        closeThis: "关闭当前",
        closeOther: "关闭其他",
        closeLeft: "关闭左侧",
        closeRight: "关闭右侧",
        closeAll: "关闭全部"
    },

    navbar: {
        layoutSize: "布局大小",
        mine: "个人中心",
        layoutSet: "布局设置",
        logOut: "退出登录",
        logOutTip: "确定退出登录吗？",
        title: "提示",
        cancel: "取消",
        confirm: "确定"
    },

    PanelGroup: {
        visitor: "访客",
        message: "消息",
        balance: "金额+",
        order: "订单"
    },

    401: {
        back: "返回",
        error: "401错误",
        noPermissions: "您没有访问权限！",
        noAction: "对不起，您没有访问权限，请不要进行非法操作！您可以返回主页面",
        backIndex: "回首页"
    },

    404: {
        error: "404错误!",
        noFound: "对不起，您正在寻找的页面不存在。尝试检查URL的错误，然后按浏览器上的刷新按钮或尝试在我们的应用程序中找到其他内容。",
        back: "回首页",
        noFound2: "找不到网页！"
    },

    job: {
        search: "搜索",
        reset: "重置",
        add: "新增",
        edit: "修改",
        delete: "删除",
        export: "导出",
        jobLog: "日志",
        confirm: "确定",
        cancel: "取消",
        close: "关闭",

        jobName: "任务名称",
        inpJobName: "请输入任务名称",
        jobGroupName: "任务组名",
        selectJobGroup: "请选择任务组名",
        jobStatus: "任务状态",
        selectJobSatus: "请选择任务状态",
        jobNO: "任务编号",
        jobDetail: "任务详情",
        createTime: "创建时间",
        tarChar: "调用目标字符串",
        inpTarChar: "请输入调用目标字符串",
        cron: "cron执行表达式",
        inpCron: "请输入cron执行表达式",
        createCron: "Cron表达式生成器",
        status: "状态",
        operate: "操作",
        more: "更多",
        performOnce: "执行一次",
        performNow: "立即执行",
        pause: "放弃执行",
        default: "默认策略",
        log: "调度日志",
        des1: "调用方法",
        des2: "Bean调用示例：ryTask.ryParams('ry')",
        des3: "Class类调用示例：com.ruoyi.quartz.task.RyTask.ryParams('ry')",
        des4: "参数说明：支持字符串，布尔类型，长整型，浮点型，整型",
        generateExpressions: "生成表达式",
        execute: "执行策略",
        isConcurrent: "是否并发",
        yes: "允许",
        no: "禁止",
        nextExecuteTime: "下次执行时间",
        invokeTarFun: "调用目标方法",
        normal: "正常",
        stop: "暂停",
        jobNameRequired: "任务名称不能为空",
        invokeTargetRequired: "调用目标字符串不能为空",
        cronExpressionRequired: "cron执行表达式不能为空",

        enable: "启用",
        disable: "停用",
        confirmStatusChange: "确认要{action}\"{jobName}\"任务吗？",
        success: "成功",
        confirmRun: "确认要立即执行一次\"{jobName}\"任务吗？",
        runSuccess: "执行成功",

        deleteConfirm: "是否确认删除定时任务编号为\"{jobIds}\"的数据项？",
        deleteSuccess: "删除成功",

        // 以下是新增的对应页面元素的多语言文本
        taskGroupName: "任务分组",
        executionStatus: "执行状态",
        executionTime: "执行时间",
        startDate: "开始日期",
        endDate: "结束日期",
        deleteLog: "删除",
        clear: "清空",
        exportLog: "导出",
        closeDialog: "关闭",
        logNumber: "日志编号",
        logMessage: "日志信息",
        operation: "操作",
        viewDetails: "详细",
        pageNum: "页码",
        pageSize: "每页数量",
        confirmClear: "是否确认清空所有调度日志数据项？",
        confirmDeleteLog: "是否确认删除调度日志编号为\"{jobLogIds}\"的数据项？",
        clearSuccess: "清空成功",
        deleteLogSuccess: "删除成功"


    },

    monitor: {
        online: {
            loginAddress: "登录地址",
            userName: "用户名称",
            search: "搜索",
            reset: "重置",
            sessionNumber: "会话编号",
            loginName: "登录名称",
            host: "主机",
            loginTime: "登录时间",
            operation: "操作",
            forceLogout: "强退",
            confirmForceLogout: "是否确认强退名称为\"{userName}\"的用户？",
            forceLogoutSuccess: "强退成功",
            pleaseInputLoginAddress: "请输入登录地址",
            pleaseInputUserName: "请输入用户名称"
        }
    },


    system: {
        config: {
            parameterName: "参数名称",
            parameterKey: "参数键名",
            systemBuiltIn: "系统内置",
            createTime: "创建时间",
            search: "搜索",
            reset: "重置",
            add: "新增",
            update: "修改",
            delete: "删除",
            export: "导出",
            refreshCache: "刷新缓存",
            parameterPrimaryKey: "参数主键",
            parameterKeyValue: "参数键值",
            remark: "备注",
            operation: "操作",
            confirmDelete: "是否确认删除参数编号为{configIds}的数据项？",
            deleteSuccess: "删除成功",
            addSuccess: "新增成功",
            updateSuccess: "修改成功",
            refreshSuccess: "刷新成功",
            pleaseInputParameterName: "请输入参数名称",
            pleaseInputParameterKey: "请输入参数键名",
            pleaseInputParameterKeyValue: "请输入参数键值",
            parameterNameRequired: "参数名称不能为空",
            parameterKeyRequired: "参数键名不能为空",
            parameterKeyValueRequired: "参数键值不能为空"
        },

        dept: {
            "deptName": "部门名称",
            "status": "状态",
            "search": "搜索",
            "reset": "重置",
            "add": "新增",
            "expandCollapse": "展开/折叠",
            "parentDept": "上级部门",
            "displayOrder": "显示排序",
            "leader": "负责人",
            "phone": "联系电话",
            "email": "邮箱",
            "update": "编辑",
            "delete": "删除",
            "confirmDelete": "是否确认删除名称为{deptName}的数据项？",
            "deleteSuccess": "删除成功",
            "addSuccess": "新增成功",
            "updateSuccess": "修改成功",
            "pleaseInputDeptName": "请输入部门名称",
            "parentDeptRequired": "上级部门不能为空",
            "deptNameRequired": "部门名称不能为空",
            "displayOrderRequired": "显示排序不能为空",
            "pleaseInputCorrectEmail": "请输入正确的邮箱地址",
            "pleaseInputCorrectPhone": "请输入正确的手机号码",
            "operation": "操作",
            "title": {
                "addTitle": "添加部门",
                "updateTitle": "修改部门"
            },
            "confirm": "确定",
            "cancel": "取消",
            "pleaseInputLeader": "请输入负责人",
            "pleaseInputPhone": "请输入联系电话",
            "pleaseInputEmail": "请输入邮箱",
            "createTime": "创建时间"
        },

        "dict": {
            "data": {
                "dictType": "字典类型",
                "dictLabel": "字典标签",
                "status": "状态",
                "search": "搜索",
                "reset": "重置",
                "add": "新增",
                "edit": "修改",
                "delete": "删除",
                "export": "导出",
                "close": "关闭",
                "dictCode": "字典编码",
                "dictValue": "字典键值",
                "dictSort": "字典排序",
                "remark": "备注",
                "createTime": "创建时间",
                "operation": "操作",
                "confirmDelete": "是否确认删除字典编码为{dictCodes}的数据项？",
                "deleteSuccess": "删除成功",
                "addSuccess": "新增成功",
                "updateSuccess": "修改成功",
                "pleaseInputDictLabel": "请输入字典标签",
                "pleaseInputDictValue": "请输入字典键值",
                "pleaseInputDictSort": "请输入字典排序",
                "title": {
                    "addTitle": "添加字典数据",
                    "updateTitle": "修改字典数据"
                },
                "confirm": "确定",
                "cancel": "取消",
                "dataLabel": "数据标签",
                "dataKeyValue": "数据键值",
                "styleAttribute": "样式属性",
                "displaySort": "显示排序",
                "echoStyle": "回显样式"
            },
            "index": {
                "dictName": "字典名称",
                "dictType": "字典类型",
                "status": "状态",
                "search": "搜索",
                "reset": "重置",
                "add": "新增",
                "edit": "修改",
                "delete": "删除",
                "export": "导出",
                "refreshCache": "刷新缓存",
                "dictId": "字典编号",
                "remark": "备注",
                "createTime": "创建时间",
                "operation": "操作",
                "confirmDelete": "是否确认删除字典编号为{dictIds}的数据项？",
                "deleteSuccess": "删除成功",
                "addSuccess": "新增成功",
                "updateSuccess": "修改成功",
                "pleaseInputDictName": "字典名称不能为空",
                "pleaseInputDictType": "字典类型不能为空",
                "pleaseInputRemark":"请输入备注",
                "title": {
                    "addTitle": "添加字典类型",
                    "updateTitle": "修改字典类型"
                },
                "confirm": "确定",
                "cancel": "取消"
            }
        },




    }


}









