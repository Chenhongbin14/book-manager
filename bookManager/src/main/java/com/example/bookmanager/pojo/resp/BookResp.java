package com.example.bookmanager.pojo.resp;

import com.example.bookmanager.pojo.Book;
import lombok.Data;

@Data
public class BookResp extends Book {
    private String categoryName;
}
