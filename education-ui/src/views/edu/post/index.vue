<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="岗位内容" prop="postInfo">
        <el-input
          v-model="queryParams.postInfo"
          placeholder="请输入志愿岗位内容"
          clearable
          @keyup.enter.native="handleQuery"
          style="width: 180px"
        />
      </el-form-item>
      <el-form-item label="发起学校" prop="schoolName">
        <el-input
          v-model="queryParams.schoolName"
          placeholder="请输入发起学校名称"
          clearable
          @keyup.enter.native="handleQuery"
          style="width: 180px"
        />
      </el-form-item>
      <el-form-item label="需求状态" prop="comFlag">
        <el-select v-model="queryParams.comFlag" placeholder="需求状态" clearable style="width: 180px">
          <el-option
            v-for="dict in dict.type.edu_post_statu"
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
          v-hasPermi="['edu:post:add']"
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
          v-hasPermi="['edu:post:edit']"
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
          v-hasPermi="['edu:post:remove']"
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
          v-hasPermi="['edu:post:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="postList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="45" align="center"/>
      <el-table-column label="编号" align="center" prop="postId" :show-overflow-tooltip="true" width="100"/>
      <el-table-column label="志愿岗位内容" align="center" prop="postInfo" :show-overflow-tooltip="true" width="650"/>
      <el-table-column label="发起学校" align="center" prop="schoolName" :show-overflow-tooltip="true" width="200"/>
      <el-table-column label="完成状态" align="center" prop="comFlag" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.edu_post_statu" :value="scope.row.comFlag"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['edu:post:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-info"
            @click="handleInfo(scope.row)"
            v-hasPermi="['edu:post:query']"
          >详情
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['edu:post:remove']"
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
            <el-form-item label="岗位内容" prop="postInfo">
              <el-input v-model="form.postInfo" placeholder="请输入志愿岗位详细内容" type="textarea" rows="3"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="发起学校" prop="schoolId">
              <el-select v-model="form.schoolId" placeholder="请选择学校" filterable style="width: 300px">
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
            <el-form-item label="需求状态" prop="comFlag">
              <el-radio-group v-model="form.comFlag">
                <el-radio
                  v-for="dict in dict.type.edu_post_statu"
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
        <el-form-item label="岗位内容">
          <el-input v-model="form.postInfo" type="textarea" rows="3" readonly/>
        </el-form-item>
        <el-row>
          <el-col :span="12">
            <el-form-item label="发起学校">
              <el-input v-model="form.schoolName" readonly/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="完成状态">
              <dict-tag :options="dict.type.edu_post_statu" :value="form.comFlag"/>
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
import {listPost, getPost, delPost, updatePost, addPost} from "@/edu_api/post";

export default {
  name: "Post",
  dicts: ['edu_post_statu'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 岗位数据
      postList: [],
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
        postInfo: undefined,
        schoolName: undefined,
        comFlag: undefined
      },
      // 表单参数
      form: {
        postId: undefined,
        postInfo: undefined,
        schoolId: undefined,
        schoolName: undefined,
        comFlag: '0',
        createBy: undefined,
        createTime: undefined,
        updateBy: undefined,
        updateTime: undefined
      },
      // 表单校验
      rules: {
        postInfo: [
          {required: true, message: "志愿岗位内容不能为空", trigger: "blur"}
        ],
        schoolId: [
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
      listPost(this.queryParams).then(response => {
          this.postList = response.rows;
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
        postId: undefined,
        postInfo: undefined,
        schoolId: undefined,
        schoolName: undefined,
        comFlag: '0',
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
      this.ids = selection.map(item => item.postId)
      this.single = selection.length != 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      getPost().then(response => {
        this.schoolOptions = response.schools;
        this.open = true;
        this.title = "添加岗位信息";
      })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const postId = row.postId || this.ids
      getPost(postId).then(response => {
        this.schoolOptions = response.schools;
        this.form = response.data;
        this.open = true;
        this.title = "修改岗位信息";
      });
    },
    /** 详细按钮操作 */
    handleInfo(row) {
      this.reset();
      const postId = row.postId
      getPost(postId).then(response => {
        this.form = response.data;
        this.infoOpen = true;
        this.title = "岗位信息详情";
      });
    },
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.postId != undefined) {
            updatePost(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPost(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const postIds = row.postId || this.ids;
      this.$modal.confirm('是否确认删除岗位编号为"' + postIds + '"的数据项？').then(function () {
        return delPost(postIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('edu/post/export', {
        ...this.queryParams
      }, `post_${new Date().getTime()}.xlsx`)
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
