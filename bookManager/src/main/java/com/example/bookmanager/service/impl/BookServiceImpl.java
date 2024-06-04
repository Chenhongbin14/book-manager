package com.example.bookmanager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.bookmanager.pojo.Book;
import com.example.bookmanager.pojo.resp.BookResp;
import com.example.bookmanager.service.BookService;
import com.example.bookmanager.mapper.BookMapper;
import org.springframework.stereotype.Service;

/**
* @author chb
* @description 针对表【book】的数据库操作Service实现
* @createDate 2024-04-26 17:14:41
*/
@Service
public class BookServiceImpl extends ServiceImpl<BookMapper, Book>
    implements BookService{
    @Override
    public IPage<BookResp> findBookListByPage(IPage<BookResp> page,Integer id){
        return this.baseMapper.findBookAndCategory(page,id);
    }
}




