<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>401 오류 - 인증 필요</title>
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
        <h1>400 오류</h1>
        <p>죄송합니다, 잘못된 요청입니다..</p>
        <p>홈으로 돌아가려면 <a href="<%= request.getContextPath() %>/">여기</a>를 클릭하세요.</p>
    </div>
</div>
</body>
</html>