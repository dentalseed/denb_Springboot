<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>403 오류 - 접근 금지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .error-container {
            text-align: center;
        }

        h1 {
            font-size: 48px;
            color: #d9534f;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        a {
            color: #337ab7;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="error-container">
        <h1>403 오류</h1>
        <p>죄송합니다, 접근이 금지되었습니다.</p>
        <p>해당 페이지에 접근 권한이 없거나, 요청이 거부되었습니다.</p>
        <p>홈으로 돌아가려면 <a href="<%= request.getContextPath() %>/">여기</a>를 클릭하세요.</p>
    </div>
</div>
</body>
</html>