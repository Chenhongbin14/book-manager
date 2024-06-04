package com.example.bookmanager.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.bookmanager.pojo.Book;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.bookmanager.pojo.resp.BookResp;
import org.apache.ibatis.annotations.Param;

/**
* @author chb
* @description 针对表【book】的数据库操作Mapper
* @createDate 2024-04-26 17:14:41
* @Entity com.example.bookmanager.pojo.Book
*/
public interface BookMapper extends BaseMapper<Book> {
    IPage<BookResp> findBookAndCategory(IPage<BookResp> page,
                                        @Param("categoryId") Integer categoryId);
}




