<%@ Page Language="C#" AutoEventWireup="true" CodeFile="作品集測試.aspx.cs" Inherits="作品集測試" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </div>
        <asp:DataList ID="DataList1" runat="server" CellSpacing="10" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div style="text-align:center">
                <asp:Label ID="Label1" runat="server"  Height="16px" Width="203px" Text='<%# Eval("fName") %>'></asp:Label>
                    </div>
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("fPhoto") %>' Height="152px" Width="251px" />
                <br />
            </ItemTemplate>
        </asp:DataList>
    </form>
</body>
</html>
