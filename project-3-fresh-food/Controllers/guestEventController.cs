using BLL_Business_Logic_Layer__;
using BLL_Business_Logic_Layer__.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace project_3_fresh_food.Controllers
{
    public class guestEventController : Controller
    {
        IProduct sp = new SAN_PHAM_BLL();
        // GET: guestEvent
        public void AddToCart(string maKhachHang, string maSanPham, int donGia, int soLuong)
        {
            sp.AddToCart(maKhachHang+"mkh", maSanPham, donGia,soLuong);
        }
        public void postComment(string masp, string mkh, string binhluan, string hinhanh, float stars)
        {
            sp.postcomment(masp,mkh+"mkh",binhluan,hinhanh,stars);
        }
    }
}