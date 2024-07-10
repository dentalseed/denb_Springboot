<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>404 Error - Page Not Found</title>
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
        <h1>원하시는 페이지를 찾을 수 없습니다.</h1>
        <p>찾으려는 페이지의 주소가 잘못 입력되었거나, </p>
        <p>주소의 변경 혹은 삭제로 인해 사용하실 수 없습니다.</p>
        <p>입력하신 페이지의 주소가 정확한지 다시 한번 확인해 주세요</p>
        <p>홈으로 돌아가려면 <a href="<%= request.getContextPath() %>/">여기</a>를 클릭하세요.</p>
    </div>
</div>
</body>
</html>