import request from '@/utils/request'
import {parseStrEmpty} from "@/utils/ruoyi";

// 查询商品列表
export function listGoods(query) {
  return request({
    url: '/edu/goods/list',
    method: 'get',
    params: query
  })
}

// 查询商品详细
export function getGoods(goodsId) {
  return request({
    url: '/edu/goods/' + parseStrEmpty(goodsId),
    method: 'get'
  })
}

// 新增商品信息
export function addGoods(data) {
  return request({
    url: '/edu/goods',
    method: 'post',
    data: data
  })
}

// 修改商品信息
export function updateGoods(data) {
  return request({
    url: '/edu/goods',
    method: 'put',
    data: data
  })
}

// 删除商品信息
export function delGoods(goodsId) {
  return request({
    url: '/edu/goods/' + goodsId,
    method: 'delete'
  })
}

// 处理带有上传文件的表单，insert和update在后端处理中区分
export function uploadGoods(data) {
  return request({
    url: '/edu/goods/upload',
    method: 'post',
    data: data,
    contentType: 'multipart/form-data'
  })
}

