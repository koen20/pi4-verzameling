using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;

namespace pi4_verzameling
{
    public class Data

    {
        static string connectionString = "Data Source=DESKTOP-MF4GJKN;Initial Catalog=GameDatabase;Integrated Security=True";
        public static void AddCategory(String name)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand("Insert Into category(name) values (@name)", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@name", name);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
        }

        public static void AddTag(String name)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand("Insert Into tags(name) values (@name)", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@name", name);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
        }

        public static void AddGameTag(int gameId, int tagId)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand("Insert Into gametags(gameId, tagId) values (@gameId, @tagId)", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@gameId", gameId);
            cmd.Parameters.AddWithValue("@tagId", tagId);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
        }

        public static Dictionary<string, int> GetProperty(string type)
        {
            Dictionary<string, int> categories = new Dictionary<string, int>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand command = new SqlCommand("Select * from " + type, conn);
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    categories.Add(reader.GetString(1), reader.GetInt32(0));
                }
            }

            conn.Close();

            return categories;
        }

        public static int GetId(string table, string name)
        {
            int id = 0;
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand command = new SqlCommand("Select id, name from " + table, conn);
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    if (name == reader.GetString(1))
                    {
                        id = reader.GetInt32(0);
                    }
                }
            }

            conn.Close();

            return id;
        }

        public static void AddGame(string name, string description, float price, float value, int category, string releaseDate, Boolean multiplayer, int userId)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand("Insert Into games(name, description, price, value, category, releaseDate, multiplayer, userId) values (@name, @description, @price, @value, @category, @releaseDate, @multiplayer, @userId)", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@value", value);
            cmd.Parameters.AddWithValue("@category", category);
            cmd.Parameters.AddWithValue("@releaseDate", Convert.ToDateTime(releaseDate));
            cmd.Parameters.AddWithValue("@multiplayer", multiplayer);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
        }
    }
}