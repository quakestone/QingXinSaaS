export const h = {
    // 登入页面
    login: {
        title: "Vue backend management system",
        tenant: "Please select a tenant",
        username: "username",
        password: "password",
        code: "code",
        rememberme: "Remember Me",
        logIn: "login",
        loginIng: "login in...",
        wxLogin: "WeChat login",
        aliLogin: "Alipay login",
        SignUp: "Sign Up Now",
        wxTitle: "WeChat login",
        wxDes: "Before scanning the QR code on WeChat, please select the tenant first!!",
        wxCode: "WeChat Code",
        cancel: "cancel"
    },
    settings: {
        themeStyle: "Theme Style",
        themeColor: "Theme Color",
        themeLayout: "System Layout",
        openTopNav: "Open TopNav",
        opemTagsViews: "Open Tags-Views",
        fixedHeader: "Fixed Header",
        showLogo: "Show Logo",
        dynamicTitles: "Dynamic Titles",
        saveSetting: "Save Settings",
        resetSetting: "Reset Settings"
    },
    tagsVies: {
        loadPage: "Refresh Page",
        closeThis: "Close Current",
        closeOther: "Close Others",
        closeLeft: "Close Left",
        closeRight: "Close Right",
        closeAll: "Close All"
    },
    navbar: {
        layoutSize: "Layout Size",
        mine: "Personal Center",
        layoutSet: "Layout Settings",
        logOut: "Log Out",
        logOutTip: "Are you sure to log out?",
        title: "Prompt",
        cancel: "Cancel",
        confirm: "Confirm"
    },

    PanelGroup: {
        visitor: "Visitor",
        message: "Message",
        balance: "Amount",
        order: "Order"
    },

    401: {
        back: "Back",
        error: "401 Error",
        noPermissions: "You do not have access permissions!",
        noAction: "Sorry, you do not have access permissions. Please do not perform illegal operations! You can return to the main page",
        backIndex: "Back to Home"
    },

    404: {
        error: "404 Error!",
        noFound: "Sorry, the page you are looking for does not exist. Try checking the URL for errors, then click the refresh button on your browser or try finding something else in our application.",
        back: "Back to Home",
        noFound2: "Page not found!"
    },

    job: {
        search: "Search",
        reset: "Reset",
        add: "Add",
        edit: "Edit",
        delete: "Delete",
        export: "Export",
        jobLog: "Log",
        confirm: "Confirm",
        cancel: "Cancel",
        close: "Close",

        jobName: "Job Name",
        inpJobName: "Please enter the job name",
        jobGroupName: "Job Group Name",
        selectJobGroup: "Please select the job group name",
        jobStatus: "Job Status",
        selectJobSatus: "Please select the job status",
        jobNO: "Job Number",
        jobDetail: "Job Details",
        createTime: "Creation Time",
        tarChar: "Target Invocation String",
        inpTarChar: "Please enter the target invocation string",
        cron: "Cron Execution Expression",
        inpCron: "Please enter the cron execution expression",
        createCron: "Cron Expression Generator",
        status: "Status",
        operate: "Operation",
        more: "More",
        performOnce: "Execute Once",
        performNow: "Execute Now",
        pause: "Abort Execution",
        default: "Default Strategy",
        log: "Scheduling Log",
        des1: "Invocation Method",
        des2: "Bean Invocation Example: ryTask.ryParams('ry')",
        des3: "Class Invocation Example: com.ruoyi.quartz.task.RyTask.ryParams('ry')",
        des4: "Parameter Description: Supports string, boolean, long, float, integer",
        generateExpressions: "Generate Expression",
        execute: "Execution Strategy",
        isConcurrent: "Is Concurrent",
        yes: "Allow",
        no: "Prohibit",
        nextExecuteTime: "Next Execution Time",
        invokeTarFun: "Invocation Target Method",
        normal: "Normal",
        stop: "Paused",
        jobNameRequired: "Job name cannot be empty",
        invokeTargetRequired: "Target invocation string cannot be empty",
        cronExpressionRequired: "Cron execution expression cannot be empty",

        enable: "Enable",
        disable: "Disable",
        confirmStatusChange: "Confirm to {action} the \"{jobName}\" job?",
        success: "Success",
        confirmRun: "Confirm to execute the \"{jobName}\" job once?",
        runSuccess: "Execution successful",

        deleteConfirm: "Are you sure you want to delete the scheduled task with ID \"{jobIds}\"?",
        deleteSuccess: "Deletion successful"
    },
    monitor: {
        online: {
            loginAddress: "Login Address",
            userName: "User Name",
            search: "Search",
            reset: "Reset",
            sessionNumber: "Session Number",
            loginName: "Login Name",
            host: "Host",
            loginTime: "Login Time",
            operation: "Operation",
            forceLogout: "Force Logout",
            confirmForceLogout: "Are you sure to force logout the user named \"{userName}\"?",
            forceLogoutSuccess: "Force logout successful",
            pleaseInputLoginAddress: "Please enter the login address",
            pleaseInputUserName: "Please enter the user name"
        }
    },

    system: {
        config: {
            parameterName: "Parameter Name",
            pleaseInputParameterName: "Please enter the parameter name",
            parameterKey: "Parameter Key",
            pleaseInputParameterKey: "Please enter the parameter key",
            systemBuiltIn: "System Built-in",
            createTime: "Create Time",
            startDate: "Start Date",
            endDate: "End Date",
            search: "Search",
            reset: "Reset",
            add: "Add",
            update: "Update",
            delete: "Delete",
            export: "Export",
            refreshCache: "Refresh Cache",
            parameterPrimaryKey: "Parameter Primary Key",
            parameterKeyValue: "Parameter Key Value",
            remark: "Remark",
            operation: "Operation",
            title: {
                addTitle: "Add Configuration",
                updateTitle: "Update Configuration"
            },
            confirm: "Confirm",
            cancel: "Cancel",
            parameterNameRequired: "Parameter name cannot be empty",
            parameterKeyRequired: "Parameter key cannot be empty",
            parameterKeyValueRequired: "Parameter key value cannot be empty",
            confirmDelete: "Are you sure to delete the data item with parameter primary key {configIds}?",
            updateSuccess: "Update successful",
            addSuccess: "Add successful",
            deleteSuccess: "Delete successful",
            refreshSuccess: "Refresh successful",
            addTitle: "Add Parameter",
            updateTitle: "Update Parameter",
            pleaseInputParameterKeyValue: "Please enter the parameter key value",
            pleaseInputContent: "Please enter the content"
        },

        dept: {
            deptName: "Department Name",
            status: "Status",
            search: "Search",
            reset: "Reset",
            add: "Add",
            expandCollapse: "Expand/Collapse",
            parentDept: "Parent Department",
            displayOrder: "Display Order",
            leader: "Leader",
            phone: "Phone",
            email: "Email",
            update: "Edit",
            delete: "Delete",
            confirmDelete: "Are you sure to delete the data item named {deptName}?",
            deleteSuccess: "Delete successful",
            addSuccess: "Add successful",
            updateSuccess: "Update successful",
            pleaseInputDeptName: "Please enter the department name",
            parentDeptRequired: "Parent department cannot be empty",
            deptNameRequired: "Department name cannot be empty",
            displayOrderRequired: "Display order cannot be empty",
            pleaseInputCorrectEmail: "Please enter a valid email address",
            pleaseInputCorrectPhone: "Please enter a valid phone number",
            operation: "Operation",
            title: {
                addTitle: "Add Department",
                updateTitle: "Update Department"
            },
            confirm: "Confirm",
            cancel: "Cancel",
            pleaseInputLeader: "Please enter the leader",
            pleaseInputPhone: "Please enter the phone",
            pleaseInputEmail: "Please enter the email",
            createTime: "Create Time"
        },

        dict: {
            data: {
                dictType: "Dictionary Type",
                dictLabel: "Dictionary Label",
                status: "Status",
                search: "Search",
                reset: "Reset",
                add: "Add",
                edit: "Edit",
                delete: "Delete",
                export: "Export",
                close: "Close",
                dictCode: "Dictionary Code",
                dictValue: "Dictionary Key Value",
                dictSort: "Dictionary Sort",
                remark: "Remark",
                createTime: "Create Time",
                operation: "Operation",
                confirmDelete: "Are you sure to delete the data item with dictionary code {dictCodes}?",
                deleteSuccess: "Delete successful",
                addSuccess: "Add successful",
                updateSuccess: "Update successful",
                pleaseInputDictLabel: "Please enter the dictionary label",
                pleaseInputDictValue: "Please enter the dictionary key value",
                pleaseInputDictSort: "Please enter the dictionary sort",
                title: {
                    addTitle: "Add Dictionary Data",
                    updateTitle: "Update Dictionary Data"
                },
                confirm: "Confirm",
                cancel: "Cancel",
                dataLabel: "Data Label",
                dataKeyValue: "Data Key Value",
                styleAttribute: "Style Attribute",
                displaySort: "Display Sort",
                echoStyle: "Echo Style"
            },
            index: {
                dictName: "Dictionary Name",
                dictType: "Dictionary Type",
                status: "Status",
                search: "Search",
                reset: "Reset",
                add: "Add",
                edit: "Edit",
                delete: "Delete",
                export: "Export",
                refreshCache: "Refresh Cache",
                dictId: "Dictionary ID",
                remark: "Remark",
                createTime: "Create Time",
                operation: "Operation",
                confirmDelete: "Are you sure to delete the data item with dictionary ID {dictIds}?",
                deleteSuccess: "Delete successful",
                addSuccess: "Add successful",
                updateSuccess: "Update successful",
                pleaseInputDictName: "Dictionary name cannot be empty",
                pleaseInputDictType: "Dictionary type cannot be empty",
                pleaseInputRemark: "Please enter the remark",
                title: {
                    addTitle: "Add Dictionary Type",
                    updateTitle: "Update Dictionary Type"
                },
                confirm: "Confirm",
                cancel: "Cancel",
                "startPlaceholder": "Start Date",
                "endPlaceholder": "End Date"
            }
        },

        logininfo: {
            loginAddress: "Login Address",
            userName: "User Name",
            status: "Status",
            search: "Search",
            reset: "Reset",
            delete: "Delete",
            clean: "Clean",
            unlock: "Unlock",
            export: "Export",
            accessId: "Access ID",
            address: "Address",
            description: "Description",
            accessTime: "Access Time",
            confirmDelete: "Are you sure to delete the data item with access ID {infoIds}?",
            deleteSuccess: "Delete successful",
            cleanSuccess: "Clean successful",
            unlockSuccess: "Unlock successful",
            pleaseInputLoginAddress: "Please enter the login address",
            pleaseInputUserName: "Please enter the user name",
            loginStatus: "Login Status",
            startPlaceholder: "Start Date",
            endPlaceholder: "End Date"
        },

        menu: {
            menuName: "Menu Name",
            pleaseInputMenuName: "Please enter the menu name",
            status: "Status",
            search: "Search",
            reset: "Reset",
            add: "Add",
            update: "Update",
            delete: "Delete",
            expandCollapse: "Expand/Collapse",
            parentMenu: "Parent Menu",
            menuType: "Menu Type",
            directory: "Directory",
            menuItem: "Menu Item",
            button: "Button",
            icon: "Icon",
            orderNum: "Display Order",
            isFrame: "Is Frame",
            path: "Path",
            component: "Component",
            perms: "Permissions",
            query: "Query",
            isCache: "Is Cache",
            visible: "Visible",
            title: {
                add: "Add Menu",
                update: "Update Menu"
            },
            confirm: "Confirm",
            cancel: "Cancel",
            menuNameRequired: "Menu name cannot be empty",
            orderNumRequired: "Display order cannot be empty",
            pathRequired: "Path cannot be empty",
            confirmDelete: "Are you sure to delete the data item named \"{menuName}\"?",
            addSuccess: "Add successful",
            updateSuccess: "Update successful",
            deleteSuccess: "Delete successful",
            createTime: "Create Time",
            operation: "Operation",
            mainCategory: "Main Category",
            permissionCharacter: "Permission Character",
            yes: "Yes",
            no: "No",
            cache: "Cache",
            notCache: "Not Cache",
            menuStatus: "Menu Status",
            modal: {
                add: {
                    header: "Add Menu",
                    description: "Please fill in the menu information to complete the addition.",
                    submit: "Submit Addition"
                },
                update: {
                    header: "Update Menu",
                    description: "Please modify the menu information to complete the update.",
                    submit: "Submit Update"
                }
            },
            pleaseSelectIcon: "Please select an icon",
            pleaseInputRouteAddress: "Please enter the route address",
            pleaseInputPermissionIdentifier: "Please enter the permission identifier",
            visibleStatus: "Visible Status"
        },
        "notice": {
            "noticeTitle": "Notice Title",
            "pleaseInputNoticeTitle": "Please input notice title",
            "createBy": "Operator",
            "pleaseInputCreateBy": "Please input operator",
            "noticeType": "Notice Type",
            "search": "Search",
            "reset": "Reset",
            "add": "Add",
            "update": "Update",
            "delete": "Delete",
            "operation": "Operation",
            "createTime": "Creation Time",
            "status": "Status",
            "title": {
                "add": "Add Notice",
                "update": "Update Notice"
            },
            "confirm": "Confirm",
            "cancel": "Cancel",
            "noticeTitleRequired": "Notice title cannot be empty",
            "noticeTypeRequired": "Notice type cannot be empty",
            "confirmDelete": "Are you sure to delete the data item with notice ID \"{noticeIds}\"?",
            "addSuccess": "Added successfully",
            "updateSuccess": "Updated successfully",
            "deleteSuccess": "Deleted successfully",
            "content": "Content",
            "single": "Only a single notice can be operated",
            "multiple": "Please select at least one notice for operation",
            "pleaseSelectNoticeType": "Please select notice type",
            "sequenceNumber": "Sequence Number"
        },

        "operlog": {
            "operIp": "Operation IP",
            "pleaseInputOperIp": "Please input operation IP",
            "title": "System Module",
            "pleaseInputTitle": "Please input system module",
            "operName": "Operator",
            "pleaseInputOperName": "Please input operator",
            "businessType": "Operation Type",
            "search": "Search",
            "reset": "Reset",
            "delete": "Delete",
            "clean": "Clear",
            "export": "Export",
            "view": "View Details",
            "logId": "Log ID",
            "requestMethod": "Request Method",
            "operTime": "Operation Time",
            "costTime": "Cost Time",
            "operation": "Operation",
            "status": "Status",
            "confirmDelete": "Are you sure to delete the data item with log ID \"{operIds}\"?",
            "deleteSuccess": "Deleted successfully",
            "confirmClean": "Are you sure to clear all operation log items?",
            "cleanSuccess": "Cleared successfully",
            "titleView": "Operation Log Details",
            "operModule": "Operation Module:",
            "loginInfo": "Login Information:",
            "requestUrl": "Request URL:",
            "requestMethodLabel": "Request Method:",
            "operMethod": "Operation Method:",
            "requestParam": "Request Parameters:",
            "returnParam": "Return Parameters:",
            "operStatus": "Operation Status:",
            "costTimeLabel": "Cost Time:",
            "operTimeLabel": "Operation Time:",
            "errorMsg": "Error Message:",
            "close": "Close",
            "startDate": "Start Date",
            "endDate": "End Date",
            "page": "Page Number",
            "pageSize": "Items per Page",
            "total": "Total Items",
            "sort": "Sort",
            "ascending": "Ascending",
            "descending": "Descending",
            "selectAll": "Select All",
            "selectInverse": "Select Inverse",
            "pagination": "Pagination",
            "downloading": "Downloading",
            "exporting": "Exporting",
            "confirm": "Confirm",
            "cancel": "Cancel",
            "noData": "No Data",
            "loading": "Loading",
            "common": "Normal",
            "fail": "Failed"
        },

        "post": {
            "postCode": "Post Code",
            "pleaseInputPostCode": "Please input post code",
            "postName": "Post Name",
            "pleaseInputPostName": "Please input post name",
            "status": "Status",
            "search": "Search",
            "reset": "Reset",
            "add": "Add",
            "edit": "Edit",
            "delete": "Delete",
            "export": "Export",
            "postId": "Post ID",
            "postSort": "Post Sort",
            "createTime": "Creation Time",
            "operation": "Operation",
            "confirmDelete": "Are you sure to delete the data item with post ID \"{postIds}\"?",
            "deleteSuccess": "Deleted successfully",
            "addSuccess": "Added successfully",
            "editSuccess": "Edited successfully",
            "titleAdd": "Add Post",
            "titleEdit": "Edit Post",
            "remark": "Remark",
            "pleaseInputRemark": "Please input content",
            "confirm": "Confirm",
            "cancel": "Cancel",
            "page": "Page Number",
            "pageSize": "Items per Page",
            "total": "Total Items",
            "loading": "Loading",
            "nameRequired": "Post name cannot be empty",
            "codeRequired": "Post code cannot be empty",
            "sortRequired": "Post sort cannot be empty"
        },
        "role": {
            "roleName": "Role Name",
            "pleaseInputRoleName": "Please enter the role name",
            "roleKey": "Permission Character",
            "pleaseInputRoleKey": "Please enter the permission character",
            "status": "Status",
            "search": "Search",
            "reset": "Reset",
            "add": "Add",
            "edit": "Edit",
            "delete": "Delete",
            "export": "Export",
            "roleId": "Role Number",
            "roleSort": "Display Order",
            "createTime": "Creation Time",
            "operation": "Operation",
            "confirmDelete": "Are you sure you want to delete the role number \"{roleIds}\"?",
            "deleteSuccess": "Delete successful",
            "addSuccess": "Add successful",
            "editSuccess": "Edit successful",
            "titleAdd": "Add Role",
            "titleEdit": "Edit Role",
            "remark": "Remark",
            "pleaseInputRemark": "Please enter content",
            "confirm": "Confirm",
            "cancel": "Cancel",
            "page": "Page Number",
            "pageSize": "Number per Page",
            "total": "Total Number",
            "loading": "Loading",
            "dataScope": "Permission Scope",
            "allDataScope": "All Data Permissions",
            "customDataScope": "Custom Data Permissions",
            "departmentDataScope": "Department Data Permissions",
            "departmentAndBelowDataScope": "Department and Below Data Permissions",
            "onlySelfDataScope": "Only Personal Data Permissions",
            "handleDataScope": "Assign Data Permissions",
            "handleAuthUser": "Assign User",
            "dataScopeSelectChange": "Trigger when selecting role permission scope",
            "submitDataScope": "Submit",
            "menuExpand": "Expand/Collapse (Menu)",
            "menuNodeAll": "Select/Deselect All (Menu)",
            "deptExpand": "Expand/Collapse (Department)",
            "deptNodeAll": "Select/Deselect All (Department)",
            "enable": "Enable",
            "disable": "Disable",
            "statusChangeConfirm": "Are you sure you want to \"{text}\" the \"{roleName}\" role?",
            "statusChangeSuccess": "{text} successfully",
            "startDate": "Start Date",
            "endDate": "End Date",
            "more": "More",
            "menuPermissions": "Menu Permissions",
            "menuCheckStrictly": "Parent-Child Menu Linkage",
            "dataPermissions": "Data Permissions",
            "deptCheckStrictly": "Department Linkage",
            "cancelDataScope": "Cancel",
            "titleDataScope": "Data Scope",
            "authUser": {
                "userName": "User Name",
                "pleaseInputUserName": "Please enter user name",
                "phonenumber": "Mobile Number",
                "pleaseInputPhonenumber": "Please enter mobile number",
                "search": "Search",
                "reset": "Reset",
                "add": "Add User",
                "close": "Close",
                "cancelAuthUser": "Cancel Authorization",
                "batchCancelAuth": "Batch Cancel Authorization",
                "userId": "User Number",
                "userNickName": "User Nickname",
                "email": "Email",
                "phone": "Phone",
                "status": "Status",
                "createTime": "Creation Time",
                "operation": "Operation",
                "confirmCancelAuth": "Are you sure you want to cancel the role for user \"{userName}\"?",
                "confirmBatchCancelAuth": "Do you want to cancel the authorization for the selected users?",
                "cancelAuthSuccess": "Cancel authorization successful",
                "page": "Page Number",
                "pageSize": "Number per Page",
                "total": "Total Number",
                "loading": "Loading"
            },
            "selectUser": {
                "userName": "User Name",
                "pleaseInputUserName": "Please enter user name",
                "phonenumber": "Mobile Number",
                "pleaseInputPhonenumber": "Please enter mobile number",
                "search": "Search",
                "reset": "Reset",
                "select": "Confirm",
                "cancel": "Cancel",
                "userId": "User Number",
                "userNickName": "User Nickname",
                "email": "Email",
                "phone": "Phone",
                "status": "Status",
                "createTime": "Creation Time",
                "pleaseSelectUsers": "Please select users to assign",
                "page": "Page Number",
                "pageSize": "Number per Page",
                "total": "Total Number",
                "loading": "Loading",
                "selectUser": "Select User"
            }
        },
        "user": {
            "userName": "User Name",
            "pleaseInputUserName": "Please enter user name",
            "userNickName": "User Nickname",
            "pleaseInputUserNickName": "Please enter user nickname",
            "phonenumber": "Mobile Number",
            "pleaseInputPhonenumber": "Please enter mobile number",
            "email": "Email",
            "pleaseInputEmail": "Please enter email",
            "password": "User Password",
            "pleaseInputPassword": "Please enter user password",
            "sex": "Sex",
            "status": "Status",
            "post": "Position",
            "role": "Role",
            "remark": "Remark",
            "pleaseInputRemark": "Please enter content",
            "search": "Search",
            "reset": "Reset",
            "add": "Add",
            "edit": "Edit",
            "delete": "Delete",
            "import": "Import",
            "export": "Export",
            "confirm": "Confirm",
            "cancel": "Cancel",
            "userId": "User ID",
            "dept": "Department",
            "deptName": "Department Name",
            "pleaseInputDeptName": "Please select the department",
            "createTime": "Creation Time",
            "operation": "Operation",
            "resetPwd": "Reset Password",
            "authRole2": "Assign Role",
            "updateSupport": "Update existing user data?",
            "upload": "Drag the file here, or <em>click to upload</em>",
            "tip": "Only import files in xls, xlsx format.",
            "downloadTemplate": "Download Template",
            "confirmDelete": "Are you sure you want to delete the user with ID \"{userIds}\"?",
            "confirmChangeStatus": "Are you sure you want to \"{text}\" user \"{userName}\"?",
            "changeStatusSuccess": "{text} successfully",
            "promptNewPwd": "Please enter a new password for \"{userName}\"",
            "inputPwdLengthError": "Password length must be between 5 and 20",
            "inputPwdIllegalCharError": "Cannot contain illegal characters: < > \" ' \\\ |",
            "modifySuccess": "Modification successful",
            "addSuccess": "Add successful",
            "deleteSuccess": "Delete successful",
            "page": "Page",
            "pageSize": "Items per page",
            "total": "Total number",
            "loading": "Loading",
            "more": "More",
            "lengthBetween": "Length must be between",
            "and": "and",
            "characters": "characters",
            "validEmail": "Valid email address",
            "validPhoneNumber": "Valid mobile number",
            "newPasswordIs": ", the new password is:",
            "addUser": "Add User",
            "editUser": "Edit User",
            "enable": "Enable",
            "disable": "Disable",
            "success": "Success",
            "valid": "Valid",
            "invalid": "Invalid",
            "required": "Required",
            "lengthError": "Length error",
            "illegalChars": "Illegal characters",
            "promptTitle": "Prompt",
            "title": "Title",
            "authRole": {
                "basicInfo": "Basic Information",
                "roleInfo": "Role Information",
                "index": "Serial Number",
                "roleId": "Role ID",
                "roleName": "Role Name",
                "roleKey": "Permission Character",
                "createTime": "Creation Time",
                "nickName": "User Nickname",
                "loginAccount": "Login Account",
                "submit": "Submit",
                "return": "Return",
                "success": "Authorization Successful"
            },
            "profile": {
                "personalInfo": "Personal Information",
                "userName": "User Name",
                "phoneNumber": "Mobile Number",
                "userEmail": "User Email",
                "department": "Department",
                "role": "Role",
                "creationDate": "Creation Date",
                "basicInfo": "Basic Information",
                "changePassword": "Change Password",
                "resetPwd": {
                    "oldPassword": "Old Password",
                    "enterOldPassword": "Please enter old password",
                    "newPassword": "New Password",
                    "enterNewPassword": "Please enter new password",
                    "confirmPassword": "Confirm Password",
                    "confirmNewPassword": "Please confirm new password",
                    "save": "Save",
                    "close": "Close",
                    "passwordInconsistent": "The two passwords you entered do not match",
                    "oldPasswordRequired": "Old password is required",
                    "newPasswordRequired": "New password is required",
                    "passwordLength": "Length should be between 6 and 20 characters",
                    "illegalChars": "Cannot contain illegal characters: < > \" ' \\\ |",
                    "confirmPasswordRequired": "Confirm password is required",
                    "successMessage": "Modified successfully"
                },
                "userAvatar": {
                    "upload": "Click to upload avatar",
                    "title": "Edit Avatar",
                    "select": "Select",
                    "submit": "Submit",
                    "fileTypeError": "File format error, please upload image files, such as: JPG, PNG files.",
                    "successMessage": "Modified successfully"
                },
                "userInfo": {
                    "nickName": "User Nickname",
                    "phonenumber": "Mobile Number",
                    "email": "Email",
                    "sex": "Sex",
                    "male": "Male",
                    "female": "Female",
                    "save": "Save",
                    "close": "Close",
                    "nickNameRequired": "User nickname is required",
                    "emailRequired": "Email address is required",
                    "validEmail": "Please enter a valid email address",
                    "phonenumberRequired": "Mobile number is required",
                    "validPhoneNumber": "Please enter a valid mobile number",
                    "successMessage": "Modified successfully"
                }
            }
        }


    }

}
