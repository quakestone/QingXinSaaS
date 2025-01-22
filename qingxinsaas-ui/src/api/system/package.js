import request from '@/utils/request'

// 查询租户套餐列表
export function listPackage(query) {
  return request({
    url: '/system/package/list',
    method: 'get',
    params: query
  })
}

// 查询租户套餐详细
export function getPackage(packageId) {
  return request({
    url: '/system/package/' + packageId,
    method: 'get'
  })
}

// 新增租户套餐
export function addPackage(data) {
  return request({
    url: '/system/package',
    method: 'post',
    data: data
  })
}

// 修改租户套餐
export function updatePackage(data) {
  return request({
    url: '/system/package',
    method: 'put',
    data: data
  })
}

// 删除租户套餐
export function delPackage(packageId) {
  return request({
    url: '/system/package/' + packageId,
    method: 'delete'
  })
}
