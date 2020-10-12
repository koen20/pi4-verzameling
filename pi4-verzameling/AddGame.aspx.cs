using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pi4_verzameling
{
    public partial class AddGame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            TextBox name = this.FormView1.FindControl("nameTextBox") as TextBox;
            TextBox description = this.FormView1.FindControl("descriptionTextBox") as TextBox;
            TextBox price = this.FormView1.FindControl("priceTextBox") as TextBox;
            TextBox value = this.FormView1.FindControl("valueTextBox") as TextBox;
            TextBox category = this.FormView1.FindControl("categoryTextBox") as TextBox;
            TextBox tag = this.FormView1.FindControl("tagsTextBox") as TextBox;
            TextBox releaseDate = this.FormView1.FindControl("releaseDateTextBox") as TextBox;
            CheckBox multiplayer = this.FormView1.FindControl("multiplayerCheckBox") as CheckBox;

            //get all categories in database
            Dictionary<string, int> categories = Data.GetProperty("category");
            int categoryId;
            //if category doesn't exist add category to database
            if (!categories.TryGetValue(category.Text, out categoryId))
            {
                Data.AddCategory(category.Text);
                categoryId = Data.GetProperty("Category")[category.Text];
            }

            //get all tags
            Dictionary<string, int> tags = Data.GetProperty("tags");
            string[] tagsSplit = tag.Text.Split(',');
            List<int> tagsId = new List<int>();
            int tagId;
            for(int i = 0; i < tagsSplit.Length; i++)
            {
                if (!tags.TryGetValue(tagsSplit[i], out tagId))
                {
                    Data.AddTag(tagsSplit[i]);                    
                }
                tagsId.Add(Data.GetId("tags", tagsSplit[i]));
            }


            Data.AddGame(name.Text, description.Text, float.Parse(price.Text), float.Parse(value.Text), categoryId, releaseDate.Text, multiplayer.Checked);
            int gameId = Data.GetId("games", name.Text);
            for(int k = 0; k < tagsId.Count; k++)
            {
                Data.AddGameTag(gameId, tagsId[k]);
            }
        }
    }
}