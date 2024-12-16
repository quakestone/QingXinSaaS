import PanelGroup from "../../views/dashboard/PanelGroup.vue";

export const h = {
    login:{
        title: "Vue后台管理系统",
        tenant: "请选择租户",
        username:"用户名",
        password:"密码",
        code:"验证码",
        rememberme:"记住我",
        logIn:"登录",
        loginIng:"登录中...",
        wxLogin:"微信登录",
        aliLogin:"支付宝登录",
        SignUp:"立即注册",
        wxTitle:"微信登录",
        wxDes:"微信扫码前，请先选择租户!!!",
        wxCode:"微信二维码",
        cancel:"取消"
    },

    innerLink:{
        loading:"正在加载页面，请稍候！"
    },

    settings:{
        themeStyle:"主题风格设置",
        themeColor:"主题颜色",
        themeLayout:"系统布局设置",
        openTopNav: "开启 TopNav",
        opemTagsViews:"开启 Tags-Views",
        fixedHeader:"固定 Header",
        showLogo:"显示 Logo",
        dynamicTitles:"动态标题",
        saveSetting:"保存设置",
        resetSetting:"重置设置"
    },

    tagsVies:{
        loadPage:"刷新页面",
        closeThis:"关闭当前",
        closeOther:"关闭其他",
        closeLeft:"关闭左侧",
        closeRight:"关闭右侧",
        closeAll:"关闭全部"
    },

    navbar:{
        layoutSize:"布局大小",
        mine:"个人中心",
        layoutSet:"布局设置",
        logOut:"退出登录",
        logOutTip:"确定退出登录吗？",
        title:"提示",
        cancel:"取消",
        confirm:"确定"
    },

    PanelGroup:{
        visitor:"访客",
        message:"消息",
        balance:"金额+",
        order:"订单"
    },

    401:{
        back:"返回",
        error:"401错误",
        noPermissions:"您没有访问权限！",
        noAction:"对不起，您没有访问权限，请不要进行非法操作！您可以返回主页面",
        backIndex:"回首页"
    },

    404:{
        error:"404错误!",
        noFound:"对不起，您正在寻找的页面不存在。尝试检查URL的错误，然后按浏览器上的刷新按钮或尝试在我们的应用程序中找到其他内容。",
        back:"回首页",
        noFound2:"找不到网页！"
    },

    job:{
        search:"搜索",
        reset:"重置",
        add:"新增",
        edit:"修改",
        delete:"删除",
        export:"导出",
        jobLog:"日志",
        confirm:"确定",
        cancel:"取消",
        close:"关闭",

        jobName:"任务名称",
        inpJobName:"请输入任务名称",
        jobGroupName:"任务组名",
        selectJobGroup:"请选择任务组名",
        jobStatus:"任务状态",
        selectJobSatus:"请选择任务状态",
        jobNO:"任务编号",
        jobDetail:"任务详情",
        createTime:"创建时间",
        tarChar:"调用目标字符串",
        inpTarChar:"请输入调用目标字符串",
        cron:"cron执行表达式",
        inpCron:"请输入cron执行表达式",
        createCron:"Cron表达式生成器",
        status:"状态",
        operate:"操作",
        more:"更多",
        performOnce:"执行一次",
        performNow:"立即执行",
        pause:"放弃执行",
        default:"默认策略",
        log:"调度日志",
        des1:"调用方法",
        des2:"Bean调用示例：ryTask.ryParams('ry')",
        des3:"Class类调用示例：com.ruoyi.quartz.task.RyTask.ryParams('ry')",
        des4:"参数说明：支持字符串，布尔类型，长整型，浮点型，整型",
        generateExpressions:"生成表达式",
        execute:"执行策略", 
        isConcurrent:"是否并发",
        yes:"允许",
        no:"禁止",
        nextExecuteTime:"下次执行时间",
        invokeTarFun:"调用目标方法",
        normal:"正常",
        stop:"暂停",
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
        deleteSuccess: "删除成功"
        
    
    }




}

   
    
  
