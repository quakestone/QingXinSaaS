import request from '@/utils/request'

// 查询租户管理列表
export function listTenant(query) {
  return request({
    url: '/system/tenant/list',
    method: 'get',
    params: query
  })
}

// 查询租户管理详细
export function getTenant(tenantId) {
  return request({
    url: '/system/tenant/' + tenantId,
    method: 'get'
  })
}

// 新增租户管理
export function addTenant(data) {
  return request({
    url: '/system/tenant',
    method: 'post',
    data: data
  })
}

// 修改租户管理
export function updateTenant(data) {
  return request({
    url: '/system/tenant',
    method: 'put',
    data: data
  })
}

// 删除租户管理
export function delTenant(tenantId) {
  return request({
    url: '/system/tenant/' + tenantId,
    method: 'delete'
  })
}

// 改变租户状态
export function changeTenantStatus(tenantId, status) {
  const data = {
    tenantId,
    status
  }
  return request({
    url: '/system/tenant/changeStatus',
    method: 'put',
    data: data
  })
}
