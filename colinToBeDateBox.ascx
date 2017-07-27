<%@ Control Language="C#" AutoEventWireup="true" CodeFile="colinToBeDateBox.ascx.cs" Inherits="colinToBeDateBox" %>
<span class="pull-right" style="margin-top:5px;">
    &nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" Width="70px">
            </asp:DropDownList>
            <b>年</b>
        
            <asp:DropDownList ID="DropDownList2" runat="server" Width="50px">
            </asp:DropDownList>
            <b>月</b>
    &nbsp;
    <asp:Button CssClass="btn btn-large" ID="Button1" runat="server" Text="查詢" OnClick="Button1_Click" />
</span>