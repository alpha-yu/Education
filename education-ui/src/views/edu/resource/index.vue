<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="资源类型" prop="resourceType">
        <el-select v-model="queryParams.resourceType" placeholder="资源类型" clearable style="width: 180px">
          <el-option
            v-for="dict in dict.type.edu_resource_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="适用年级" prop="resourceGrade">
        <el-select v-model="queryParams.resourceGrade" placeholder="适用年级" clearable style="width: 180px">
          <el-option
            v-for="dict in dict.type.edu_resource_grade"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="适用科目" prop="resourceObject">
        <el-select v-model="queryParams.resourceObject" placeholder="适用科目" clearable style="width: 180px">
          <el-option
            v-for="dict in dict.type.edu_resource_object"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="资源状态" prop="norFlag">
        <el-select v-model="queryParams.norFlag" placeholder="资源状态" clearable style="width: 180px">
          <el-option
            v-for="dict in dict.type.edu_resource_statu"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="资源名称" prop="resourceName">
        <el-input
          v-model="queryParams.resourceName"
          placeholder="请输入资源名称"
          clearable
          @keyup.enter.native="handleQuery"
          style="width: 180px"
        />
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
          v-hasPermi="['edu:resource:add']"
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
          v-hasPermi="['edu:resource:edit']"
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
          v-hasPermi="['edu:resource:remove']"
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
          v-hasPermi="['edu:resource:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="resourceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="45" align="center"/>
      <el-table-column label="名称" align="center" prop="resourceName" :show-overflow-tooltip="true" width="150"/>
      <el-table-column label="展示图片" align="center" prop="resourceImg" width="100">
        <template slot-scope="scope">
          <div style="height: 100px;width: 80px;display: grid;justify-items: center;align-items: center">
            <img v-if="scope.row.resourceImg" :src="scope.row.resourceImg" style="max-height: 100px;max-width: 80px;"
                 alt=""/>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="资源网址" align="center" prop="resourceUrl" :show-overflow-tooltip="true" width="200"/>
      <el-table-column label="类型" align="center" prop="resourceType" :show-overflow-tooltip="true" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.edu_resource_type" :value="scope.row.resourceType"/>
        </template>
      </el-table-column>
      <el-table-column label="适用年级" align="center" prop="resourceGrade" :show-overflow-tooltip="true" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.edu_resource_grade" :value="scope.row.resourceGrade"/>
        </template>
      </el-table-column>
      <el-table-column label="适用学科" align="center" prop="resourceObject" :show-overflow-tooltip="true" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.edu_resource_object" :value="scope.row.resourceObject"/>
        </template>
      </el-table-column>
      <el-table-column label="版本" align="center" prop="resourceVer" :show-overflow-tooltip="true" width="200"/>
      <el-table-column label="状态" align="center" prop="norFlag" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.edu_resource_statu" :value="scope.row.norFlag"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['edu:resource:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-info"
            @click="handleInfo(scope.row)"
            v-hasPermi="['edu:resource:query']"
          >详情
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['edu:resource:remove']"
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
          <el-form-item label="资源名称" prop="resourceName">
            <el-input v-model="form.resourceName" placeholder="请输入资源名称"/>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="展示图片" prop="resourceImg">
            <el-upload ref="upload" action="#" :http-request="httpRequest" :show-file-list="false"
                       :before-upload="beforeUpload">
              <el-button size="small" icon="el-icon-upload">选择</el-button>
            </el-upload>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="预览">
            <el-image v-if="form.resourceImg" :src="form.resourceImg" style="width: 150px;object-fit: contain"
                      :preview-src-list="[form.resourceImg]"/>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="资源类型" prop="resourceType">
            <el-select v-model="form.resourceType" placeholder="资源类型">
              <el-option
                v-for="dict in dict.type.edu_resource_type"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="适用年级" prop="resourceGrade">
            <el-select v-model="form.resourceGrade" placeholder="适用年级">
              <el-option
                v-for="dict in dict.type.edu_resource_grade"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="适用学科" prop="resourceObject">
            <el-select v-model="form.resourceObject" placeholder="适用学科">
              <el-option
                v-for="dict in dict.type.edu_resource_object"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="资源网址" prop="resourceUrl">
            <el-input v-model="form.resourceUrl" placeholder="请输入资源网址"/>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="资源版本" prop="resourceVer">
            <el-input v-model="form.resourceVer" placeholder="请输入资源版本"/>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="资源简介" prop="resourceInfo">
            <el-input v-model="form.resourceInfo" placeholder="请输入资源简介" type="textarea" rows="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="状态" prop="norFlag">
            <el-radio-group v-model="form.norFlag">
              <el-radio
                v-for="dict in dict.type.edu_resource_statu"
                :key="dict.value"
                :label="dict.value"
              >{{ dict.label }}
              </el-radio>
            </el-radio-group>
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
        <el-form-item label="资源名称">
          <el-input v-model="form.resourceName" readonly/>
        </el-form-item>
        <el-form-item label="展示图片">
          <el-image v-if="form.resourceImg" :src="form.resourceImg" style="width: 150px;object-fit: contain"
                    :preview-src-list="[form.resourceImg]">
            <div slot="error" class="image-slot"/>
          </el-image>
        </el-form-item>
        <el-col :span="8">
          <el-form-item label="资源类型">
            <dict-tag :options="dict.type.edu_resource_type" :value="form.resourceType"/>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="适用年级">
            <dict-tag :options="dict.type.edu_resource_grade" :value="form.resourceGrade"/>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="适用学科">
            <dict-tag :options="dict.type.edu_resource_object" :value="form.resourceObject"/>
          </el-form-item>
        </el-col>
        <el-form-item label="资源网址">
          <el-input v-model="form.resourceUrl" readonly/>
        </el-form-item>
        <el-form-item label="资源版本">
          <el-input v-model="form.resourceVer" readonly/>
        </el-form-item>
        <el-form-item label="资源简介">
          <el-input v-model="form.resourceInfo" type="textarea" rows="2" readonly/>
        </el-form-item>
        <el-form-item label="状态">
          <dict-tag :options="dict.type.edu_resource_statu" :value="form.norFlag"/>
        </el-form-item>
      </el-form>
    </el-dialog>

  </div>
