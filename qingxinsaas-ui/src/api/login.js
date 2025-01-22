import request from '@/utils/request'
import { dataTool } from 'echarts'

// 登录方法
export function login(username, password, code, uuid,domainName) {
  return request({
    url: '/auth/login',
    headers: {
      isToken: false,
      repeatSubmit: false,
      contenType: 'application/json;charset=UTF-8'
    },
    method: 'post',
    data: { username, password, code, uuid,domainName}
  })
}

// 注册方法
export function register(data) {
  return request({
    url: '/auth/register',
    headers: {
      isToken: false
    },
    method: 'post',
    data: data
  })
}

// 刷新方法
export function refreshToken() {
  return request({
    url: '/auth/refresh',
    method: 'post'
  })
}

// 获取用户详细信息
export function getInfo() {
  return request({
    url: '/system/user/getInfo',
    method: 'get'
  })
}

// 退出方法
export function logout() {
  return request({
    url: '/auth/logout',
    method: 'delete'
  })
}

// 获取验证码
export function getCodeImg() {
  return request({
    url: '/code',
    headers: {
      isToken: false
    },
    method: 'get',
    timeout: 20000
  })
}

//获取租户列表
export function getTenantList() {
  return request({
    url: '/auth/tenantList',
    method: 'get'
  })
}


//获取微信登录二维码
export function wxLogin(domainName) {
  return request({
    url: '/auth/wx/wxLogin',
    method: 'get',
    params:{domainName: domainName}
  })
}

//微信授权登录
export function accessWxLogin() {
  return request({
    url: '/auth/wx/accessWxLogin',
    headers: {
      isToken: false,
      repeatSubmit: false,
      contenType: 'application/json;charset=UTF-8'
    },
    method: 'post',
  })
}

//保存当前租户id（微信登录使用）
export function saveTenantId(tenantId) {
  return request({
    url: '/auth/wx/saveTenantId',
    method: 'get',
    params: {tenantId}
  })
}