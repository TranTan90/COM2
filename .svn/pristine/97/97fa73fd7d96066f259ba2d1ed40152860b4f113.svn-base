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


public partial class esdview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
 
       Visitor dll = new Visitor();
       VisitorInfo obj = dll.getVisitor(Request.QueryString["visitorCode"]);
       showname.Text = obj.VisitorName; 
    }
    protected void name1_Click(object sender, EventArgs e)
    {

        if (CheckBox1.Checked)
        {
            var GridView2 = Convert.ToInt32(Request.QueryString["page"]);
            var ddlKeyWord2 = Request.QueryString["keyWord"];
            var txtKey2 = Request.QueryString["key"];
            var visitorCodename = Request.QueryString["visitorCode"];
            var visitorDataname = Request.QueryString["visitDataCode"];

            Response.Redirect("/COMS/main/security/visitDatatimeUpdate.aspx?visitorCode=" + visitorCodename + "&mode=esdTime&keyWord=" + ddlKeyWord2 + "&key=" + txtKey2 + "&page=" + GridView2 + "");

        }

    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/COMS/main/esd/esd.aspx");
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
       
    }
}