using BLL_Business_Logic_Layer__;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DTO_Data_Transfer_Object_;
using System;
using System.Web.Mvc;
using tool;
namespace AdminPage.Controllers
{
    public class AdminController : Controller
    {
        IAdmin ad = new Admin();
        IProduct sp = new SAN_PHAM_BLL();
        Class1 to = new Class1();
        // GET: accountsAdmin
        public ActionResult login()
        {

            return View();
        }
        public ActionResult profile()
        {
            return View();
        }

        public ActionResult addNv()
        {
            return View();
        }

        public int addNhanVien(ADMIN adm)
        {
            return ad.addnv(adm);
        }
        public JsonResult log(string email, string matkhau)
        {
            return Json(ad.login(email, matkhau), JsonRequestBehavior.AllowGet); ;
        }
        public JsonResult dash()
        {
            return Json(ad.dashboard(), JsonRequestBehavior.AllowGet);
        }
        public ActionResult Index()
        {

            return View();
        }
        public ActionResult editprofile()
        {

            return View();
        }
        public void Edit_Profile(ADMIN nv)
        {
            ad.editProfile(nv);
        }
        public int themlsp(LOAI_SAN_PHAM lsp)
        {
            if (ad.themLsp(lsp) == 0)
                return 0;
            else
                return 1;

        }
        public void confirmorder(string maorder,string manv)
        {
            sp.confirmOrder(maorder,manv);
        }

        public JsonResult getOrder(string pagesize)
        {
            return Json(ad.getListOrder(pagesize),JsonRequestBehavior.AllowGet);
        }
        public ActionResult addProduct()
        {
            return View();
        }
        public ActionResult Order()
        {
            return View();
        }
        public void themsp(SAN_PHAM sp)
        {
            ad.themsp(sp);
        }
        public ActionResult Price()
        {
            return View();
        }
        public ActionResult PriceEdit()
        {
            return View();
        }
        public ActionResult AddPrice()
        {
            return View();
        }
        public void EditPrice(Price_DTO getJsonResults)
        {
            ad.editPrice(getJsonResults);
        }
        public void deltePrice(string ma)
        {
            ad.deltePrice(ma);
        }
        public JsonResult getPrice()
        {
            return Json(ad.getPrice(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult getInfoPrice( string magia)
        {
            return Json(ad.getInfoPrice(magia), JsonRequestBehavior.AllowGet);
        }
       public void add_Price(Price_DTO getJsonResults)
       {
            ad.addPrice(getJsonResults);
       }
       public void add_NhanVien(ADMIN nv)
       {
           ad.add_NhanVien(nv);
       }
        public JsonResult getAdminType()
        {
            return Json(ad.adType(), JsonRequestBehavior.AllowGet);
        }
        public int changPassWord(ADMIN nv,string newPass)
        {
            return ad.changPassWord(nv,newPass);
        }
        public ActionResult ComfimforgetPass(string confirmationCode,string newPass)
        {
            ad.ComfimforgetPass(confirmationCode, newPass);
            return View("login");
        }
        public void forgetPass(string mail,string manv)
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var stringChars = new char[10];
            var confirmationCode = new char[10];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
                confirmationCode[i] = chars[random.Next(chars.Length)];
            }

            var newpass = new String(stringChars);
            var confirmCode = new String(stringChars);
            ad.addConfirmCode(manv,confirmCode);
            to.forgotPassAdmin(mail,newpass,confirmCode);
        }
    }
}