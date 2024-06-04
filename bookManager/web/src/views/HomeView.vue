<template>
  按图书类别查询：
  <a-select
      v-model:value="categoryId"
      style="width: 120px"
      :options="category"  placeholder="不限类型">
  </a-select>
  <a-button type="primary" @click="query()">
    查询
  </a-button>
  <a-space size="small" style="margin-left:50px">
    <router-link to="/addBook">
      <a-button>
        添加图书信息
      </a-button>
    </router-link>
  </a-space>
  <a-table :columns="columns" :data-source="data" :pagination="pagination" @change="handleTableChange">
    <template #indexDraw="{index}">
      {{convering(index+1)}}
    </template>
    <template #bodyCell="{ column, text,record }">
      <template v-if="column.dataIndex === 'categoryName'">
        <a @click="updateBook(record)">{{ text }}</a>
      </template>
    </template>
  </a-table>
  <!--  {{book}}-->
</template>

<script lang="ts">
import { defineComponent,onMounted,ref } from 'vue';
import axios from "axios";
import {SelectProps} from 'Ant-design-vue'
import moment from 'moment'
import {useRouter} from 'vue-router'

const columns = [
  {
    title: '序号',
    dataIndex: 'indexDraw',
    fixed:'left',
    slots:{customRender:'indexDraw'}
  },
  {
    title: '图书名称',
    dataIndex: 'name'
  },
  {
    title: '出版日期',
    dataIndex: 'publishTime',
    customRender:(text:any,row:any,index:any)=>{
      return moment(text).format('YYYY-MM-DD');
    }
  },
  {
    title: '出版社',
    dataIndex: 'publishName'
  },
  {
    title: '价格',
    dataIndex: 'price'
  },
  {
    title: '图书类别',
    dataIndex: 'categoryName'
  }
];

const data = [
  {
    key: '1',
    name: 'John Brown',
    age: 32,
    address: 'New York No. 1 Lake Park, New York No. 1 Lake Park',
    tags: ['nice', 'developer'],
  },
  {
    key: '2',
    name: 'Jim Green',
    age: 42,
    address: 'London No. 2 Lake Park, London No. 2 Lake Park',
    tags: ['loser'],
  },
  {
    key: '3',
    name: 'Joe Black',
    age: 32,
    address: 'Sidney No. 1 Lake Park, Sidney No. 1 Lake Park',
    tags: ['cool', 'teacher'],
  },
];

export default defineComponent({
  name: 'HomeView',
  setup() {


    const router = useRouter();
    const pagination =ref({
      current:1,
      pageSize:3,
      total:0
    });

    const updateBook = (book:any)=>{
      //编程式路由导航
      router.push({
        path:'/updateBook',
        query:{data:JSON.stringify(book)} //传递了一些数据跳转到指定目标页面
      });
    }

    const query = ()=>{
      queryBookList({
        page:1,
        size:pagination.value.pageSize
      });
    }

    //声明了一个响应式的book对象
    //const book = ref();
    const data = ref();
    //钩子函数
    onMounted(()=>{
      queryBookList({
        page:1,
        size:pagination.value.pageSize
      });
      queryBookCategoryList();
    })

    const queryBookList=(params:any)=>{
      axios.get("http://localhost:8080/getBookList",{
        params:{
          page:params.page,
          size:params.size,
          id:categoryId.value
        }
      }).then((resp)=>{
        console.log('resp:',resp);
        data.value=resp.data.list;
        //重置分页的按钮
        pagination.value.current=params.page;
        pagination.value.total=resp.data.total;
      });
    }

    // 表格单击页码时触发的函数
    const handleTableChange=(pagination:any)=>{
      queryBookList({
        page:pagination.current,
        size:pagination.pageSize
      });
    };

    const category = ref<SelectProps['options']>([]);
    const categoryId = ref();

    const convering = (index:number)=>{
      return String(index).padStart(2,'0');
    }


    //获得所有图书类型数据
    const queryBookCategoryList = ()=>{
      axios.get("http://localhost:8080/getBookListCategory").then((resp)=>{
        const data = resp.data;
        data.unshift({id:'',name:'不限类型'});
        console.log(data);
        category.value = data.map((item:{id:number,name:string})=>({
          value:item.id,
          label:item.name
        }));
      });
    }
    return {
      data,
      columns,
      category,
      categoryId,
      query,
      handleTableChange,
      pagination,
      updateBook,
      convering
    };
  },
});
</script>