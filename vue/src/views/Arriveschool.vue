<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="name"></el-input>
<!--      <el-input style="width: 200px" placeholder="请输入" suffix-icon="el-icon-message" class="ml-5" v-model="email"></el-input>-->
<!--      <el-input style="width: 200px" placeholder="请输入" suffix-icon="el-icon-position" class="ml-5" v-model="address"></el-input>-->
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

<!--    <el-row v-show="isdisplay">-->
<!--      <el-col :span="12">-->
<!--        <div id="pie" style="width: 500px; height: 300px"></div>-->
<!--      </el-col>-->
<!--    </el-row>-->

    <div style="margin: 10px 0">
<!--      <el-button type="primary" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>-->
      <el-button type="primary" @click="shows">查看图表 </el-button>
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" slot="reference" v-if="user.role !== 'ROLE_USER'">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
      <!-- <el-upload action="http://localhost:9777/arriveschool/import" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">
        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>
      </el-upload>
      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button> -->
    </div>

    <el-table :data="tableData" border stripe size="medium"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="80" sortable></el-table-column>
<!--      <el-table-column prop="userid" label="学生id"></el-table-column>-->
      <el-table-column prop="username" label="学生名称"></el-table-column>
      <el-table-column prop="collegename" label="学院名称"></el-table-column>
      <el-table-column prop="classid" label="班级">
        <template v-slot="scope">
          <span v-if="scope.row.classid">{{ classesList.find(v => v.id === scope.row.classid) ? classesList.find(v => v.id === scope.row.classid).name : ''  }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="number" label="学号"></el-table-column>
      <el-table-column prop="status" label="审核状态"></el-table-column>

      <el-table-column label="操作"  width="180" align="center">
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
      <el-table-column label="审核"  width="180" align="center" v-if="user.role !== 'ROLE_USER'">
        <template slot-scope="scope">
          <el-button type="primary" @click="agree(scope.row.id)">同意</el-button>
          <el-button type="danger"  @click="reject(scope.row.id)">拒绝</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="信息" :visible.sync="dialogFormVisible" width="40%" :close-on-click-modal="false">
      <el-form label-width="140px" size="small" style="width: 85%;" :model="form" :rules="rules" ref="ruleForm">
        <el-form-item prop="collegename" label="学院名称">
          <el-input v-model="form.collegename" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="classid" label="班级">
          <el-select clearable v-model="form.classid" placeholder="请选择班级" style="width: 100%">
            <el-option v-for="item in classesList" :key="item.name" :label="item.name" :value="item.id"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item prop="number" label="学号">
          <el-input v-model="form.number" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="信息" :visible.sync="isshow" width="40%" :close-on-click-modal="false">
      <el-row >
        <el-col :span="12">
          <div id="pie1" style="width: 500px; height: 300px"></div>
        </el-col>
      </el-row>
    </el-dialog>

  </div>
</template>

<script>
import router from "@/router";
import * as echarts from "echarts";

export default {
  name: "Arriveschool",
  data() {
    return {
      isshow:false,
      isdisplay:true,
      tableData: [],
      classesList: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      rules: {
        name: [
          { required: true, message: '请输入名称', trigger: 'blur'}
        ],
      }
    }
  },
  created() {
    this.load()
  },

  methods: {
    agree(id){
      this.request.get("/arriveschool/agree", {
        params: {
          id: id
        }
      }).then(res => {
        if (res.code === '200') {
          this.$message.success("审核通过")
          this.load()
        } else {
          this.$message.error(res.msg)
        }
      })

    },
    reject(id){
      this.request.get("/arriveschool/reject", {
        params: {
          id: id
        }
      }).then(res => {
        if (res.code === '200') {
          this.$message.success("审核拒绝")
          this.load()
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    load() {
      this.isshow = true;
      this.request.get("/arriveschool/byTeacherPage", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
          userid:this.user.id,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })
      this.request.get("/classes").then(res => {
        this.classesList = res.data
      })
      this.isshow = false;
    },
    save() {
        this.$refs['ruleForm'].validate((valid) => {
          if (valid) {
            this.form.userid = this.user.id;
            this.form.username = this.user.username;
            this.request.post("/arriveschool", this.form).then(res => {
              if (res.code === '200') {
                this.$message.success("保存成功")
                this.dialogFormVisible = false
                this.load()
              } else {
                this.$message.error(res.msg)
              }
            })
          }
        })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
      this.$nextTick(() => {
        if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
      })
    },
    shows(){
      this.showEcharts().then(() => {
        // 饼图
        const pieOption = {
          title: {
            text: '新生报到数量统计',
            subtext: '比例图',
            left: 'center'
          },
          tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
          },
          legend: {
            orient: 'vertical',
            left: 'left'
          },
          series: [
            {
              name: "报道人数",
              type: 'pie',
              radius: '55%',
              center: ['25%', '70%'],
              label:{            //饼图图形上的文本标签
                normal:{
                  show:true,
                  position:'inner', //标签的位置
                  textStyle : {
                    fontWeight : 300 ,
                    fontSize : 14,    //文字的字体大小
                    color: "#fff"
                  },
                  formatter:'{c}({d}%)'
                }
              },
              data: [],  // 填空
              emphasis: {
                itemStyle: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              }
            },
          ],

        };

        var pieDom = document.getElementById('pie1');
        var pieChart = echarts.init(pieDom);

        this.request.get("/user/members").then(res => {

          pieOption.series[0].data = [
            {name: "已报到人数", value: res.data[0]},
            {name: "未报到人数", value: res.data[1]},
          ]
          pieChart.setOption(pieOption)
        })
      })
    },
    showEcharts(){

      this.isshow = true;
      return new Promise(function(resolve, reject){
        resolve();
      });
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
       this.$nextTick(() => {
         if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
       })
    },
    del(id) {
      this.request.delete("/arriveschool/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      if (!this.multipleSelection.length) {
        this.$message.error("请选择需要删除的数据")
        return
      }
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/arriveschool/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.name = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    handleFileUploadSuccess(res) {
      this.form.file = res
    },
    handleImgUploadSuccess(res) {
      this.form.img = res
    },
    download(url) {
      window.open(url)
    },
    exp() {
      window.open("http://localhost:9777/arriveschool/export")
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
