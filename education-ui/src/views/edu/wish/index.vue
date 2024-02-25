<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="心愿名称" prop="wishName">
        <el-input
          v-model="queryParams.wishName"
          placeholder="请输入心愿名称"
          clearable
          @keyup.enter.native="handleQuery"
          style="width: 180px"
        />
      </el-form-item>
      <el-form-item label="发起学校" prop="wisherSchoolName">
        <el-input
          v-model="queryParams.wisherSchoolName"
          placeholder="请输入发起学校"
          clearable
          @keyup.enter.native="handleQuery"
          style="width: 180px"
        />
      </el-form-item>
      <el-form-item label="认领者" prop="claimantName">
        <el-input
          v-model="queryParams.claimantName"
          placeholder="请输入认领者"
          clearable
          @keyup.enter.native="handleQuery"
          style="width: 180px"
        />
      </el-form-item>
      <el-form-item label="认领状态" prop="claimFlag">
        <el-select v-model="queryParams.claimFlag" placeholder="认领状态" clearable style="width: 180px">
          <el-option
            v-for="dict in dict.type.edu_wish_statu"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['edu:wish:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['edu:wish:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['edu:wish:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['edu:wish:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="wishList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="45" align="center"/>
      <el-table-column label="图片" align="center" prop="wishImg" width="150">
        <template slot-scope="scope">
          <div style="height: 80px;width: 80px;display: grid;justify-items: center;align-items: center">
            <img v-if="scope.row.wishImg" :src="scope.row.wishImg" alt=""
                 style="max-height: 80px;max-width: 130px;position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);"/>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="名称" align="center" prop="wishName" :show-overflow-tooltip="true" width="150"/>
      <el-table-column label="简介" align="center" prop="wishInfo" :show-overflow-tooltip="true" width="200"/>
      <el-table-column label="发起学校" align="center" prop="wisherSchoolName" :show-overflow-tooltip="true"
                       width="150"/>
      <el-table-column label="发起人" align="center" prop="wisherName" :show-overflow-tooltip="true" width="150"/>
      <el-table-column label="认领者" align="center" prop="claimantName" :show-overflow-tooltip="true" width="150"/>
      <el-table-column label="认领状态" align="center" prop="claimFlag" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.edu_wish_statu" :value="scope.row.claimFlag"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['edu:wish:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-info"
            @click="handleInfo(scope.row)"
            v-hasPermi="['edu:wish:query']"
          >详情
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['edu:wish:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-col :span="24">
          <el-form-item label="心愿名称" prop="wishName">
            <el-input v-model="form.wishName" placeholder="请输入心愿名称"/>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="图片" prop="wishImg">
            <el-upload ref="upload" action="#" :http-request="httpRequest" :show-file-list="false"
                       :before-upload="beforeUpload">
              <el-button size="small" icon="el-icon-upload">选择</el-button>
            </el-upload>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="预览">
            <el-image v-if="form.wishImg" :src="form.wishImg" style="width: 150px;object-fit: contain"
                      :preview-src-list="[form.wishImg]">
              <div slot="error" class="image-slot"/>
            </el-image>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="心愿简介" prop="wishInfo">
            <el-input v-model="form.wishInfo" placeholder="请输入心愿简介" type="textarea" rows="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="发起学校" prop="wisherSchoolId">
            <el-select v-model="form.wisherSchoolId" placeholder="请选择学校" filterable style="width: 300px">
              <el-option
                v-for="item in schoolOptions"
                :key="item.schoolId"
                :label="item.schoolName"
                :value="item.schoolId"
              ></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="发起人" prop="wisherName">
            <el-input v-model="form.wisherName" placeholder="请输入发起人"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="认领状态" prop="claimFlag">
            <el-radio-group v-model="form.claimFlag" @change="handleClaimFlagChange">
              <el-radio
                v-for="dict in dict.type.edu_wish_statu"
                :key="dict.value"
                :label="dict.value"
              >{{ dict.label }}
              </el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="认领人" prop="claimantName">
            <el-input v-model="form.claimantName" placeholder="请输入认领人" @change="handleClaimantNameInput"/>
          </el-form-item>
        </el-col>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 详情对话框 -->
    <el-dialog :title="title" :visible.sync="infoOpen" width="800px" append-to-body>
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="心愿名称">
          <el-input v-model="form.wishName" placeholder="请输入心愿名称" readonly/>
        </el-form-item>
        <el-form-item label="图片">
          <el-image v-if="form.wishImg" :src="form.wishImg" style="width: 150px;object-fit: contain"
                    :preview-src-list="[form.wishImg]"/>
        </el-form-item>
        <el-form-item label="心愿简介">
          <el-input v-model="form.wishInfo" type="textarea" rows="2" readonly/>
        </el-form-item>
        <el-row>
          <el-col :span="12">
            <el-form-item label="发起学校">
              <el-input v-model="form.wisherSchoolName" readonly/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="发起人">
              <el-input v-model="form.wisherName" readonly/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="认领状态">
              <dict-tag :options="dict.type.edu_wish_statu" :value="form.claimFlag"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="认领人">
              <el-input v-model="form.claimantName" readonly/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="创建人">
              <el-input v-model="form.createBy" readonly/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="创建时间">
              <el-input v-model="form.createTime" readonly/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="修改人">
              <el-input v-model="form.updateBy" readonly/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="修改时间">
              <el-input v-model="form.updateTime" readonly/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-dialog>

  </div>
</template>

<script>
import {listWish, getWish, updateWish, addWish, delWish, uploadWish} from "@/edu_api/wish";

export default {
  name: "Wish",
  dicts: ['edu_wish_statu'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      names: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 心愿数据
      wishList: [],
      // 学校选项
      schoolOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示修改弹出层
      open: false,
      // 是否显示详情弹出层
      infoOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        wishName: undefined,
        wisherSchoolName: undefined,
        claimantName: undefined,
        claimFlag: undefined
      },
      // 表单参数
      form: {
        wishId: undefined,
        wishName: undefined,
        wishImg: undefined,
        wishInfo: undefined,
        wisherSchoolId: undefined,
        wisherSchoolName: undefined,
        wisherName: undefined,
        claimantName: undefined,
        claimFlag: '0',
        createBy: undefined,
        createTime: undefined,
        updateBy: undefined,
        updateTime: undefined
      },
      // 表单校验
      rules: {
        wishName: [
          {required: true, message: "心愿名称不能为空", trigger: "blur"}
        ],
        // wishImg: [
        //   {required: true, message: "未上传心愿图片", trigger: "blur"}
        // ],
        wisherSchoolId: [
          {required: true, message: "学校不能为空", trigger: "blur"}
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询字典类型列表 */
    getList() {
      this.loading = true;
      listWish(this.queryParams).then(response => {
          this.wishList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        wishId: undefined,
        wishName: undefined,
        wishImg: undefined,
        wishInfo: undefined,
        wisherSchoolId: undefined,
        wisherSchoolName: undefined,
        wisherName: undefined,
        buyerName: undefined,
        claimFlag: '0',
        createBy: undefined,
        createTime: undefined,
        updateBy: undefined,
        updateTime: undefined
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 多选框选中数据 */
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.wishId)
      this.names = selection.map(item => item.wishName)
      this.single = selection.length != 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      getWish().then(response => {
        this.schoolOptions = response.schools;
        this.open = true;
        this.title = "添加心愿信息";
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const wishId = row.wishId || this.ids
      getWish(wishId).then(response => {
        this.schoolOptions = response.schools;
        this.form = response.data;
        this.open = true;
        this.title = "修改心愿信息";
      });
    },
    /** 详细按钮操作 */
    handleInfo(row) {
      this.reset();
      const wishId = row.wishId
      getWish(wishId).then(response => {
        this.form = response.data;
        this.infoOpen = true;
        this.title = "心愿信息详情";
      });
    },
    /** 提交按钮 */
    submitForm: function () {
      let formData = new FormData();
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.file != null) {
            formData.append("file", this.form.file);
            this.form.api = process.env.VUE_APP_BASE_API;
            this.form.wishImg = "";
          } else {
            formData.append("file", new Blob());
          }

          Object.keys(this.form).forEach(key => {
            if (this.form[key] instanceof Array) {
              // 如果是数组就循环加入表单，key保持相同即可，这就是表单的数组
              this.form[key].forEach(item => {
                if (item == null) {
                  formData.append(key, '');
                } else {
                  formData.append(key, item);
                }
              })
            } else {
              // 如果不是数组就直接追加进去
              if (this.form[key] == null) {
                formData.append(key, '');
              } else {
                formData.append(key, this.form[key]);
              }
            }
          })

          // 文件上传
          this.$modal.msgWarning("正在上传");
          uploadWish(formData).then(response => {
            this.$modal.msgSuccess("上传成功");
            this.open = false;
            this.getList();
          });
        }
      });

    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const wishIds = row.wishId || this.ids;
      const wishNames = row.wishName || this.names;
      this.$modal.confirm('是否确认删除心愿名称为"' + wishNames + '"的数据项？').then(function () {
        return delWish(wishIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('edu/wish/export', {
        ...this.queryParams
      }, `wish_${new Date().getTime()}.xlsx`)
    },

    // 打开文件选择器
    openFile: function () {
      document.getElementById('photoFind').click()
    },
    // 上传前检查
    beforeUpload(file) {
      const type = ['image/jpg', 'image/png', 'image/jpeg']
      const isImg = type.includes(file.type);
      if (!isImg) {
        this.$message.error("请上传jpg/png/jpeg格式图片");
        return;
      }
      const reader = new FileReader();
      reader.readAsDataURL(file);
      this.form.wishImg = null;
      reader.onload = () => {
        this.form.wishImg = reader.result;
      };
      this.$modal.msgWarning("正在处理");
      return isImg;
    },
    // 文件数量超出处理
    handleExceed(files, fileList) {
      this.$message.warning(
        `当前限制选择 1 个文件，本次选择了 ${files.length} 个文件，共选择了 ${
          files.length + fileList.length
        } 个文件`
      );
    },
    // 文件上传成功处理
    handleUploadSuccess(files) {
      if (files.code === 200) {
        const {data} = files;
        this.form.wishImg = data.url;
        this.isDisabled = true
      }
    },
    //上传文件处理
    handleChange(file, fileList) {
      if (fileList.length > 0) {
        this.fileList = [fileList[fileList.length - 1]]// 这一步，是 展示最后一次选择的文件
      }
    },
    // 自定义的提交函数，取出文件设置进请求参数
    httpRequest(param) {
      this.form.file = param.file
    },
    // 处理认领人输入
    handleClaimantNameInput() {
      if (this.form.claimantName != "") {
        this.form.claimFlag = "1"
      }
    },
    // 处理认领状态切换
    handleClaimFlagChange() {
      if (this.form.claimFlag != "1") {
        this.form.claimantName = undefined
      }
    },
  }
};
</script>

<style>
.el-textarea__inner {
  font-family: 微软雅黑, Arial, Helvetica, sans-serif !important;
}

.el-input__inner {
  font-family: 微软雅黑, Arial, Helvetica, sans-serif !important;
}
</style>
