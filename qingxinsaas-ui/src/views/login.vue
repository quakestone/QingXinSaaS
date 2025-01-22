<template>
  <div class="login">
    <!-- 选择语言 -->
    <LanguageSelector  class="language-selector" />
    <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form">

      <h3 class="title">{{ $t('h.login.title') }}</h3>
      <!-- 新增多租户选择区域 -->
      <!-- <el-form-item>
        <el-select v-model="selectedTenant" :placeholder="$t('h.login.tenant')" @change="handleTenantSelect">
          <el-option v-for="tenant in tenantList" :key="tenant.id" :label="tenant.name" :value="tenant.id">
          </el-option>
        </el-select>
      </el-form-item> -->
      <el-form-item prop="username">
        <el-input v-model="loginForm.username" type="text" auto-complete="off" :placeholder="$t('h.login.username')">
          <svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input v-model="loginForm.password" type="password" auto-complete="off" :placeholder="$t('h.login.password')"
          @keyup.enter.native="handleLogin">
          <svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="code" v-if="captchaEnabled">
        <el-input v-model="loginForm.code" auto-complete="off" :placeholder="$t('h.login.code')" style="width: 63%"
          @keyup.enter.native="handleLogin">
          <svg-icon slot="prefix" icon-class="validCode" class="el-input__icon input-icon" />
        </el-input>
        <div class="login-code">
          <img :src="codeUrl" @click="getCode" class="login-code-img" />
        </div>
      </el-form-item>
      <el-checkbox v-model="loginForm.rememberMe" style="margin: 0px 0px 25px 0px;">{{$t('h.login.rememberme')}}</el-checkbox>
      <el-form-item style="width: 100%;">
        <el-button :loading="loading" size="medium" type="primary" style="width: 100%;"
          @click.native.prevent="handleLogin">
          <span v-if="!loading">{{$t('h.login.logIn')}}</span>
          <span v-else>{{$t('h.login.loginIng')}}</span>
        </el-button>
        <!-- 添加微信登录和支付宝登录按钮 -->
        <el-button size="medium" type="success" style="width: 100%; margin-top: 10px;"
          @click="handleWeChatLogin">{{$t('h.login.wxLogin')}}</el-button>
        <el-button size="medium" type="info" style="width: 100%; margin-top: 10px;"
          @click="handleAlipayLogin">{{$t('h.login.aliLogin')}}</el-button>
        <div style="float: right;" v-if="register">
          <router-link class="link-type" :to="'/register'">{{$t('h.login.SignUp')}}</router-link>
        </div>
      </el-form-item>
    </el-form>


    <!-- 微信二维码弹窗组件 -->
    <el-dialog :title="$t('h.login.wxTitle')" :visible.sync="dialogVisible" width="30%">
      <p>{{$t('h.login.wxDes')}}</p>
      <img :src="qrCodeImage" :alt="$t('h.login.wxCode')" style="width: 100%;">
      <span slot="footer" class="dialog-footer">
        <el-button @click="accessWxLogin" type="success">{{$t('h.login.wxAccessLogin')}}</el-button>
        <el-button @click="dialogVisible = false">{{$t('h.login.cancel')}}</el-button>
      </span>
    </el-dialog>

    <!--  底部  -->
    <div class="el-login-footer">
      <span>Copyright © 2018 - 2024 ruoyi.vip All Rights Reserved.</span>
    </div>
  </div>
</template>

<script>
import { getCodeImg, getTenantList, wxLogin, accessWxLogin } from "@/api/login";
import Cookies from "js-cookie";
import { encrypt, decrypt } from '@/utils/jsencrypt'



