import request from '@/utils/request'

// 查询部门列表
export function listSchool(query) {
  return request({
    url: '/edu/school/list',
    method: 'get',
    params: query
  })
}

// 查询学校详细
export function getSchool(schoolId) {
  return request({
    url: '/edu/school/' + schoolId,
    method: 'get'
  })
}

// 新增学校信息
export function addSchool(data) {
  return request({
    url: '/edu/school',
    method: 'post',
    data: data
  })
}

// 修改学校信息
export function updateSchool(data) {
  return request({
    url: '/edu/school',
    method: 'put',
    data: data
  })
}

// 删除学校信息
export function delSchool(schoolId) {
  return request({
    url: '/edu/school/' + schoolId,
    method: 'delete'
  })
}

// 处理带有上传文件的表单，insert和update在后端处理中区分
export function uploadSchool(data) {
  return request({
    url: '/edu/school/upload',
    method: 'post',
    data: data,
    contentType: 'multipart/form-data'
  })
}

