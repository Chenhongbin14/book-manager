<script setup lang="ts">

</script>

<template>
  <a-form
      :model="book"
      name="basic"
      :label-col="{ span: 8 }"
      :wrapper-col="{ span: 8 }"
      autocomplete="off"
  >
    <a-form-item
        label="图书类型"
        name="categoryId"
        :rules="[{ required: true, message: '请选择图书类型' }]"
    >
      <a-select
          v-model:value="book.categoryId"
          style="width: 510px;text-align: left;"
          :options="category"
      ></a-select>
    </a-form-item>

    <a-form-item
        label="图书名称"
        name="name"
        :rules="[{ required: true, message: '请输入图书名称' }]"
    >
      <a-input v-model:value="book.name" />
    </a-form-item>

    <a-form-item
        label="出版日期"
        name="publishTime"
        :rules="[{ required: true, message: '请输入出版日期' }]"
    >
      <a-date-picker v-model:value="book.publishTime" style="width: 510px"/>
    </a-form-item>

    <a-form-item
        label="价格"
        name="price"
        :rules="[{ required: true,
        pattern: /([1-9]([0-9]+)?(.[0-9]{1,2})?$)|(^(0){1}$)|([0-9].0-9?$)/,
        message: '请输入正确的价格' }]"
    >
      <a-input v-model:value="book.price" />
    </a-form-item>
    <a-form-item
        label="出版社"
        name="publishName"
        :rules="[{ required: true, message: '请输入出版社' }]"
    >
      <a-input v-model:value="book.publishName" />
    </a-form-item>

    <a-form-item :wrapper-col="{ offset: 8, span: 8 }">
      <a-button type="primary" html-type="submit" @click="save()">保存</a-button>
      <a-button style="margin-left: 50px" type="primary" ghost @click="reset()">重置</a-button>
      <router-link to="/">
        <a-button style="margin-left: 50px" >返回</a-button>
      </router-link>
    </a-form-item>

  </a-form>
</template>
<script lang="ts">

import {defineComponent, onMounted, reactive, ref} from 'vue';
import {message, SelectProps } from "ant-design-vue";
import axios from "axios";

export default defineComponent({
  name: 'AddBook',
  setup(){

    const book = ref({});


    const category = ref<SelectProps['options']>([]);
    const categoryId = ref();

    const queryBookCategoryList = ()=>{
      axios.get("http://localhost:8080/getBookListCategory").then(function (resp){
        const data = resp.data;
        category.value = data.map((item: {id: number, name: string}) => ({
          value: item.id ,
          label: item.name
        }));
      })
    }
    const save = ()=>{
      //校验book内容是否为空，触发组件的非空校验
      if (!(JSON.stringify(book.value)== '{}')){
        axios.post("http://localhost:8080/saveOrUpdate",book.value).then((resp)=>{
          message.success(resp.data);
          book.value = {};
        })
      }
    }
    const reset = ()=>{
      book.value = {};
    }

    onMounted(()=>{
      queryBookCategoryList();
    })


    return{
      book,
      category,
      categoryId,
      reset,
      save,
    }
  }
});
</script>
<style scoped>

</style>