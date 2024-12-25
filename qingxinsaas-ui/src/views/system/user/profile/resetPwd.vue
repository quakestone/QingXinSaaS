<template>
  <el-form ref="form" :model="user" :rules="rules" label-width="80px">
    <el-form-item :label="$t('h.system.user.profile.resetPwd.oldPassword')" prop="oldPassword">
      <el-input v-model="user.oldPassword" :placeholder="$t('h.system.user.profile.resetPwd.enterOldPassword')" type="password" show-password/>
    </el-form-item>
    <el-form-item :label="$t('h.system.user.profile.resetPwd.newPassword')" prop="newPassword">
      <el-input v-model="user.newPassword" :placeholder="$t('h.system.user.profile.resetPwd.enterNewPassword')" type="password" show-password/>
    </el-form-item>
    <el-form-item :label="$t('h.system.user.profile.resetPwd.confirmPassword')" prop="confirmPassword">
      <el-input v-model="user.confirmPassword" :placeholder="$t('h.system.user.profile.resetPwd.confirmNewPassword')" type="password" show-password/>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" size="mini" @click="submit">{{$t('h.system.user.profile.resetPwd.save')}}</el-button>
      <el-button type="danger" size="mini" @click="close">{{$t('h.system.user.profile.resetPwd.close')}}</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import { updateUserPwd } from "@/api/system/user";

export default {
  data() {
    const equalToPassword = (rule, value, callback) => {
      if (this.user.newPassword !== value) {
        callback(new Error(this.$t('h.system.user.profile.resetPwd.passwordInconsistent')));
      } else {
        callback();
      }
    };
    return {
      user: {
        oldPassword: undefined,
        newPassword: undefined,
        confirmPassword: undefined
      },
      // 表单校验
      rules: {
        oldPassword: [
          { required: true, message: this.$t('h.system.user.profile.resetPwd.oldPasswordRequired'), trigger: "blur" }
        ],
        newPassword: [
          { required: true, message: this.$t('h.system.user.profile.resetPwd.newPasswordRequired'), trigger: "blur" },
          { min: 6, max: 20, message: this.$t('h.system.user.profile.resetPwd.passwordLength'), trigger: "blur" },
          { pattern: /^[^<>"'|\\]+$/, message: this.$t('h.system.user.profile.resetPwd.illegalChars'), trigger: "blur" }
        ],
        confirmPassword: [
          { required: true, message: this.$t('h.system.user.profile.resetPwd.confirmPasswordRequired'), trigger: "blur" },
          { required: true, validator: equalToPassword, trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    submit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          updateUserPwd(this.user.oldPassword, this.user.newPassword).then(response => {
            this.$modal.msgSuccess(this.$t('h.system.user.profile.resetPwd.successMessage'));
          });
        }
      });
    },
    close() {
      this.$tab.closePage();
    }
  }
};
</script>