<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        margin-top: 100px;
    }
    .result-box {
        display: inline-block;
        padding: 30px;
        border: 1px solid #ddd;
        border-radius: 8px;
        background: #f9f9f9;
    }
    a {
        display: inline-block;
        margin-top: 20px;
        text-decoration: none;
        color: #007BFF;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

    <div class="result-box">
        <h2>로그인 결과 화면</h2>
        <p style="font-size: 18px; font-weight: bold; color: #333;">${message}</p>
        <a href="${pageContext.request.contextPath}/member/loginForm">로그인 화면으로 돌아가기</a>
    </div>

</body>
</html>