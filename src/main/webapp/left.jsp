<%@ page language="java" import="com.dao.*,com.beans.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
			<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
			<script type="text/javascript" src="js/jquery.easing.js"></script>
			<script type="text/javascript" src="js/jquery.accordion.js"></script>
			
<script type="text/javascript">
	$(function(){
		$('#navigation').accordion({
			active:1,   /* 第三个被激活 */
			header: '.head',
			/*navigation1: false,  */
			event: 'click',
			fillSpace: true,
			animated: 'bounceslide'   /*slide,bounceslide ,bounceslide,easeslide'*/
		});
		
		
		
	});
</script>
			<link rel="stylesheet" type="text/css" href="css/menu.css">

		</head>
		<body>
			<%
				MenuDao md = new MenuDao();
				List<MenuInfo> list =md.getMenuList(0);
				request.setAttribute("list",list);
			%>
			 <ul id="navigation">
			 	<c:forEach var="m" items="${list }">
			 		<li>
				
					<a class="head">${m.menuName }</a>
						<ul>
						<c:forEach var ="m_sub" items="${m.subMenuList}">
							<li>
								<a href="${m_sub.url }" target="${m_sub.target }"><img src="images/${m_sub.icon }" /><label>${m_sub.menuName }</label></a>
								
							</li>
						</c:forEach>
							
						</ul>
					</li>
			 	</c:forEach>
			 
			 
				
		
				
  </ul>

		</body>
</html>
