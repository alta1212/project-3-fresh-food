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
        public ActionResult ListUser()
        {
            return View();
        }

        public ActionResult addProduct()
        {
            return View();
        }
        public ActionResult Order()
        {
            return View();
        }
        public ActionResult OrderDetails()
        {
            return View();
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
        public ActionResult UpdateProfileUser()
        {
            return View();
        }
        public ActionResult Index()
        {

            return View();
        }
        public ActionResult editprofile()
        {

            return View();
        }
        public ActionResult ComfimforgetPass(string confirmationCode, string newPass)
        {
            ad.ComfimforgetPass(confirmationCode, newPass);
            return View("login");
        }
        public JsonResult log(string email, string matkhau)
        {
            return Json(ad.login(email, matkhau), JsonRequestBehavior.AllowGet); ;
        }
        public JsonResult dash()
        {
            return Json(ad.dashboard(), JsonRequestBehavior.AllowGet);
        }
       
        

        public JsonResult getOrder(string pagesize)
        {
            return Json(ad.getListOrder(pagesize),JsonRequestBehavior.AllowGet);
        }
       
        public JsonResult getOrderDetails(string page,string pagesize, string maHoaDon)
        {
            return Json(ad.getListOrderDetails(page, pagesize, maHoaDon), JsonRequestBehavior.AllowGet);
        }
        public JsonResult getPrice(string page, string pagesize)
        {
            return Json(ad.getPrice(page,pagesize), JsonRequestBehavior.AllowGet);
        }
        public JsonResult getInfoPrice( string magia)
        {
            return Json(ad.getInfoPrice(magia), JsonRequestBehavior.AllowGet);
        }
       
        public JsonResult getAdminType()
        {
            return Json(ad.adType(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetListUser(string page, string pagesize)
        {
            return Json(ad.GetListUser(page,pagesize), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetInfoUserByID(string maNhanVien)
        {
            return Json(ad.GetInfoUserByID(maNhanVien), JsonRequestBehavior.AllowGet);
        }
        public int changPassWord(ADMIN nv,string newPass)
        {
            return ad.changPassWord(nv,newPass);
        }
       
        public void themsp(SAN_PHAM sp)
        {
            ad.themsp(sp);
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
        public void confirmorder(string maorder, string manv)
        {
            sp.confirmOrder(maorder, manv);
        }
        public void add_Price(Price_DTO getJsonResults)
        {
            ad.addPrice(getJsonResults);
        }
        public void add_NhanVien(ADMIN nv)
        {
            ad.add_NhanVien(nv);
        }
        public void EditPrice(Price_DTO getJsonResults)
        {
            ad.editPrice(getJsonResults);
        }
        public void deltePrice(string ma)
        {
            ad.deltePrice(ma);
        }
        public void deleteUser(string maNhanVien)
        {
            ad.DeleteUser(maNhanVien);
        }
        public void UpdateProfileUserVoid(ADMIN nv)
        {
            ad.UpdateProfileUser(nv);
        }
        public int addNhanVien(ADMIN adm)
        {
            return ad.addnv(adm);
        }
    }
}