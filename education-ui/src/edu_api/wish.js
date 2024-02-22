import request from '@/utils/request'
import {parseStrEmpty} from "@/utils/ruoyi";

// 查询心愿列表
export function listWish(query) {
  return request({
    url: '/edu/wish/list',
    method: 'get',
    params: query
  })
}

// 查询心愿详细
export function getWish(wishId) {
  return request({
    url: '/edu/wish/' + parseStrEmpty(wishId),
    method: 'get'
  })
}

// 新增心愿信息
export function addWish(data) {
  return request({
    url: '/edu/wish',
    method: 'post',
    data: data
  })
}

// 修改心愿信息
export function updateWish(data) {
  return request({
    url: '/edu/wish',
    method: 'put',
    data: data
  })
}

// 删除心愿信息
export function delWish(wishId) {
  return request({
    url: '/edu/wish/' + wishId,
    method: 'delete'
  })
}

// 处理带有上传文件的表单，insert和update在后端处理中区分
export function uploadWish(data) {
  return request({
    url: '/edu/wish/upload',
    method: 'post',
    data: data,
    contentType: 'multipart/form-data'
  })
}

