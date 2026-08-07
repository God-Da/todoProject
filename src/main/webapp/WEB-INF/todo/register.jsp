<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>할 일 등록</title>

<!-- Bootstrap 5 & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>
    /* 메인 테마 배경 설정 */
    body {
        background: #F4F3F2;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        color: #333;
    }
    
    .todo-wrapper {
        max-width: 720px;
        margin: 50px auto;
    }

    /* 메인 카드 스타일 */
    .main-card {
        border: none;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        background: #ffffff;
        overflow: hidden;
    }

    /* 카드 헤더 */
    .card-header-custom {
        background: #ffffff;
        border-bottom: 1px solid #f0f0f0;
        padding: 24px 28px;
    }

    /* 라벨 스타일 */
    .form-label {
        font-weight: 600;
        color: #475569;
        font-size: 0.9rem;
    }
</style>
</head>
<body>

<div class="container todo-wrapper">    
    <div class="d-flex justify-content-between align-items-center mb-3 px-2">
        <div class="fw-bold text-secondary"> todoProject </div>
    </div>

    <!-- 등록 메인 카드 -->
    <div class="card main-card">
        <!-- 헤더 -->
        <div class="card-header-custom">
            <h4 class="fw-bold m-0 text-dark">
                <i class="bi bi-plus-circle text-primary me-2"></i>할 일 등록
            </h4>
            <p class="text-muted small m-0 mt-1">새로운 할 일을 추가하고 관리해보세요</p>
        </div>

        <!-- 본문 -->
        <div class="card-body p-4">
            <form action="${pageContext.request.contextPath}/todo/register" method="post">
                
                <!-- 제목 (Title) -->
                <div class="mb-3">
                    <label for="title" class="form-label">
                        <i class="bi bi-card-heading me-1"></i>제목
                    </label>
                    <input type="text" name="title" id="title" class="form-control" placeholder="할 일 제목을 입력하세요" required>
                </div>

                <!-- 마감/등록일자 (DueDate) -->
                <div class="mb-4">
                    <label for="dueDate" class="form-label">
                        <i class="bi bi-calendar3 me-1"></i> 등록일
                    </label>
                    <input type="date" name="dueDate" id="dueDate" class="form-control" required>
                </div>

                <!-- 버튼 영역 -->
                <div class="d-flex justify-content-end gap-2 pt-3 border-top">
                    <a href="${pageContext.request.contextPath}/todo/list" class="btn btn-secondary rounded-pill px-4 shadow-sm">
                        <i class="bi bi-x-lg me-1"></i>취소
                    </a>
                    <button type="submit" class="btn btn-primary rounded-pill px-4 shadow-sm">
                        <i class="bi bi-check-lg me-1"></i>등록하기
                    </button>
                </div>

            </form>
        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>