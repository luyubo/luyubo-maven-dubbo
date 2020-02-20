package com.luyubo.dubbo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.luyubo.dubbo.pojo.Article;

public interface ArticleDao {

	List<Article> select(@Param("article")Article article);
	
}
