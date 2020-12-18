using DTO_Data_Transfer_Object_;
using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace DAO_Data_Access_Object_
{
    public class DataAccessHelper
    {//chuỗi kết nối

     //   public static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;

        public static readonly string ConnectionString = @"Server=tcp:tk16-1.database.windows.net,1433;Initial Catalog=SHOPFRESHFOOD;Persist Security Info=False;User ID=admintk16;Password=Anhlatuananh1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
        public static int ExecuteNonQuery(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }
        }

        public static object parnWithValue(string paramterOutPut, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {   cmd.Parameters.Add(paramterOutPut, SqlDbType.VarChar, 100);
                cmd.Parameters[paramterOutPut].Direction = ParameterDirection.Output;
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
             
                cmd.ExecuteNonQuery();
                string retunvalue = (string)cmd.Parameters[paramterOutPut].Value;
                return retunvalue;
            }
            
        }

        public static SqlDataReader getallLsp(string connectionString, string cmdtext ) 
        {
          
            SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
            SqlCommand cmd = new SqlCommand(cmdtext,conn);
            SqlDataReader read = cmd.ExecuteReader();
            return read;

        }
       public static void exec(string cmdtext)
       {
            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(cmdtext, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static DataTable log(string cmdtxt)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            SqlDataAdapter cmd = new SqlDataAdapter(cmdtxt, conn);


            DataTable dt = new DataTable();
           
            cmd.Fill(dt);
            return dt;
        }

      



        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
        {

            if (conn.State != ConnectionState.Open)
                conn.Open();

            cmd.Connection = conn;
            cmd.CommandText = cmdText;

            if (trans != null)
                cmd.Transaction = trans;

            cmd.CommandType = cmdType;

            if (cmdParms != null)
            {
                foreach (SqlParameter parm in cmdParms)
                    cmd.Parameters.Add(parm);
            }
        }
    }
}
