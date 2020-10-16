using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pi4_verzameling
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(DropDownListUsers.SelectedValue != "")
            {
                Session["userId"] = DropDownListUsers.SelectedValue;
                Response.Redirect("CollectionViewer.aspx");
            }
            System.Diagnostics.Debug.WriteLine(Request.Form["Button1"]);
            if (Request.Form["Button1"] != "Nieuwe gebruiker")
            {
                FormView1.Visible = false;
            } else
            {
                FormView1.Visible = true;
            }
        }
    }
}