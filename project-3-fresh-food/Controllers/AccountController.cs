﻿using BLL_Business_Logic_Layer__;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DTO_Data_Transfer_Object_;

using project_3_fresh_food.function;
using System;
using System.Web.Mvc;


namespace project_3_fresh_food.Controllers
{

    public class AccountController : Controller
    {
      
        tool to = new tool();
        IAccountBll acc = new KHACH_HANG_BLL();
        // GET: Account
        // Xử lý các sự kiện liên quan đến tài khoản
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult Sent()
        {
            return View();
        }
        public ActionResult Verification()
        {
            return View();
        }
        public ActionResult FillInfo(string tentk,string mk, KHACH_HANG KHACH_HANG)
        {
            if(tentk!=null)
            addinfo(tentk,mk, KHACH_HANG);
            return View();
        }
        public void addinfo(string tentk,string mk, KHACH_HANG KHACH_HANG)
        {
           
            acc.fillinfo(tentk,mk, KHACH_HANG);
        }
        public void DoRegister(KHACH_HANG KHACH_HANG)
        {


            string code = Guid.NewGuid().ToString();
            acc.DoRegister(KHACH_HANG, code);
            // sendmail(KHACH_HANG.email,code);
            to.RunAsync(KHACH_HANG.email, code).Wait();


        }
        public ActionResult Active(string code)
        {
            try//nếu khách hàng vào trang active mà k có code xác nhận sẽ điều hướng về trang đăng nhập
            {
                ViewBag.status = acc.active(code); 
                return View();
            }
           catch
            {
                return View("Login");


            }

          

        }
        public int ActiveAcc(string code)
        {
          
            return acc.active(code);
        }    
       
        public (int, string) DoLogin(KHACH_HANG KHACH_HANG)
        {
            return acc.DoLogin(KHACH_HANG);
        }

        public void resendmail(string tk,string mail)
        {   
            string code = Guid.NewGuid().ToString();
            acc.resend(tk,mail,code);
            to.RunAsync(mail, code).Wait();
        }    
     
    }
}