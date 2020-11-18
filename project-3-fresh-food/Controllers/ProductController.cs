using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AdminPage;
using BLL_Business_Logic_Layer__;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DTO_Data_Transfer_Object_;

namespace project_3_fresh_food.Controllers
{
    public class ProductController : Controller
    {
        AdminPage.Controllers.SanPhamAdminController admin = new AdminPage.Controllers.SanPhamAdminController();
        // GET: Product
        //xử lý liên quan đến sản phẩm
        IList<SAN_PHAM> lis;

        IProduct sp = new SAN_PHAM_BLL();
        public ActionResult Shop()//shop toàn bộ sản phẩm
        {
            return View();
        }
        public ActionResult Product_Details()//chi tiết 1 sản phẩm
        {
            return View();
        }
        public  ActionResult Cart()//giỏ hàng
        {
            return View();
        }
        public ActionResult CheckOut()//thanh toán
        {
            return View();
        }
        public JsonResult getpagesp(int pagesize)
        {
            return admin.GetAllProduct(1,pagesize);
        }
        public JsonResult getbyloai(string maloai,string page)
        { lis = sp.getbyloaisp(maloai,page);

            return Json(lis,JsonRequestBehavior.AllowGet);
        }    
        public int getslsp(string maloai)
        {
            return sp.getslsp(maloai);
        }
        public JsonResult getsanpham(string masanpham)
        {
            var sanpham = sp.getthongtinsanpham(masanpham);
            return Json(sanpham, JsonRequestBehavior.AllowGet);
        }
      
    }
}