<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>할 일 상세보기</title>

<!-- Bootstrap 5 & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
    /* 메인 테마와 동일한 배경 설정 */
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

    /* 읽기 전용/비활성화 폼 컨트롤 스타일 */
    .form-control:disabled, .form-control[readonly] {
        background-color: #f8fafc;
        color: #475569;
        opacity: 1;
        border-color: #e2e8f0;
    }

    /* 라벨 스타일 */
    .form-label {
        font-weight: 600;
        color: #475569;
        font-size: 0.9rem;
    }

    /* 커스텀 체크박스 영역 */
    .status-check-box {
        background-color: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 8px;
        padding: 12px 16px;
    }
</style>
</head>
<body>

<div class="container todo-wrapper">    
    <div class="d-flex justify-content-between align-items-center mb-3 px-2">
        <div class="fw-bold text-secondary">todoProject </div>
    </div>

    <!-- 상세보기 메인-->
    <div class="card main-card">
        <!-- 헤더 -->
        <div class="card-header-custom">
            <h4 class="fw-bold m-0 text-dark">
                <i class="bi bi-file-text text-primary me-2"></i>할 일 상세보기
            </h4>
            <p class="text-muted small m-0 mt-1">할 일의 세부 내용을 확인하세요</p>
        </div>

        <!-- 본문 -->
        <div class="card-body p-4">
            <form name="tForm" id="tForm" action="" method="get">
                
                <!-- 번호 (TID) -->
                <div class="mb-3">
                    <label for="tid" class="form-label">
                        <i class="bi bi-hash me-1"></i>번호
                    </label>
                    <input type="text" name="tid" id="tid" class="form-control" value="${dto.tid}" readonly="readonly">
                </div>

                <!-- 제목 (Title) -->
                <div class="mb-3">
                    <label for="title" class="form-label">
                        <i class="bi bi-card-heading me-1"></i>제목
                    </label>
                    <input type="text" name="title" id="title" class="form-control" value="${dto.title}" disabled="disabled">
                </div>

                <!-- 마감/등록일자 (DueDate) -->
                <div class="mb-3">
                    <label for="dueDate" class="form-label">
                        <i class="bi bi-calendar3 me-1"></i>등록일
                    </label>
                    <input type="date" name="dueDate" id="dueDate" class="form-control" value="${dto.dueDate}" disabled="disabled">
                </div>

                <!-- 완료 여부 (Finished) -->
                <div class="mb-4">
                    <label class="form-label">
                        <i class="bi bi-check-circle me-1"></i>완료 상태
                    </label>
                    <div class="status-check-box d-flex align-items-center">
                        <div class="form-check m-0">
                            <input class="form-check-input" type="checkbox" name="finished" id="finished" ${dto.finished ? "checked" : ""} disabled="disabled">
                            <label class="form-check-label fw-semibold ms-2" for="finished">
                                <c:choose>
                                    <c:when test="${dto.finished}">
                                        <span class="text-success">완료(done)</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-warning-emphasis">진행중</span>
                                    </c:otherwise>
                                </c:choose>
                            </label>
                        </div>
                    </div>
                </div>

                <!-- 버튼 영역 -->
                <div class="d-flex justify-content-end gap-2 pt-2 border-top">
                    <button type="button" class="btn btn-secondary rounded-pill px-4 shadow-sm" id="list">
                        <i class="bi bi-list me-1"></i>목록
                    </button>
                    <button type="button" class="btn btn-primary rounded-pill px-4 shadow-sm" id="modify">
                        <i class="bi bi-pencil-square me-1"></i>수정
                    </button>
                </div>

            </form>
        </div>
    </div>

</div>

<!-- 스크립트 -->
<script>
$("#modify").on("click", e => {
	tForm.action = "${pageContext.request.contextPath}/todo/modify";
	tForm.submit();
});
$("#list").on("click", e => {
	tForm.action = "${pageContext.request.contextPath}/todo/list";
	tForm.submit();
});
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>