<%@ Page Language="C#" AutoEventWireup="true" CodeFile="收藏服務.aspx.cs" Inherits="收藏服務" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    









        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSession" runat="server" Text="2"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
  

        <asp:DataList ID="DLLikeServices" runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
            <ItemTemplate>
                <asp:Label ID="lblservices" runat="server" Text='<%# Eval("fName") %>' Font-Bold="True"  ></asp:Label>
                <br />
                <asp:ImageButton ID="imgBtnservices" runat="server" Height="213px" ImageUrl='<%# Eval("fPhoto") %>' Width="185px" />
                <br />
            </ItemTemplate>
               
        </asp:DataList>

    <!--  <asp:SqlDataSource ID="SQLDSservices" runat="server" ConnectionString="<%$ ConnectionStrings:myWeddingConnectionString %>" SelectCommand="SELECT tServices.fName, tGalleryPhoto.fPhoto FROM tMember INNER JOIN tLIkeServices ON tMember.fIdMember = tLIkeServices.fidStores INNER JOIN tServices ON tLIkeServices.fidServices = tServices.fIdServices INNER JOIN tServicesPic ON tServices.fIdServices = tServicesPic.fIdServices INNER JOIN tGalleryPhoto ON tServicesPic.fIdPhoto = tGalleryPhoto.fIdPhoto WHERE (tLIkeServices.fidMember = @fIdMember)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblSession" DefaultValue="" Name="fIdMember" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>-->

    
   

    
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    








    </div>
    </form>
</body>
</html>
