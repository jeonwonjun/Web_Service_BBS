<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){ //세션에 userID가 있을 경우 userID변수에 값을 넣어준다(로그인 되어있는지 판단)
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null){ //userID가 null이 아닐 경우 이미 로그인되어 있다고 판단
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		int bbsID = 0;
		if(request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		} else{
			if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null || request.getParameter("bbsTitle").equals("")
					|| request.getParameter("bbsContent").equals("")){ //빈 부분 없이 입력
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else{
					BbsDAO bbsDAO = new BbsDAO();
					int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
					if (result == -1){ //데이터베이스 오류(게시판 수정)
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 수정에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else { //게시판 스장 성공
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = 'bbs.jsp'");
						script.println("</script>");
					}
					
				}
		}
		
	%>

</body>
</html>