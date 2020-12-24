using BLL_Business_Logic_Layer__.ServiceInterface;
using DAO_Data_Access_Object_;
using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Business_Logic_Layer__
{
    public class Admin : IAdmin
    {
        ADMIN_DAO ad = new ADMIN_DAO();

        public void addConfirmCode(string manv,string confirmationCode)
        {
            ad.addConfirmCode(manv,confirmationCode);
        }
        public void DeleteUser (string maNhanVien)
        {
            ad.deleteUser(maNhanVien);
        }
        public void UpdateProfileUser (ADMIN user)
        {
            ad.UpdateProfileUser(user);
        }
        public int addnv(ADMIN adm)
        {
            return ad.add(adm);
        }
        public IList<ADMIN> GetListUser(string page,string pagesize)
        {
            return ad.getListUser(page,pagesize);
        }
        public void addPrice(Price_DTO getJsonResults)
        {
            ad.addPrice(getJsonResults);
        }
        public object GetInfoUserByID(string maNhanVien)
        {
            return ad.GetInfoUserByID(maNhanVien);
        }
        public void add_NhanVien(ADMIN nv)
        {
            ad.add_NhanVien(nv);      
        }

        public object adType()
        {
            return ad.adType();
        }

        public int changPassWord(ADMIN nv,string newPass)
        {
            return ad.changPassWord(nv,newPass);
        }

        public void ComfimforgetPass(string confirmationCode, string newPass)
        {
            ad.ComfimforgetPass(confirmationCode, newPass);
        }

        public IList<dashBroad> dashboard()
        {
            return ad.dash();
        }

        public void deltePrice(string ma)
        {
            ad.deltePrice(ma);
        }

        public void editPrice(Price_DTO getJsonResults)
        {
            ad.editPrice(getJsonResults);
        }

        public void editProfile(ADMIN nv)
        {
            ad.editProFile(nv);
        }

        public object getInfoPrice(string magia)
        {
            return ad.getInfoPrice(magia);
        }

        public IList<Order_DTO> getListOrder(string pagesize)
        {
            return ad.getListOrder(pagesize);
        }

        public object getPrice(string page, string pagesize)
        {
            return ad.getPrice(page,pagesize);
        }

        public IList<ADMIN> login(string tk, string mk)
        {
            return ad.login(tk, mk);
        }

        public int themLsp(LOAI_SAN_PHAM lsp)
        {
            return ad.themlsp(lsp);
        }

        public void themsp(SAN_PHAM sp)
        {
            ad.themSp(sp);
        }

        public object getListOrderDetails( string maHoaDon)
        {
            return ad.getListOrderDetails(maHoaDon);
        }
    }
}
