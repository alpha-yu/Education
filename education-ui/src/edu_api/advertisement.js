import request from '@/utils/request'
import {parseStrEmpty} from "@/utils/ruoyi";

// 查询广告列表
export function listAdvertisement(query) {
  return request({
    url: '/edu/advertisement/list',
    method: 'get',
    params: query
  })
}

// 查询广告详细
export function getAdvertisement(advertisementId) {
  return request({
    url: '/edu/advertisement/' + parseStrEmpty(advertisementId),
    method: 'get'
  })
}

// 新增广告信息
export function addAdvertisement(data) {
  return request({
    url: '/edu/advertisement',
    method: 'post',
    data: data
  })
}

// 修改广告信息
export function updateAdvertisement(data) {
  return request({
    url: '/edu/advertisement',
    method: 'put',
    data: data
  })
}

// 删除广告信息
export function delAdvertisement(advertisementId) {
  return request({
    url: '/edu/advertisement/' + advertisementId,
    method: 'delete'
  })
}

// 处理带有上传文件的表单，insert和update在后端处理中区分
export function uploadAdvertisement(data) {
  return request({
    url: '/edu/advertisement/upload',
    method: 'post',
    data: data,
    contentType: 'multipart/form-data'
  })
}

