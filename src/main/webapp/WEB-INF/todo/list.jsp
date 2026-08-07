<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>할일 목록</title>

<!-- 부트 스트랩 적용 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>

	/*배경*/    
    body {
        background: #F4F3F2;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        color: #333;
    }
    
    .todo-wrapper {
        max-width: 720px;
        margin: 50px auto;
    }

    /* todo 목록 */
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

    /* 리스트 아이템 호버 & 애니메이션 */
    .todo-item {
        padding: 18px 28px;
        border-bottom: 1px solid #f5f5f5;
        transition: all 0.2s ease-in-out;
    }
    
    .todo-item:last-child {
        border-bottom: none;
    }

    .todo-item:hover {
        background-color: #f8fafc;
        transform: translateY(-1px);
    }
	
    /* 리스트 목록 */
    .index-badge {
        width: 32px;
        height: 32px;
        border-radius: 8px;
        background-color:#ffe9c4;
        color: #7c6c5d;
        font-weight: 700;
        font-size: 0.85rem;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* 링크 스타일 */
    .todo-title-link {
        color: #1e293b;
        text-decoration: none;
        font-weight: 600;
        font-size: 1.05rem;
        transition: color 0.15s ease;
    }

    .todo-title-link:hover {
        color: #2563eb;
    }

    /* 완료 / 미완료 상태  */
    .status-badge {
        font-size: 0.8rem;
        padding: 6px 14px;
        border-radius: 20px;
        font-weight: 600;
    }
</style>
</head>
<body>

<div class="container todo-wrapper">

    <!-- 상단 로그인/사용자 세션 영역 -->
    <div class="d-flex justify-content-between align-items-center mb-3 px-2">
        <div class="fw-bold text-secondary"> todoProject </div>
        <div>
            <c:choose>
                <c:when test="${empty loginInfo}">
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-sm btn-outline-primary rounded-pill px-3">
                        <i class="bi bi-box-arrow-in-right me-1"></i> 로그인
                    </a>
                </c:when>
                <c:otherwise>
                    <span class="me-3 small text-secondary">
                        <i class="bi bi-person-fill text-primary"></i> 
                        안녕하세요! <strong class="text-dark">${loginInfo.mname}</strong>님 (${loginInfo.mid})
                    </span>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm btn-outline-danger rounded-pill px-3">
                        <i class="bi bi-box-arrow-right me-1"></i> 로그아웃
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- 메인 목록 -->
    <div class="card main-card">
        <!-- 메인 헤더 -->
        <div class="card-header-custom d-flex justify-content-between align-items-center">
            <div>
                <h4 class="fw-bold m-0 text-dark">
                <span class="text-primary">${loginInfo.mid}</span>님의 할 일 목록                    
                </h4>
                <p class="text-muted small m-0 mt-1">오늘 할 일을 확인하고 등록해보세요</p>
            </div>
            
            <a href="${pageContext.request.contextPath}/todo/register" class="btn btn-primary rounded-pill px-3 shadow-sm">
                <i class="bi bi-plus-lg me-1"></i> 할일 등록
            </a>
        </div>

        <!-- 할 일 리스트 -->
        <div class="card-body p-0">
            <c:choose>
                <%-- 할 일 없을 때 --%>
                <c:when test="${empty list}">
                    <div class="text-center py-5">
                        <i class="bi bi-clipboard-x display-4 text-muted d-block mb-2"></i>
                        <p class="text-muted m-0">등록된 할 일이 없습니다.</p>
                        <p class="text-muted m-0 fw-bold"> 할 일 등록 버튼을 눌러 추가해주세요</p>
                    </div>
                </c:when>
                
                <%-- 할 일 있을 때 --%>
                <c:otherwise>
                    <div class="list-group list-group-flush">
                        <c:forEach items="${list}" var="dto" varStatus="varStatus">
                            <div class="todo-item d-flex justify-content-between align-items-center">
                                
                                <!-- 왼쪽 영역 -->
                                <div class="d-flex align-items-center gap-3">                                
                                    <div class="index-badge"> ${varStatus.count} </div> <!-- 번호 -->
                                    <div> <!-- 제목 / 등록일 -->
                                        <a href="${pageContext.request.contextPath}/todo/read?tid=${dto.tid}" class="todo-title-link">
                                            ${dto.title}
                                        </a>
                                        <div class="text-muted small mt-1">
                                            <i class="bi bi-calendar3 me-1"></i>등록일: ${dto.dueDate}
                                        </div>
                                    </div>
                                </div>

                                <!-- 오른쪽 : 완료 상태 -->
                                <div>
                                    <c:choose>
                                        <c:when test="${dto.finished}">
                                            <span class="status-badge bg-success-subtle text-success border border-success-subtle">
                                                <i class="bi bi-check-circle-fill me-1"></i>완료 <c:if test="${not empty dto.finishedStr}">(${dto.finishedStr})</c:if>
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge bg-warning-subtle text-warning-emphasis border border-warning-subtle">
                                                <i class="bi bi-clock-history me-1"></i>진행중
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>

<!-- 부트스트랩 적용 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>