import request from '@/utils/request'

// 查询流程达式列表
export function listExpression(query) {
  return request({
    url: '/qingxinsaas-flowable/expression/list',
    method: 'get',
    params: query
  })
}

// 查询流程达式详细
export function getExpression(id) {
  return request({
    url: '/qingxinsaas-flowable/expression/' + id,
    method: 'get'
  })
}

// 新增流程达式
export function addExpression(data) {
  return request({
    url: '/qingxinsaas-flowable/expression',
    method: 'post',
    data: data
  })
}

// 修改流程达式
export function updateExpression(data) {
  return request({
    url: '/qingxinsaas-flowable/expression',
    method: 'put',
    data: data
  })
}

// 删除流程达式
export function delExpression(id) {
  return request({
    url: '/qingxinsaas-flowable/expression/' + id,
    method: 'delete'
  })
}
