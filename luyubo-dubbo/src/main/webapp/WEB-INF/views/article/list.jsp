<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章显示页</title>
<link rel="stylesheet" href="public/css/index3.css">
<script type="text/javascript" src="public/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="public/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<form action="list" method="post">
		<input type="hidden" name="pageNum">
		<!-- 请注意不能选择开始时间大于结束时间否则报错 -->
		时间:<input type="text" name="min" id="min" value="${min }" onclick="WdatePicker()">-
		    <input type="text" name="max" id="max" value="${max }" onclick="WdatePicker()">
		选项:<select name="sel" id="sel">
				<option value="">请选择内容...</option>
				<option value="1" <c:if test="${'1' eq sel}">selected</c:if>>创建时间</option>
				<option value="2" <c:if test="${'2' eq sel}">selected</c:if>>用户</option>
				<option value="3" <c:if test="${'3' eq sel}">selected</c:if>>评论数</option>
		</select>
		<input type="submit" value="查询">
	</form>
	<table>
		<tr>
			<td>编号</td>
			<td>标题</td>
			<td>内容</td>
			<td>图片</td>
			<td>作者</td>
			<td>点击</td>
			<td>热度</td>
			<td>创建时间</td>
			<td>评论数</td>
		</tr>
		<c:forEach items="${pageInfo.list }" var="article">
			<tr>
				<td>${article.id }</td>
				<td>${article.title }</td>
				<td>${article.content }</td>
				<td>
					<img src="${article.picture }"  style="height:5px;width:5px;border-radius: 5px;">
				</td>
				<td>${article.username }</td>
				<td>${article.hits }</td>
				<td>${article.hot }</td>
				<td><fmt:formatDate value="${article.created}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${article.commentCnt}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="9">
				<input type="button" value="首页" onclick="fenye(1)">
				<input type="button" value="上一页" onclick="fenye(${pageInfo.prePage==0?1:pageInfo.prePage})">
				<input type="button" value="下一页" onclick="fenye(${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage})">
				<input type="button" value="尾页" onclick="fenye(${pageInfo.pages})">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				当前${pageInfo.pageNum}/${pageInfo.pages}页，共${pageInfo.total}条数据
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		$(function(){
			var min=$("#min").val();
			var max=$("#max").val();
			if(max!=null && max!=""){
				if(min>max){
					alert("最小时间不能大于最大时间");
					location.href="error/article/operate/select";
					return;
				}
			}
		});
		function fenye(currentPage){
			$("[name=pageNum]").val(currentPage);
			$("form").submit();
		}
	</script>
</body>
</html>