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
            SqlDataSource1.SelectCommand = "SELECT games.name AS Expr3, games.description, games.price, games.value, category.name AS Expr2, games.category, tags.name AS Expr1, tags.* FROM category INNER JOIN games ON category.id = games.category INNER JOIN gametags ON games.id = gametags.gameId INNER JOIN tags ON gametags.tagId = tags.id WHERE category LIKE @category AND userId = " + Session["userId"];
            SqlDataSourceValue.SelectCommand = "SELECT category.name, sum(games.value) - sum(games.price)  FROM category INNER JOIN games ON category.id = games.category WHERE games.userId = " + Session["userId"] + " GROUP BY category.name";
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
                    rowN.Cells[6].Text += ", " + row.Cells[6].Text;
                    row.Visible = false;
                }
            }

            for (int k = 0; k <= gridView.Rows.Count - 1; k++)
            {
                GridViewRow row = gridView.Rows[k];

                row.Cells[7].Text = (float.Parse(row.Cells[4].Text) - float.Parse(row.Cells[3].Text)).ToString();
            }
        }
    }
}