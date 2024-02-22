package com.education.web.controller.edu;

import com.education.common.annotation.Log;
import com.education.common.config.RuoYiConfig;
import com.education.common.core.controller.BaseController;
import com.education.common.core.domain.AjaxResult;
import com.education.common.core.page.TableDataInfo;
import com.education.common.enums.BusinessType;
import com.education.common.utils.StringUtils;
import com.education.common.utils.file.FileUploadUtils;
import com.education.common.utils.file.MimeTypeUtils;
import com.education.common.utils.poi.ExcelUtil;
import com.education.edu.domain.Goods;
import com.education.edu.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/edu/goods")
public class GoodsController extends BaseController {

    @Autowired
    private IGoodsService goodsService;

    /**
     * 获取商品列表
     */
    @PreAuthorize("@ss.hasPermi('edu:goods:list')")
    @GetMapping("/list")
    public TableDataInfo list(Goods goods) {
        startPage();
        List<Goods> goodsList = goodsService.selectGoodsList(goods);
        return getDataTable(goodsList);
    }

    /**
     * 根据商品编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:goods:query')")
    @GetMapping(value = "/{goodsId}")
    public AjaxResult getInfo(@PathVariable Long goodsId) {
        return success(goodsService.selectGoodsById(goodsId));
    }

    /**
     * 新增商品信息
     */
    @PreAuthorize("@ss.hasPermi('edu:goods:add')")
    @Log(title = "商品管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody Goods goods) {
        goods.setCreateBy(getUsername());
        return toAjax(goodsService.insertGoods(goods));
    }

    /**
     * 修改商品信息
     */
    @PreAuthorize("@ss.hasPermi('edu:goods:edit')")
    @Log(title = "商品管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody Goods goods) {
        goods.setUpdateBy(getUsername());
        return toAjax(goodsService.updateGoods(goods));
    }

    /**
     * 删除商品信息
     */
    @PreAuthorize("@ss.hasPermi('edu:goods:remove')")
    @Log(title = "商品管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{goodsIds}")
    public AjaxResult remove(@PathVariable Long[] goodsIds) {
        return toAjax(goodsService.deleteGoodsByIds(goodsIds));
    }

    /**
     * 导出商品信息
     */
    @Log(title = "商品管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('edu:goods:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, Goods goods) {
        List<Goods> list = goodsService.selectGoodsList(goods);
        ExcelUtil<Goods> util = new ExcelUtil<>(Goods.class);
        util.exportExcel(response, list, "商品数据");
    }

    /**
     * 处理带有文件的表单
     */
    @PreAuthorize("@ss.hasPermi('edu:goods:edit')")
    @Log(title = "商品管理", businessType = BusinessType.UPDATE)
    @PostMapping("/upload")
    public AjaxResult upload(@RequestParam("file") MultipartFile file, Goods goods) throws Exception {
        if (!file.isEmpty()) {
            String avatar = FileUploadUtils.upload(RuoYiConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
            goods.setGoodsImg(goods.getApi() + avatar);
        }
        if (goods.getGoodsId() == null) {
            goods.setCreateBy(getUsername());
            return toAjax(goodsService.insertGoods(goods));
        }
        if (goods.getGoodsId() != null) {
            goods.setUpdateBy(getUsername());
            return toAjax(goodsService.updateGoods(goods));
        }
        return AjaxResult.error();
    }
}
