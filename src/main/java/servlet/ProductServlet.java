/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.SanPhamDAO;
import java.util.List;
import model.SanPham;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet("/san-pham")
public class ProductServlet extends HttpServlet {
    private SanPhamDAO sanphamdao = new SanPhamDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SanPham> sanpham = sanphamdao.getAllSanPham();
        request.setAttribute("sanphams", sanpham);
        request.getRequestDispatcher("view/product.jsp").forward(request, response);
    }
}

