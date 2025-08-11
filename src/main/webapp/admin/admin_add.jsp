<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE>
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
	$(function(){

	  $("#adminName").keyup(function(){
	    var str = $(this).val();
	    var reg = /^[a-zA-Z0-9]{4,15}$/;
	    if (!reg.test(str)) {
	      $("#adminName_msg").text("用户名格式错误").css("color", "red");
	      return false;
	    } else {
	      $("#adminName_msg").text("正确").css("color", "green");
	      return true;
	    }
	  });
	

	  $("#password").keyup(function(){
	    var str = $(this).val();
	    var ss = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
	    if (str !== ss) {
	      $("#password_msg").text("请输入正确的字符").css("color", "red");
	      return false;
	    } else if (ss.length < 6 || ss.length > 20) {
	      $("#password_msg").text("密码长度不能少于6位或大于20位").css("color", "red");
	      return false;
	    } else {
	      $("#password_msg").text("正确").css("color", "green");
	      return true;
	    }
	  });
	

	  $("#pwdconfirm").keyup(function(){
	    var pwd = $("#password").val();
	    var confirm = $(this).val();
	    if (pwd !== confirm) {
	      $("#pwdconfirm_msg").text("密码不一致").css("color", "red");
	      return false;
	    } else {
	      $("#pwdconfirm_msg").text("一致").css("color", "green");
	      return true;
	    }
	  });
	
	  $("form").submit(function(){
	    var nameValid = /^[a-zA-Z0-9]{4,15}$/.test($("#adminName").val());
	    var pwd = $("#password").val();
	    var pwdValid = /^[a-zA-Z0-9]{6,20}$/.test(pwd);
	    var confirmValid = pwd === $("#pwdconfirm").val();
	
	    if (!nameValid || !pwdValid || !confirmValid) {
	      $("#result_msg").text("请检查输入项是否正确！").css("color", "red");
	      return false; 
	    }
	    return true; 
	  });
	});
	</script>

	
  </head>
  
  <body>
     <div class ="div_title">
		 <div class="div_titlename"> <img src="images/san_jiao.gif" ><span>管理员添加</span></div>
	 </div>
				 
	 <form action="AdminServlet?flag=add" method="post" >
		 <table class="edit_table" >
		 		<tr>
		 			 	<td class="td_info">用户账号:</td>	
		 			 	<td class="td_input_short"> 
		 			 		<input type="text" class="txtbox" id="adminName" name="adminName" /> 
		 			 	</td>   
		 			 	<td>
		 			 		<label class="validate_info" id="adminName_msg">4-15位；只限数字(0-9)和英文(a-z),不区分大小写</label>
		 			 	</td> 
		 		</tr>
		 			<tr>
		 				<td class="td_info">用户密码:</td>	
		 				<td>
		 					<input type="text"  class="txtbox"  name="password"  id="password" />
		 				</td> 
		 				<td><label  class="validate_info" id="password_msg" >数字或英文,6-20位</label></td>	
		 		</tr>
		 			<tr>
		 				<td class="td_info">重复密码:</td>	
		 				<td><input type="text" class="txtbox" id="pwdconfirm"  /> 
		 				</td>
		 				<td><label  class="validate_info"  id="pwdconfirm_msg">请重复输入密码</label></td>	
		 		</tr>
		 		<tr>
		 			<td class="td_info">备注信息:</td>	
		 			<td><textarea rows="4" cols="27" name="note" class="txtarea"></textarea> </td>	
		 			<td><label></label></td>	
		 		</tr>
		 		<tr>
		 			<td class="td_info"> </td>	
		 			<td> 
		 			<input class="form_btn" type="submit" value="提交" /> 
		 			<input type="reset"  class="form_btn" value="重置" /> </td>	
		 			<td>
		 				<label id="result_msg" class="result_msg"></label>
		 			</td>	
		 		</tr>
		</table>
     </form>
  </body>
</html>
