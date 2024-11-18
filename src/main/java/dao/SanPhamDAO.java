/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DbContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.SanPham;

/**
 *
 * @author Administrator
 */
public class SanPhamDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public ArrayList<SanPham> getTop10() {
        ArrayList<SanPham> ds = new ArrayList<>();
        String sql = "select top 10 * from SanPham order by gia desc";
        conn = DbContext.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 ds.add(new SanPham(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6)));
            }
        } catch (Exception ex) {
            System.out.println("Loi:" + ex.toString());
        }
        return ds;
    }
    public ArrayList<SanPham> getByPage(int pageIndex, int pagesize) {
        ArrayList<SanPham> ds = new ArrayList<>();
        String sql = "select * from SanPham order by masp offset ? rows fetch next ? rows only";
        conn = DbContext.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1,(pageIndex-1)*pagesize);
            ps.setInt(2,pagesize);
            rs = ps.executeQuery();
            while (rs.next()) {
                 ds.add(new SanPham(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6)));
            }
        } catch (Exception ex) {
            System.out.println("Loi:" + ex.toString());
        }
        return ds;
    }

    //Phương thức đọc hoa theo thể loại
    public ArrayList<SanPham> getByCategoryId(int maloai) {
        ArrayList<SanPham> ds = new ArrayList<>();
        String sql = "select * from SanPham where maloai=?";
        conn = DbContext.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, maloai);
            rs = ps.executeQuery();
            while (rs.next()) {
                ds.add(new SanPham(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6)));
            }
        } catch (Exception ex) {
            System.out.println("Loi:" + ex.toString());
        }
        return ds;
    }
     //phuong thuc doc tat ca san pham (SanPham) từ CSDL
    public ArrayList<SanPham> getAll() {
        ArrayList<SanPham> ds = new ArrayList<>();
        String sql = "select * from SanPham";
        conn = DbContext.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ds.add(new SanPham(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6)));
            }
        } catch (Exception ex) {
            System.out.println("Loi:" + ex.toString());
        }
        return ds;
    }

    //phuong thuc them mới sản phẩm (SanPham)
    public boolean Insert(SanPham hoa) {
        String sql = "insert into sanpham (tensp,dongia,hinh,maloai,khuyenmai) values (?,?,?,?,?)";
        conn = DbContext.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, hoa.getTensp());
            ps.setDouble(2, hoa.getDongia());
            ps.setString(3, hoa.getHinh());
            ps.setInt(4, hoa.getMaloai());
            ps.setBoolean(5, hoa.getKhuyenmai());
            int kq = ps.executeUpdate();
            if (kq > 0) {
                return true;
            }
        } catch (Exception ex) {
            System.out.println("Loi:" + ex.toString());
        }
        return false;
    }

    //phuong thuc cập nhật sản phẩm (SanPham)
    public boolean Update(SanPham sanpham) {
        String sql = "update sanpham set tensp=?,dongia=?,hinh=?,maloai=?,khuyenmai=? where masp=?";
        conn = DbContext.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, sanpham.getTensp());
            ps.setDouble(2, sanpham.getDongia());
            ps.setString(3, sanpham.getHinh());
            ps.setInt(4, sanpham.getMaloai());
            ps.setBoolean(5, sanpham.getKhuyenmai());
            ps.setInt(6, sanpham.getMasp());
            int kq = ps.executeUpdate();
            if (kq > 0) {
                return true;
            }
        } catch (Exception ex) {
            System.out.println("Loi:" + ex.toString());
        }
        return false;
    }

    //phuong thuc xoá sản phẩm (SanPham)
    public boolean Delete(int masp) {
        String sql = "delete from sanpham where masp=?";
        conn = DbContext.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, masp);
            int kq = ps.executeUpdate();
            if (kq > 0) {
                return true;
            }
        } catch (Exception ex) {
            System.out.println("Loi:" + ex.toString());
        }
        return false;
    }

    //phuong thuc lấy thông tin sản phẩm (SanPham) theo mã sp 
    public SanPham getById(int masp) {
        SanPham kq = null;
        String sql = "select * from SanPham where masp=?";
        conn = DbContext.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, masp );
            rs = ps.executeQuery();
            if (rs.next()) {
                kq = new SanPham(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6));
            }
        } catch (Exception ex) {
            System.out.println("Loi:" + ex.toString());
        }
        return kq;
    }

    public static void main(String[] args) {
        SanPhamDAO sanphamDao = new SanPhamDAO();
        ArrayList<SanPham> dsSP = sanphamDao.getTop10();
        for (SanPham sanpham : dsSP) {
            System.out.println(sanpham);
        }
        
        dsSP = sanphamDao.getByCategoryId(2);
        for (SanPham sanpham : dsSP) {
            System.out.println(sanpham);
        }
         //tìm sanpham theo masp=1
        System.out.println("Tim sanpham co masp=1");
        SanPham kq = sanphamDao.getById(1);
        if (kq != null) {
            System.out.println(kq);
        }
    }
}