</template>


<script>
import {listResource, getResource, delResource, uploadResource} from "@/edu_api/resource";

export default {
  name: "Resource",
  dicts: ['edu_resource_statu', 'edu_resource_type', 'edu_resource_grade', 'edu_resource_object'],
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
      // 资源数据
      resourceList: [],
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
        resourceName: undefined,
        resourceType: undefined,
        resourceGrade: undefined,
        resourceObject: undefined,
        norFlag: undefined
      },
      // 表单参数
      form: {
        resourceId: undefined,
        resourceName: undefined,
        resourceImg: undefined,
        resourceInfo: undefined,
        resourceUrl: undefined,
        resourceType: '0',
        resourceGrade: '0',
        resourceObject: '0',
        resourceVer: undefined,
        norFlag: '0'
      },
      // 表单校验
      rules: {
        resourceName: [
          {required: true, message: "资源名称不能为空", trigger: "blur"}
        ],
        // resourceImg: [
        //   {required: true, message: "未上传资源展示图片", trigger: "blur"}
        // ],
        resourceUrl: [
          {required: true, message: "资源网址不能为空", trigger: "blur"}
        ],
        resourceType: [
          {required: true, message: "资源类型不能为空", trigger: "blur"}
        ],
        resourceGrade: [
          {required: true, message: "适用年级不能为空", trigger: "blur"}
        ],
        resourceObject: [
          {required: true, message: "适用科目不能为空", trigger: "blur"},
        ],
        resourceVer: [
          {required: true, message: "资源版本不能为空", trigger: "blur"}
        ],
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
      listResource(this.queryParams).then(response => {
          this.resourceList = response.rows;
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
        resourceId: undefined,
        resourceName: undefined,
        resourceImg: undefined,
        resourceInfo: undefined,
        resourceUrl: undefined,
        resourceType: '0',
        resourceGrade: '0',
        resourceObject: '0',
        resourceVer: undefined,
        norFlag: '0'
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
      this.ids = selection.map(item => item.resourceId)
      this.names = selection.map(item => item.resourceName)
      this.single = selection.length != 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加资源信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const resourceId = row.resourceId || this.ids
      getResource(resourceId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改资源信息";
      });
    },
    /** 详细按钮操作 */
    handleInfo(row) {
      this.reset();
      const resourceId = row.resourceId
      getResource(resourceId).then(response => {
        this.form = response.data;
        this.infoOpen = true;
        this.title = "资源信息详情";
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
            this.form.resourceImg = "";
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
          uploadResource(formData).then(response => {
            this.$modal.msgSuccess("上传成功");
            this.open = false;
            this.getList();
          });
        }
      });

    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const resourceIds = row.resourceId || this.ids;
      const resourceNames = row.resourceName || this.names;
      this.$modal.confirm('是否确认删除资源名称为"' + resourceNames + '"的数据项？').then(function () {
        return delResource(resourceIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('edu/resource/export', {
        ...this.queryParams
      }, `resource_${new Date().getTime()}.xlsx`)
    },
    //
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
      this.form.resourceImg = null;
      reader.onload = () => {
        this.form.resourceImg = reader.result;
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
        this.form.resourceImg = data.url;
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
    }
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
