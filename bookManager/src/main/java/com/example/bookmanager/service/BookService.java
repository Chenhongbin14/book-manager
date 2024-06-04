package com.example.bookmanager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.bookmanager.pojo.Book;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.bookmanager.pojo.resp.BookResp;

/**
* @author chb
* @description 针对表【book】的数据库操作Service
* @createDate 2024-04-26 17:14:41
*/
public interface BookService extends IService<Book> {
    IPage<BookResp> findBookListByPage(IPage<BookResp> page,Integer id);
}
