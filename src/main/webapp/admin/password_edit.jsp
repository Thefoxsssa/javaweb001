<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  <base href="${pageContext.request.contextPath }/">    
  <meta charset="UTF-8">
    <title></title>   
		<link rel="stylesheet" type="text/css" href="css/edittable.css"  ></link>  
		<link rel="stylesheet" type="text/css" href="css/validate.css"  ></link>  
		<script type="text/javascript"  src="js/jquery-1.8.0.js"></script>

	 <script>		
			$(function(){
				 $("input[type=text],textarea").focus(function(){
					  $(this).addClass("input_focus");
					}).blur(function(){
							$(this).removeClass("input_focus");
					});

				$(".form_btn").hover(function(){
						$(this).css("color","red").css("background","#6FB2DB");
					},
					
					function(){
						$(this).css("color","#295568").css("background","#BAD9E3");
					});	
			});		
	</script>
	<script>
		var oldpass=${sessionScope.session_admin.password};
		function vailoldpass(){
			var pass=$("#oldPassword").val();
			if(oldpass!=pass){
				$("#password_msg").text("密码错误").css("color","red");
				return false;
			}else if(oldpass==pass){
				$("#password_msg").text("密码正确").css("color","green");
				return true;
			}
		}
		function vailnewpass() {
	        var str = $("#newPassword").val();
	        var ss = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
	        if (str !== ss) {
	            $("#password_msg1").text("请输入正确的字符").css("color", "red");
	            return false;
	        } else if (ss.length < 6 || ss.length > 20) {
	            $("#password_msg1").text("密码长度不能少于6位或大于20位").css("color", "red");
	            return false;
	        } else {
	            $("#password_msg1").text("正确").css("color", "green");
	            return true;
	        }
	    }
		function vailAgainNewPass() {
	        var str = $("#newPassword").val();
	        var pass =$("#newAgainPassword").val();
	        if(str!=pass){
	        	 $("#password_msg2").text("与新密码不匹配").css("color", "red");
		            return false;
	        }else{
	        	$("#password_msg2").text("密码正确").css("color", "green");
	            return true;
	        }
	    }
		function Fsubmit() {
			var oldPass=vailoldpass();
			var newPass=vailnewpass();
			var newAgainPass = vailAgainNewPass();
			if(oldPass&&newPass&&newAgainPass){
				alert("修改成功请重新登录");
				window.top.location.href="login.html";
				return true;
			}else{
				alert("验证失败请重试");
				return false;
				
			}
		}
	</script>
	
	
	
  </head>
  
  <body>
     <div class ="div_title">
		 <div class="div_titlename"> <img src="images/san_jiao.gif" ><span>管理员添加</span></div>
	 </div>
				 
	 <form action="AdminServlet?flag=newPass" method="post" onsubmit="return Fsubmit()">
		 <table class="edit_table" >
		 		<input type="hidden" name="adminName" id="adminName" value="${sessionScope.session_admin.adminName}">
		 		<tr>
		 			 	<td class="td_info">用户账号:</td>	
		 			 	<td class="td_input_short"> 
		 			 		<input type="text" class="txtbox" value="${sessionScope.session_admin.adminName}"  disabled="disabled"/> 
		 			 	</td>   
		 			 	
		 		</tr>
		 			<tr>
		 				<td class="td_info">请输入原密码:</td>	
		 				<td>
		 					<input type="text" onkeyup="vailoldpass()" class="txtbox"  name="oldPassword"  id="oldPassword" />
		 				</td> 
		 				<td><label  class="validate_info" id="password_msg" >数字或英文,6-20位</label></td>	
		 		</tr>
		 			<tr>
		 				<td class="td_info">新密码:</td>	
		 				<td>
		 					<input type="text" onkeyup="vailnewpass()" class="txtbox"  name="newPassword"  id="newPassword" />
		 				</td> 
		 				<td><label  class="validate_info" id="password_msg1" >数字或英文,6-20位</label></td>	
		 		</tr>
		 			<tr>
		 				<td class="td_info">重复新密码:</td>	
		 				<td>
		 					<input type="text"  class="txtbox" onkeyup="vailAgainNewPass()" name="newAgainPassword"  id="newAgainPassword" />
		 				</td> 
		 				<td><label  class="validate_info" id="password_msg2" >数字或英文,6-20位</label></td>	
		 		</tr>
		 		
		 		<tr>
		 			<td class="td_info"> </td>	
		 			<td> 
		 			<input class="form_btn" type="submit" value="提交" /> 
		 			<td>
		 				<label id="result_msg" class="result_msg"></label>
		 			</td>	
		 		</tr>
		</table>
     </form>
     
     
     
     
     
  </body>
</html>
