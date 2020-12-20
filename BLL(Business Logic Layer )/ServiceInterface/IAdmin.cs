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
        IList<Order_DTO> getListOrder(string pagesize);
        int addnv(ADMIN adm);
        object getPrice();
        object getInfoPrice(string magia);
        void editPrice(Price_DTO getJsonResults);
        void deltePrice(string ma);
        void addPrice(Price_DTO getJsonResults);
        void add_NhanVien(ADMIN nv);
        object adType();
    }
}
