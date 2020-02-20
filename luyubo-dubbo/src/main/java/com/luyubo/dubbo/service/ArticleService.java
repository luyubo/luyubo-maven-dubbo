package com.luyubo.dubbo.service;

/*
 * ArticleService接口
 */
import com.github.pagehelper.PageInfo;
import com.luyubo.dubbo.pojo.Article;

public interface ArticleService {

	PageInfo<Article> select(Article article, Integer pageNum, Integer pageSize);

}
