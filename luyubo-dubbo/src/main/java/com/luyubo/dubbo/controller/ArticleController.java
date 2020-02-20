package com.luyubo.dubbo.controller;
/**
 * Article文章控制器
 * @author 77028
 *
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.luyubo.dubbo.pojo.Article;
import com.luyubo.dubbo.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("/list")
	public String list(String min,String max,Integer sel,Article article,Model model,@RequestParam(defaultValue = "1")Integer pageNum,
			@RequestParam(defaultValue = "5")Integer pageSize) {
		article.setMintime(min);
		article.setMaxtime(max);
		System.out.println(sel);
		article.setSelect(sel);
		System.out.println(article);
		PageInfo<Article> pageInfo=articleService.select(article,pageNum,pageSize);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("min", article.getMintime());
		model.addAttribute("max", article.getMaxtime());
		model.addAttribute("sel", article.getSelect());
		return "article/list";
	}
}
