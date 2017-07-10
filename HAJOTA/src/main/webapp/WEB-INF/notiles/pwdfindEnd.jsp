<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/BootStrapStudy/css/bootstrap.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-2.0.0.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/BootStrapStudy/js/bootstrap.js"></script> 

<style type="text/css">

  #div_userid {
  		width: 70%;
  		height: 15%;
  		margin-bottom: 5%;
  		margin-left: 10%;
  		position: relative;
  }
  
  #div_email {
  		width: 70%;
  		height: 15%;
  		margin-bottom: 5%;
  		margin-left: 10%;
  		position: relative;
  }
  
  #div_findResult {
  		width: 70%;
  		height: 15%;
  		margin-bottom: 5%;
  		margin-left: 10%;
  		position: relative;
  }
  
  #div_btnFind {
  		width: 70%;
  		height: 15%;
  		margin-bottom: 5%;
  		margin-left: 10%;
  		position: relative;
  }
	

</style>   

<script type="text/javascript">
	
	$(document).ready(function(){
		
		/* var method = "${method}";
	
		var email = "${email}";
		var n = "${n}";
				
		if(method == "GET" && email != "" ) {
		//	alert("POST 이군요!!");
			
			$("#email").val("${email}");
		} */
		
		
		$("#btnFind").click(function(){
			
			var pwdFindFrm = document.pwdFindFrm;
			pwdFindFrm.action = "<%= request.getContextPath() %>/pwdfindEnd.go";
			pwdFindFrm.method = "GET";
			pwdFindFrm.submit();
		});
		
		<%-- if(method=="GET" && n==1) {
			$("#div_btnFind").hide();
		}
		else if(method=="GET" && (n==-1 || n==0) ) {
			$("#div_btnFind").show();
		}
		
		
		$("#btnConfirmCode").click(function(){
			
			if( "${certificationCode}" == $("#input_confirmCode").val() ) {
				alert("인증성공 되었습니다.");
				
				var pwdFindFrm = document.pwdFindFrm;
				pwdFindFrm.action = "<%= request.getContextPath() %>/pwdConfirm.go";
				pwdFindFrm.method = "GET";   // 단순하게 폼만 띄워주는 것이므로
				pwdFindFrm.submit();
			}
			else {
				alert("인증코드값을 다시 입력하세요.");
				$("#input_confirmCode").val("");
			}
			
			
		}); --%>
		
		
	});

</script>

<form name="pwdFindFrm">
	<!-- <div id="div_userid" align="center">
		<span style="color: blue; font-size: 12pt;">아이디</span><br/>
		<input type="text" id="userid" name="userid" size="15" placeholder="ID" required /> 
	</div> -->
	
	<div id="div_email" align="center">
		<span style="color: blue; font-size: 12pt;">이메일</span><br/>
		<input type="text" id="guest_email" name="guest_email" size="15" placeholder="abc@def.com" required /> 
	</div>
	
	<div id="div_findResult" align="center">
		<c:if test="${n == 1}">
			<div id="pwdConfirmCodeDiv">
				인증코드가 ${email}로 발송되었습니다.<br/>
				인증코드를 입력해주세요<br/>
				<input type="text" id="input_confirmCode" name="input_confirmCode" required />
				<br/><br/>
				<button type="button" class="btn btn-info" id="btnConfirmCode">인증하기</button>
			</div>
		</c:if>
		
		<c:if test="${n == 0}">
			<span style="color: red;">사용자 정보가 없습니다.</span>
		</c:if>
		
		<c:if test="${n == -1}">
			<span style="color: red;">${sendFailmsg}</span>
		</c:if>
		
	</div>
	
	<div id="div_btnFind" align="center">
		<button type="button" class="btn btn-success" id="btnFind">찾기</button>
	</div>

</form>





