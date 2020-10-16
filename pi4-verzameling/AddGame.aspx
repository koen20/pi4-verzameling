<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddGame.aspx.cs" Inherits="pi4_verzameling.AddGame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="main.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>
<body>
    <div class="menu">
            <a class="menu-item" href="CollectionViewer.aspx">Bekijk verzameling</a>
            <a class="menu-item" href="AddGame.aspx">Spel toevoegen</a>
            <a class="menu-item" href="Categories.aspx">Categoriën beheren</a>
            </div>
    <form id="form1" runat="server">
        <div>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DefaultMode="Insert" OnItemInserting="FormView1_ItemInserting">
                <InsertItemTemplate>
                    Spel naam:
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    <br />
                    Beschrijving:
                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                    <br />
                    Prijs:
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    <br />
                    Waarde:
                    <asp:TextBox ID="valueTextBox" runat="server" Text='<%# Bind("value") %>' />
                    <br />
                    Categorie:
                    <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
                    <br />
                    tags:
                    <asp:TextBox ID="tagsTextBox" runat="server" Text='<%# Bind("tags") %>' ToolTip="Tags gescheiden met ," />
                    <br />
                    release datum:
                    <asp:TextBox ID="releaseDateTextBox" runat="server" Text='<%# Bind("releaseDate") %>' />
                    <br />
                    multiplayer:
                    <asp:CheckBox ID="multiplayerCheckBox" runat="server" Checked='<%# Bind("multiplayer") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Toevoegen" />
                </InsertItemTemplate>
              
            </asp:FormView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GameDatabaseConnectionString %>" DeleteCommand="DELETE FROM [games] WHERE [id] = @original_id AND [name] = @original_name AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND [price] = @original_price AND [value] = @original_value AND [category] = @original_category AND [releaseDate] = @original_releaseDate AND [multiplayer] = @original_multiplayer" InsertCommand="INSERT INTO [games] ([name], [description], [price], [value], [category], [releaseDate], [multiplayer]) VALUES (@name, @description, @price, @value, @category, @releaseDate, @multiplayer)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [games]" UpdateCommand="UPDATE [games] SET [name] = @name, [description] = @description, [price] = @price, [value] = @value, [category] = @category, [releaseDate] = @releaseDate, [multiplayer] = @multiplayer WHERE [id] = @original_id AND [name] = @original_name AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND [price] = @original_price AND [value] = @original_value AND [category] = @original_category AND [releaseDate] = @original_releaseDate AND [multiplayer] = @original_multiplayer">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_description" Type="String" />
                <asp:Parameter Name="original_price" Type="Double" />
                <asp:Parameter Name="original_value" Type="Double" />
                <asp:Parameter Name="original_category" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_releaseDate" />
                <asp:Parameter Name="original_multiplayer" Type="Boolean" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="value" Type="Double" />
                <asp:Parameter Name="category" Type="Int32" />
                <asp:Parameter DbType="Date" Name="releaseDate" />
                <asp:Parameter Name="multiplayer" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="value" Type="Double" />
                <asp:Parameter Name="category" Type="Int32" />
                <asp:Parameter DbType="Date" Name="releaseDate" />
                <asp:Parameter Name="multiplayer" Type="Boolean" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_description" Type="String" />
                <asp:Parameter Name="original_price" Type="Double" />
                <asp:Parameter Name="original_value" Type="Double" />
                <asp:Parameter Name="original_category" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_releaseDate" />
                <asp:Parameter Name="original_multiplayer" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
