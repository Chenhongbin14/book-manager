package com.example.bookmanager.pojo.resp;

import com.example.bookmanager.pojo.Book;
import lombok.Data;

import java.util.List;
@Data
public class PageResp <T>{
    private Long total;
    private List<T> list;
}
