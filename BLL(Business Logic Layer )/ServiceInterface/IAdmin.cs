using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Business_Logic_Layer__.ServiceInterface
{
    public interface IAdmin
    {
        IList<ADMIN> login(string tk, string mk);
        IList<dashBroad> dashboard();
        int themLsp(LOAI_SAN_PHAM lsp);
        void themsp(SAN_PHAM sp);
        IList<ADMIN> GetListUser(string page,string pagesize);
        IList<Order_DTO> getListOrder(string pagesize);
        int addnv(ADMIN adm);
        object getPrice(string page, string pagesize);
        object getInfoPrice(string magia);
        void editPrice(Price_DTO getJsonResults);
        void deltePrice(string ma);
        void addPrice(Price_DTO getJsonResults);
        void add_NhanVien(ADMIN nv);
        void DeleteUser(string maNhanVien);
        void UpdateProfileUser(ADMIN user);
        object GetInfoUserByID(string maNhanVien);
        object adType();
        void editProfile(ADMIN nv);
        int changPassWord(ADMIN nv,string newPass);
        void addConfirmCode(string manv, string confirmationCode);
        void ComfimforgetPass(string confirmationCode, string newPass);
        object getListOrderDetails(string maHoaDon);
        object getDiscount(string size);
        void add_Discount(promotion_dto getJsonResults);
    }
}
