import request from '@/utils/request'
import {parseStrEmpty} from "@/utils/ruoyi";

// 查询商品列表
export function listPost(query) {
  return request({
    url: '/edu/post/list',
    method: 'get',
    params: query
  })
}

// 查询商品详细
export function getPost(postId) {
  return request({
    url: '/edu/post/' + parseStrEmpty(postId),
    method: 'get'
  })
}

// 新增商品信息
export function addPost(data) {
  return request({
    url: '/edu/post',
    method: 'post',
    data: data
  })
}

// 修改商品信息
export function updatePost(data) {
  return request({
    url: '/edu/post',
    method: 'put',
    data: data
  })
}

// 删除商品信息
export function delPost(postId) {
  return request({
    url: '/edu/post/' + postId,
    method: 'delete'
  })
}

// 处理带有上传文件的表单，insert和update在后端处理中区分
export function uploadPost(data) {
  return request({
    url: '/edu/post/upload',
    method: 'post',
    data: data,
    contentType: 'multipart/form-data'
  })
}

