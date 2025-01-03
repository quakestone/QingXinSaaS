import request from '@/utils/request'

// 我的发起的流程
export function myProcessList(query) {
  return request({
    url: '/qingxinsaas-flowable/task/myProcess',
    method: 'get',
    params: query
  })
}

export function flowFormData(query) {
  return request({
    url: '/qingxinsaas-flowable/task/flowFormData',
    method: 'get',
    params: query
  })
}

export function flowTaskInfo(query) {
  return request({
    url: '/qingxinsaas-flowable/task/flowTaskInfo',
    method: 'get',
    params: query
  })
}

// 完成任务
export function complete(data) {
  return request({
    url: '/qingxinsaas-flowable/task/complete',
    method: 'post',
    data: data
  })
}

// 取消申请
export function stopProcess(data) {
  return request({
    url: '/qingxinsaas-flowable/task/stopProcess',
    method: 'post',
    data: data
  })
}

// 驳回任务
export function rejectTask(data) {
  return request({
    url: '/qingxinsaas-flowable/task/reject',
    method: 'post',
    data: data
  })
}

// 可退回任务列表
export function returnList(data) {
  return request({
    url: '/qingxinsaas-flowable/task/returnList',
    method: 'post',
    data: data
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
    url: '/qingxinsaas-flowable/deployment/' + id,
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
