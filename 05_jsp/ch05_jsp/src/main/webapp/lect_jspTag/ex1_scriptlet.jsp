<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/ex.css" rel="stylesheet" type="text/css">
	<%
		String color = request.getParameter("color");
		if(color==null){
			color = "aqua";
		}
	%>
	<style>
	body{
	background-color: <%=color%>;
	}
</style>
</head>
<body>
	<h1>배경색을 바꿔 볼까유</h1>
	<form>
		<select name="color">
		<%
			String[] colors = {"red", "orange", "yellow", "green", "blue", "navy", "violet"};
			String[] labels = {"빨간색", "주황색", "노란색", "초록색", "파랑색", "남색", "보라색"};
			for(int i=0 ; i<labels.length ; i++){
				out.print("<option value='" + colors[i] + "' ");
				if(color.equals(colors[i])){
					out.print("selected='selected'");
				}
				out.print(">" + labels[i] + "</option>");
			}
		%>
			<%-- <option value="red" <%if(color.equals("red")) out.print("selected='selected'");%>>
			레드
			</option>
			<option value="orange" <%if(color.equals("orange")) out.print("selected='selected'");%>>
			오렌지
			</option>
			<option value="yellow" <%if(color.equals("yellow")) out.print("selected='selected'");%>>
			옐로우
			</option>
			<option value="green" <%if(color.equals("green")) out.print("selected='selected'");%>>
			그린
			</option>
			<option value="blue" <%if(color.equals("blue")) out.print("selected='selected'");%>>
			블루
			</option>
			<option value="navy" <%if(color.equals("navy")) out.print("selected='selected'");%>>
			네이비
			</option>
			<option value="violet" <%if(color.equals("violet")) out.print("selected='selected'");%>>
			바이올렛
			</option> --%>
		</select>
		<input type="submit" value="적용"> 
		<%
			if(!color.equals("aqua")){
				out.print("<h2>배경색 : " + color + " </h2>");
			}
		%>
	</form>
</body>
</html>