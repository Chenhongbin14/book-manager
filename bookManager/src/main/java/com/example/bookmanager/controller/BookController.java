package com.example.bookmanager.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.bookmanager.pojo.Book;
import com.example.bookmanager.pojo.resp.BookResp;
import com.example.bookmanager.pojo.resp.PageResp;
import com.example.bookmanager.service.BookCategoryService;
import com.example.bookmanager.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Objects;

@RestController
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private BookCategoryService bookCategoryService;
    @GetMapping("/getBookList")
    public PageResp<BookResp> getBookList(Integer page,Integer size,Integer id){
        System.out.println(page+"  "+size+"  "+id);
        PageResp<BookResp> resp = new PageResp<BookResp>();
        Page<BookResp> bookRespPage = new Page<>(page, size);
        bookRespPage = (Page<BookResp>) bookService.findBookListByPage(bookRespPage,id);
        resp.setList(bookRespPage.getRecords());
        resp.setTotal(bookRespPage.getTotal());
        return resp;
    }
//    public List getBookList(){return bookService.list();}
    @GetMapping("/getBookListCategory")
    public List getBookCategoryList(){return bookCategoryService.list();}
    @GetMapping("/deleteBook/{id}")
    public String deleteBook(@PathVariable("id")Integer id){
        try {
            bookService.removeById(id);
            return "删除成功！";
        }catch (Exception e){
            e.printStackTrace();
            return "删除失败！";
        }
    }
    @PostMapping("/saveOrUpdate")
    public String saveOrUpdate(@RequestBody Book book){
        try {
            if (Objects.isNull(book.getSelfTime())){
                book.setSelfTime(new Date());
            }
            bookService.saveOrUpdate(book);
            return "操作成功！";
        }catch (Exception e){
            e.printStackTrace();
            return "操作失败！";
        }
    }
}
