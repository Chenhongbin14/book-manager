package com.example.bookmanager.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.bookmanager.pojo.BookCategory;
import com.example.bookmanager.service.BookCategoryService;
import com.example.bookmanager.mapper.BookCategoryMapper;
import org.springframework.stereotype.Service;

/**
* @author chb
* @description 针对表【book_category】的数据库操作Service实现
* @createDate 2024-04-26 17:14:41
*/
@Service
public class BookCategoryServiceImpl extends ServiceImpl<BookCategoryMapper, BookCategory>
    implements BookCategoryService{

}




