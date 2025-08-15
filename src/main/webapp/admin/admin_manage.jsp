<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML">
<html>
  <head>
    <title></title>
	  <base href="${pageContext.request.contextPath }/">    
 	 <meta charset="UTF-8">
	<script type="text/javascript" src="js/jquery-1.8.0.js"></script> 
	<script type="text/javascript">
		$(function(){
			$("#ch_checkall,#top_ch_checkall").click(function(){
				if(this.checked){
					$("input[name=ck_id]").attr("checked","checked");
				}else{
					$("input[name=ck_id]").removeAttr("checked");
				}		
			});
					
			$("table tr").mouseover(function(){
				$(this).css("background","#D3EAEF");
				$(this).siblings().css("background","white");
			});
		});
	</script>

	<link rel="stylesheet" type="text/css" href="css/maintable.css" ></link>

  </head>
  
  <body>
				
				<div class ="div_title">
						<div class="div_titlename"> <img src="images/san_jiao.gif" ><span>管理人员基本信息列表</span></div>
						<div class="div_titleoper">
							<input type="checkbox" id="top_ch_checkall"/> 全选 <a href="admin_add.jsp"> <img src="images/add.gif"/>添加 </a> <a href="javascript:void(0)"><img src="images/del.gif"/>删除</a> </div>
				 </div>
				 
				 <form action="xxx"  name="form1">
				
				 <table class="main_table" >
				       <tr>
				 				<th><input type="checkbox" id="ch_checkall" /></th>	<th>账号</th> 	<th>状态</th>	<th>备注</th>  <th>最后更新日期</th> 	<th>操作</th>
				 		</tr>
				 		<c:forEach var="m" items="${AdminList }">
				 			<tr>
				 				<td>
				 					<input type="checkbox" name="ck_id" value="69" /> 
				 				</td>
				 				<td>${m.adminName }</td>	
				 				<td>${m.state }</td>	
				 				<td> <a title="商品管理员">${m.note }</a> </td>	
				 				
				 				<td>${m.editDate }</td>	
				 				<td>
					 					<a href="javascript:void(0)">锁定</a> |  
					 					<a href="javascript:void(0)">修改</a> |  	
					 			    	<a href="javascript:void(0)">删除</a> 

				 				</td>
				 			</tr>
				 		</c:forEach>
				 		
				   		 
				 		
				   		 
				 	
				</table>
				</form>
				
				<div class="div_page" >
					  <div class="div_page_left">    共有 <label>4</label> 条记录，当前第 <label>1</label> 页，共 <label>1</label> 页	</div>		
					  <div class="div_page_right" > 	 
					  			 首页
				  	 			 上一页
					  			 下一页 
				  	 		   尾页

					  	  <button onclick="javascript:void(0)">转到</button>
					  	 <input type="text" name="pageIndex" id="pageIndex" value="1" /> 页
					  	
					   </div>
						
				</div>

  </body>
</html>
