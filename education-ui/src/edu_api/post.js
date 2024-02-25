import request from '@/utils/request'
import {parseStrEmpty} from "@/utils/ruoyi";

// 查询岗位列表
export function listPost(query) {
  return request({
    url: '/edu/post/list',
    method: 'get',
    params: query
  })
}

// 查询岗位详细
export function getPost(postId) {
  return request({
    url: '/edu/post/' + parseStrEmpty(postId),
    method: 'get'
  })
}

// 新增岗位信息
export function addPost(data) {
  return request({
    url: '/edu/post',
    method: 'post',
    data: data
  })
}

// 修改岗位信息
export function updatePost(data) {
  return request({
    url: '/edu/post',
    method: 'put',
    data: data
  })
}

// 删除岗位信息
export function delPost(postId) {
  return request({
    url: '/edu/post/' + postId,
    method: 'delete'
  })
}
