package com.luyubo.dubbo.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Jsp页面请求失误,一般是用户失误
 * @author 77028
 *
 */
@Controller
public class ErrorForJsp {
	@RequestMapping("/error/article/operate/select")
	public String error() {
		return "error/article/operate/select";
	}
}
