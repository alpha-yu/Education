import request from '@/utils/request'

// 查询资源列表
export function listResource(query) {
  return request({
    url: '/edu/resource/list',
    method: 'get',
    params: query
  })
}

// 查询资源详细
export function getResource(resourceId) {
  return request({
    url: '/edu/resource/' + resourceId,
    method: 'get'
  })
}

// 新增资源信息
export function addResource(data) {
  return request({
    url: '/edu/resource',
    method: 'post',
    data: data
  })
}

// 修改资源信息
export function updateResource(data) {
  return request({
    url: '/edu/resource',
    method: 'put',
    data: data
  })
}

// 删除资源信息
export function delResource(resourceId) {
  return request({
    url: '/edu/resource/' + resourceId,
    method: 'delete'
  })
}

// 处理带有上传文件的表单，insert和update在后端处理中区分
export function uploadResource(data) {
  return request({
    url: '/edu/resource/upload',
    method: 'post',
    data: data,
    contentType: 'multipart/form-data'
  })
}
