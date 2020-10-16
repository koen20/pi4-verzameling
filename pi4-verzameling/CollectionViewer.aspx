<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CollectionViewer.aspx.cs" Inherits="pi4_verzameling.Collections" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Verzameling</title>
</head>
<body>
    <div class="menu">
            <a class="menu-item" href="CollectionViewer.aspx">Bekijk verzameling</a>
            <a class="menu-item" href="AddGame.aspx">Spel toevoegen</a>
            <a class="menu-item" href="Categories.aspx">Categoriën beheren</a>
            </div>
    <form id="form1" runat="server">
        
        <div>
            Filter op categorie: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceCategory" DataTextField="name" DataValueField="id" AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Value="%">Alle categoriën</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GameDatabaseConnectionString %>" SelectCommand="SELECT games.id, games.name AS Expr3, games.description, games.price, games.value, category.name AS Expr2, games.category, tags.name AS Expr1, tags.* FROM category INNER JOIN games ON category.id = games.category INNER JOIN gametags ON games.id = gametags.gameId INNER JOIN tags ON gametags.tagId = tags.id WHERE category LIKE @category" DeleteCommand="DELETE FROM games WHERE (name = @original_name)">
            <DeleteParameters>
                 <asp:Parameter Name="original_name" Type="string" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="category" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        Alle spellen:<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="Expr3" HeaderText="Naam" SortExpression="Expr3" />
                <asp:BoundField DataField="description" HeaderText="Beschrijving" SortExpression="description" />
                <asp:BoundField DataField="price" HeaderText="Prijs" SortExpression="price" />
                <asp:BoundField DataField="value" HeaderText="Waarde" SortExpression="value" />
                <asp:BoundField DataField="Expr2" HeaderText="Categoriën" SortExpression="Expr2" />
                <asp:BoundField DataField="Expr1" HeaderText="Tags" SortExpression="Expr1" />
                <asp:TemplateField HeaderText="Verschil"></asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:GameDatabaseConnectionString %>" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
        <br />
        Verschil in prijs en waarde per categorie<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceValue">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Categorie" SortExpression="name" />
                <asp:BoundField DataField="Column1" HeaderText="Verschil" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceValue" runat="server" ConnectionString="<%$ ConnectionStrings:GameDatabaseConnectionString %>" ></asp:SqlDataSource>
    </form>
</body>
</html>