export default {
  name: "Login",
  
  data() {
    return {
      codeUrl: "",
      loginForm: {
        username: "admin",
        password: "admin123",
        rememberMe: false,
        code: "",
        uuid: "",
        // tenantId: "" ,// 新增用于存储租户id的字段
        domainName: ""// 当前域名
        
      },
      loginRules: {
        username: [
          { required: true, trigger: "blur", message: "请输入您的账号" }
        ],
        password: [
          { required: true, trigger: "blur", message: "请输入您的密码" }
        ],
        code: [
          { required: true, trigger: "change", message: "请输入验证码" }
        ]
      },
      loading: false,
      // 验证码开关
      captchaEnabled: true,
      // 注册开关
      register: false,
      redirect: undefined,
      selectedTenant: '', // 选中的租户id
      qrCodeImage: "",
      dialogVisible: false,//是否显示微信登入弹窗
      weChatCode: '',  // 微信登录获取的授权码等相关数据（根据微信登录流程确定具体存储内容）
      alipayCode: '',  // 支付宝登录获取的授权码等相关数据（根据支付宝登录流程确定具体存储内容）
      domainName: "",

      tenantList: [
        {
          id: "1",
          name: '若依租户'
        },
        {
          id: "2",
          name: '氢信'
        }
      ]  // 租户列表，从后端获取
    };
  },
  watch: {
    $route: {
      handler: function (route) {
        this.redirect = route.query && route.query.redirect;
      },
      immediate: true
    }
  },
  created() {
    this.getCurrentUrl();
    this.getCode();
    this.getCookie();
    this.getTenantList1(); // 初始化获取租户列表
    
  },
  methods: {
    //获取当前url域名
    getCurrentUrl() {
    const currentUrl = window.location.href;
    console.log('当前URL:', currentUrl);
    const url = new URL(currentUrl);
    const host= url.hostname;
    this.domainName = host;//将域名赋值给loginForm.host
    console.log('当前URL域名:', this.domainName);
   
  },
    getCode() {
      getCodeImg().then(res => {
        this.captchaEnabled = res.captchaEnabled === undefined ? true : res.captchaEnabled;
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.loginForm.uuid = res.uuid;
        }
      });
    },
    getCookie() {
      const username = Cookies.get("username");
      const password = Cookies.get("password");
      const rememberMe = Cookies.get('rememberMe')
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password: password === undefined ? this.loginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
      };
    },
    // 获取租户列表方法
    getTenantList1() {
      getTenantList.then(res => {
        this.tenantList = res.data;
      }).catch(() => {
        // 处理获取失败的情况，比如提示用户
        this.$message.error('获取租户列表失败，请稍后再试');
      });
    },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true;
          if (this.loginForm.rememberMe) {
            Cookies.set("username", this.loginForm.username, { expires: 30 });
            Cookies.set("password", encrypt(this.loginForm.password), { expires: 30 });
            Cookies.set('rememberMe', this.loginForm.rememberMe, { expires: 30 });
          } else {
            Cookies.remove("username");
            Cookies.remove("password");
            Cookies.remove('rememberMe');
          }
          // 将租户id添加到登录表单数据中传递给后端
          // this.loginForm.tenantId = this.selectedTenant;
          this.loginForm.domainName = this.domainName;
          console.log("提交表单：", this.loginForm);
          this.$store.dispatch("Login", this.loginForm).then(() => {
            // login(this.loginForm.username,this.loginForm.password,this.loginForm.code,this.loginForm.uuid,this.loginForm.tenantId).then(()=>{
            this.$router.push({ path: this.redirect || "/" }).catch(() => { });
          }).catch(() => {
            this.loading = false;
            if (this.captchaEnabled) {
              this.getCode();
            }
          });
        }
      });
    },

    //租户下拉框选中事件处理函数
    // handleTenantSelect(tenantId) {
    //   console.log('选中的租户ID：', tenantId);
    //   saveTenantId(tenantId).then(res => {
    //     console.log('保存租户ID结果：', res);
    //     this.$message.success('租户切换成功');
    //   }).catch(() => {
    //     this.$message.error('租户切换失败');
    //   });
    // },


    // 微信登录方法
    handleWeChatLogin() {
      // 请求后端接口
      console.log('微信登录',this.domainName);
      wxLogin(this.domainName).then(res => {
        console.log('微信登录', res);
        this.qrCodeImage = `data:image/png;base64,${res.data}`;
        this.dialogVisible = true; // 显示弹窗
      }).catch(() => {
        this.$message.error('获取微信登录二维码失败，请稍后再试');
      });
    },

    // 微信授权登录
    accessWxLogin(){
        console.log('微信授权登录');
        // this.dialogVisible = false; // 关闭弹窗
        // 登录逻辑
        this.$store.dispatch("WxLogin").then(() => {
          this.$router.push({ path: this.redirect || "/" }).catch(() => { });
        })
    
    },
    // 支付宝登录方法（简化示例，实际需对接支付宝开放平台相关接口）
    handleAlipayLogin() {
      // 引导用户跳转到支付宝授权登录页面，按照支付宝登录流程构造链接等
      window.location.href = 'https://openauth.alipay.com/oauth2/publicAppAuthorize.htm?app_id=YOUR_APP_ID&scope=auth_user&redirect_uri=YOUR_REDIRECT_URI&state=STATE';
      // 同样在回调页面处理后续登录逻辑
    }
  },
 
};

</script>

<style rel="stylesheet/scss" lang="scss">
.login {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  background-image: url("../assets/images/login-background.jpg");
  background-size: cover;
}

.title {
  margin: 0px auto 30px auto;
  text-align: center;
  color: #707070;
}

.login-form {
  border-radius: 6px;
  background: #ffffff;
  width: 400px;
  padding: 25px 25px 5px 25px;

  .el-input {
    height: 38px;

    input {
      height: 38px;
    }
  }

  .input-icon {
    height: 39px;
    width: 14px;
    margin-left: 2px;
  }
}

.login-tip {
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}

.login-code {
  width: 33%;
  height: 38px;
  float: right;

  img {
    cursor: pointer;
    vertical-align: middle;
  }
}

.el-login-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}

.login-code-img {
  height: 38px;
}

.language-selector {
  position: fixed;
  top: 20px; /* 调整顶部距离 */
  right: 20px; /* 调整右侧距离 */
  z-index: 1000; /* 确保组件在最上层 */
}
</style>