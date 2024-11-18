<%-- 
    Document   : Left
    Created on : Sep 28, 2023, 12:08:09 PM
    Author     : KHOACNTT
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.TheLoai"%>
<%@page import="dao.TheLoaiDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    TheLoaiDAO loaiDAO = new TheLoaiDAO();
    ArrayList<TheLoai> dsLoai = loaiDAO.getAll();
%>
<div class="card mb-3">
    <h3 class="card-header">Danh Mục Sản Phẩm</h3>  
        <ul class="list-group list-group-flush">
                <%
                for(TheLoai loai : dsLoai)
                {
                %>
                <li class="list-group-item"><a class="text-decoration-none" href="product.jsp?maloai=<%=loai.getMaloai() %>"><%=loai.getTenloai() %> </a></li>
                
                <%
                    }
                %>
        </ul>   
</div>
