<!-- src/components/LanguageSelector.vue -->
<template>
    <div>
      <el-select v-model="selectedLanguage" placeholder="请选择语言" @change="handleLanguageChange">
        <el-option v-for="item in languages" :key="item.value" :label="item.label" :value="item.value">
        </el-option>
      </el-select>
    </div>
  </template>
  
  <script>
  import Cookies from "js-cookie";
  
  export default {
    name: "LanguageSelector",
    data() {
      return {
        selectedLanguage: Cookies.get('language') || 'zh',
        languages: [
          { value: 'zh', label: "中文" },
          { value: 'en', label: "English" }
        ]
      };
    },
    methods: {
      handleLanguageChange(lang) {
        this.$i18n.locale = lang;
        Cookies.set('language', lang);
      }
    }
  };
  </script>
  
  <style scoped>
  /* 可以在这里添加样式 */
  </style>