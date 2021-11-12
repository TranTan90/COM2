using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using HanaMicron.COMS.Model;
using HanaMicron.COMS.BLL;
using HanaMicron.COMS.Utility;


public partial class esd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["page"])) GridView1.PageIndex = Convert.ToInt32(Request.QueryString["page"]);
            if (!String.IsNullOrEmpty(Request.QueryString["keyWord"])) ddlKeyWord1.SelectedValue = Request.QueryString["keyWord"];
            if (!String.IsNullOrEmpty(Request.QueryString["key"])) txtKey1.Text = Request.QueryString["key"];

            GridView1.Visible = false;
        }
        else
        {
            GridView1.Visible = true;
        }
    }

    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            VisitDataInfo obj = (VisitDataInfo)e.Row.DataItem;

            e.Row.Cells[0].Text = obj.VisitorDataInfoList[0].VisitDate;
            e.Row.Cells[1].Text = obj.VisitorDataInfoList[0].VisitorInfo.VisitorName;
            if (String.IsNullOrEmpty(obj.VisitorDataInfoList[0].VisitorInfo.VisitorPassportNumber))
            {

                e.Row.Cells[2].Text = obj.VisitorDataInfoList[0].VisitorInfo.VisitorPassportNumber;
            }
            else
            {
                e.Row.Cells[2].Text = obj.VisitorDataInfoList[0].VisitorInfo.VisitorRegNumber1;
            }
            e.Row.Cells[3].Text = obj.VisitorDataInfoList[0].CompanyInfo.CompanyName;
            e.Row.Cells[4].Text = obj.CarDataInfo.Header + " " + obj.CarDataInfo.Number;
            e.Row.Cells[5].Text = obj.VisitObjectInfo.VisitObjectName;
            e.Row.Cells[6].Text = obj.VisitorDataInfoList[0].VisitorInfo.VisitorPhone1 + "" + obj.VisitorDataInfoList[0].VisitorInfo.VisitorPhone2 + "" + obj.VisitorDataInfoList[0].VisitorInfo.VisitorPhone3;
            var phone = e.Row.Cells[6].ToString();

            VisitData bll = new VisitData();

            if (obj.VisitorDataInfoList[0].VisitorInfo.EsdFlag == "N")
            {
                e.Row.Cells[7].Text = "<span style=\"color:red\">No</span>";
            }
            else
            {
                e.Row.Visible = false;
            }
            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                if (i < 6)
                {
                    
                    e.Row.Cells[i].Attributes.Add("onclick", "window.location='/COMS/main/esd/esdview.aspx?visitDataCode=" + obj.VisitDataCode + "&visitorCode=" + obj.VisitorDataInfoList[0].VisitorInfo.VisitorCode + "&mode=esdTime&keyWord=" + ddlKeyWord1.SelectedValue + "&key=" + HttpUtility.UrlEncode(txtKey1.Text) + "&page=" + GridView1.PageIndex + "';");
                    e.Row.Cells[i].Attributes.Add("style", "cursor:hand;");
                }
            }


        }


    }
}
