package com.luyubo.dubbo.service.impl;
/**
 * ArticleService实现类
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luyubo.dubbo.dao.ArticleDao;
import com.luyubo.dubbo.pojo.Article;
import com.luyubo.dubbo.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleDao articleDao;

	@Override
	public PageInfo<Article> select(Article article, Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<Article>(articleDao.select(article));
	}
}
