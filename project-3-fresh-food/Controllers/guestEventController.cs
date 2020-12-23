using BLL_Business_Logic_Layer__;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using tool;

namespace project_3_fresh_food.Controllers
{
    public class guestEventController : Controller
    {
        IProduct sp = new SAN_PHAM_BLL();
        ICart cart = new Cart_BLL();
        IOrder or = new Order_BLL();
        Class1 to = new Class1();
        // GET: guestEvent
        public void AddToCart(string maKhachHang, string maSanPham, int donGia, int soLuong)
        {
           
            sp.AddToCart(maKhachHang, maSanPham, donGia,soLuong);
        }
        public void postComment(string masp, string mkh, string binhluan, string hinhanh, float stars)
        {
            sp.postcomment(masp,mkh,binhluan,hinhanh,stars);
        }
        public void UpdateAmountInCartDetails(Cart_DTO cart_DTO)
        {
            cart.UpdateAmountInCartDetails(cart_DTO);
        }
        public ActionResult confirmOrder(string madonhang)
        {
            ViewBag.status = sp.confirmOrder(madonhang,"");
            return View();
                
        }
        public void placeOrder(string mail, string maGioHang, string maKhachHang, string diaChi, string sdt, string tongtien, string dongia)
        {
            
            to.confirmOrder(mail, or.placeOrder(cart.GetAllProductInCart(maGioHang), diaChi, sdt, maKhachHang, tongtien, dongia));
        }
        public ActionResult Sent()
        {
            return View();
        }
    }
}