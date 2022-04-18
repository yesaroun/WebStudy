<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

   request.setCharacterEncoding("UTF-8");
   
   String uName = request.getParameter("userName");
   String uKor = request.getParameter("kor");
   String uEng = request.getParameter("eng");
   String uMat = request.getParameter("mat");
   
   try
   {
      Connection conn = DBConn.getConnection();
      
      String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %s, %s, %s)", uName, uKor, uEng, uMat);
      
      Statement stmt = conn.createStatement();
      stmt.executeUpdate(sql);
      
      stmt.close();
      
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }
   finally
   {
      DBConn.close();
   }
   
   response.sendRedirect("ScoreList.jsp");   
   
%>