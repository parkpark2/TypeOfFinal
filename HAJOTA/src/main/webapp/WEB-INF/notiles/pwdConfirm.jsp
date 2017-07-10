<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/TypeofCss/JW/bootstrap.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/JW/jquery-2.0.0.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/JW/bootstrap.js"></script> 

<style type="text/css">

  #div_pwd {
  		width: 70%;
  		height: 15%;
  		margin-bottom: 5%;
  		margin-left: 10%;
  		position: relative;
  }
  
  #div_pwd2 {
  		width: 70%;
  		height: 15%;
  		margin-bottom: 5%;
  		margin-left: 10%;
  		position: relative;
  }
  
  #div_confirmResult {
  		width: 70%;
  		height: 15%;
  		margin-bottom: 5%;
  		margin-left: 10%;
  		position: relative;
  }
  
  #div_btnUpdate {
  		width: 70%;
  		height: 15%;
  		margin-bottom: 5%;
  		margin-left: 10%;
  		position: relative;
  }
	

</style>   

<script type="text/javascript">
	
	$(document).ready(function(){
		
		var mthd = "${method}";
		var email = "${email}";
		
		if(mthd == "POST") {
			$("#pwd").val("${pwd}");
			$("#pwd2").val("${pwd2}");
		}
		
		
		<%-- $("#btnUpdate").click(function(){
			
			var pwd = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			
			var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
    		// 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규식 
    		
			var bool = pattern.test(pwd);
    		
    		if(!bool) {
    			alert("암호는 8글자 이상 15글자 이하에서 영문자, 숫자, 특수기호가 혼합되어야 합니다.");
    			$("#pwd").val("");
    			$("#pwd2").val("");
    			$("#pwd").focus();
    			
    			event.preventDefault();
    			return;
    		}
    		else if(pwd != pwd2) {
    			alert("암호가 일치하지 않습니다.");
    			$("#pwd").val("");
    			$("#pwd2").val("");
    			$("#pwd").focus();
    			
    			event.preventDefault();
    			return;
    		}
    		else {
    			
    			var pwdConfirmFrm = document.pwdConfirmFrm;
    			pwdConfirmFrm.guest_email.value = 
    			pwdConfirmFrm.action = "<%= request.getContextPath() %>/pwdConfirm.go";
    			pwdConfirmFrm.method = "POST";
    			pwdConfirmFrm.submit();
    		}
			
		}); --%>
		
	});
	
	function gosubmit(email){
		
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		
		var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
		// 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규식 
		
		var bool = pattern.test(pwd);
		
		if(!bool) {
			alert("암호는 8글자 이상 15글자 이하에서 영문자, 숫자, 특수기호가 혼합되어야 합니다.");
			$("#pwd").val("");
			$("#pwd2").val("");
			$("#pwd").focus();
			
			event.preventDefault();
			return;
		}
		else if(pwd != pwd2) {
			alert("암호가 일치하지 않습니다.");
			$("#pwd").val("");
			$("#pwd2").val("");
			$("#pwd").focus();
			
			event.preventDefault();
			return;
		}
		else {
			
			var pwdConfirmFrm = document.pwdConfirmFrm;
			pwdConfirmFrm.email.value = email;
			pwdConfirmFrm.action = "<%= request.getContextPath() %>/pwdConfirm.go";
			pwdConfirmFrm.method = "POST";
			pwdConfirmFrm.submit();
		}
		
	}

</script>

<form name="pwdConfirmFrm">
	<div id="div_pwd" align="center">
		<span style="color: blue; font-size: 12pt;">새암호</span><br/>
		<input type="password" id="pwd" name="pwd" size="15" placeholder="PASSWORD" required /> 
	</div>
	
	<div id="div_pwd2" align="center">
		<span style="color: blue; font-size: 12pt;">새암호확인</span><br/>
		<input type="password" id="pwd2" name="pwd2" size="15" placeholder="PASSWORD" required /> 
	</div>
	
	<input type="hidden" name="email" />
	
	<c:if test="${method.equals('POST')}">
		<div id="div_confirmResult" align="center">
			  ${email} 님의 암호가 새로이 변경되었습니다.<br/>
		</div>
	</c:if>
	
	 <c:if test="${method.equals('GET')}">
		<div id="div_btnUpdate" align="center">
			<button type="button" class="btn btn-success" id="btnUpdate" onclick="gosubmit('${email}');">암호변경하기</button> 
		</div>
	</c:if> 
</form>





