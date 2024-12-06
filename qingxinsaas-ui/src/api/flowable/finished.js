import request from '@/utils/request'

// 查询已办任务列表
export function finishedList(query) {
  return request({
    url: '/qingxinsaas-flowable/task/finishedList',
    method: 'get',
    params: query
  })
}

// 任务流转记录
export function flowRecord(query) {
  return request({
    url: '/qingxinsaas-flowable/task/flowRecord',
    method: 'get',
    params: query
  })
}

// 部署流程实例
export function deployStart(deployId) {
  return request({
    url: '/qingxinsaas-flowable/process/startFlow/' + deployId,
    method: 'get',
  })
}

// 查询流程定义详细
export function getDeployment(id) {
  return request({
    url: '/qingxinsaas-flowable/deployment/' + id,
    method: 'get'
  })
}

// 新增流程定义
export function addDeployment(data) {
  return request({
    url: '/qingxinsaas-flowable/deployment',
    method: 'post',
    data: data
  })
}

// 修改流程定义
export function updateDeployment(data) {
  return request({
    url: '/qingxinsaas-flowable/deployment',
    method: 'put',
    data: data
  })
}

// 删除流程定义
export function delDeployment(id) {
  return request({
    url: '/qingxinsaas-flowable/instance/delete/' + id,
    method: 'delete'
  })
}

// 导出流程定义
export function exportDeployment(query) {
  return request({
    url: '/qingxinsaas-flowable/deployment/export',
    method: 'get',
    params: query
  })
}
