using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pi4_verzameling
{
    public partial class Collections : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            MergeRows(GridView1);
        }

        public static void MergeRows(GridView gridView)
        {
            System.Diagnostics.Debug.WriteLine(gridView.Rows.Count);

            for (int i = 0; i <= gridView.Rows.Count - 2; i++)
            {
                GridViewRow row = gridView.Rows[i];
                GridViewRow rowN = gridView.Rows[i + 1];
                if (row.Cells[0].Text == rowN.Cells[0].Text)
                {
                    rowN.Cells[5].Text += ", " + row.Cells[5].Text;
                    row.Visible = false;
                }
            }
        }
    }
}