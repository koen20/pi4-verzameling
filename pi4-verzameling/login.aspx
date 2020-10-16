<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="pi4_verzameling.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Kies een bestaande gebruiker<br />
        <asp:DropDownList ID="DropDownListUsers" runat="server" Value="0" AutoPostBack="True" DataSourceID="SqlDataSourceUsers" DataTextField="naam" DataValueField="Id" AppendDataBoundItems="True">
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Nieuwe gebruiker" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GameDatabaseConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [Id] = @original_Id AND [naam] = @original_naam" InsertCommand="INSERT INTO [users] ([naam]) VALUES (@naam)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [users]" UpdateCommand="UPDATE [users] SET [naam] = @naam WHERE [Id] = @original_Id AND [naam] = @original_naam">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_naam" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="naam" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="naam" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_naam" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceUsers" DefaultMode="Insert" >
            <InsertItemTemplate>
                naam:
                <asp:TextBox ID="naamTextBox" runat="server" Text='<%# Bind("naam") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Toevoegen" />
            </InsertItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
