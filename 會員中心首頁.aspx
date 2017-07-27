<%@ Page Language="C#" AutoEventWireup="true" CodeFile="會員中心首頁.aspx.cs" Inherits="會員中心首頁" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="http://malsup.github.com/jquery.form.js"></script>


    <style type="text/css">
        .GridView{
           font-size:40px;
        }
    </style>


</head>
<body>

    <form id="form1" runat="server">
  <div>
      <br />
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
          <ContentTemplate>
             
          </ContentTemplate>
      </asp:UpdatePanel>
      <br />
      <br />
      <br />
      <br />
      <br />
      <asp:DataList ID="DLDisR" runat="server">
          <ItemTemplate>
              <asp:LinkButton ID="LinkButton1" Text='<%# Eval("ftitle") %>' runat="server"></asp:LinkButton>
              <br />
              <asp:Label ID="Label2" runat="server" Text='<%# Eval("ftime") %>'></asp:Label>
          </ItemTemplate>
      </asp:DataList>
      <br />
      <br />
      <br />
      <br />
        <asp:DataList ID="DLDis" runat="server" Width="533px" >
                                    <ItemTemplate>
                                      
                                        <asp:Label Text='<%# Eval("ftitle") %>' runat="server" ID="fTitleLabel" Font-Size="10px" /><br />
                                         
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                        <asp:Label Text='<%# Eval("ftime") %>' runat="server" ID="fSendTimeLabel" /><br />
                                         <hr />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>

                                    <div style="float: left; width: 100%;">
                                        <div style="width: 300px; float: left; text-align: left">
                                            <asp:Label ID="lbl服務" Font-Size="10px" Font-Bold="true" Font-Names="標楷體" runat="server" Text="服務"></asp:Label>
                                        </div>
                                        <div style="width: 200px; float: left; text-align: left">
                                            預約時間<asp:Label ID="lbl預約" runat="server" Text="預約時間"></asp:Label>
                                        </div>
                                        <div style="float: left">
                                            <asp:Label ID="lbl評價" runat="server" Text="前往評價"></asp:Label>
                                        </div>
                                    </div>
                                    <br />
                                    <div>
                                   

                                      <asp:DataList runat="server" ID="DllOverTime" >
                                            <ItemTemplate>
                                                <hr />
                                                <br />
                                                <div style="width: 300px; float: left; text-align: left">
                                                    <asp:Label ID="lblOverTime" Font-Size="10px" Font-Bold="true" Font-Names="標楷體" runat="server" Text='<%# Eval("finName") %>'></asp:Label>
                                                </div>
                                                <div style="width: 200px; float: left; text-align: left">
                                                    預約時間<asp:Label ID="lblNotyetTime" runat="server" Text='<%# Eval("finDate") %>'></asp:Label>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("fidSer") %>'></asp:Label>
                                                </div>
                                                <div style="float: left">
                                                    <a href="StoreEvaluation.aspx?Sid=<%# Eval("fidSer") %>&Mid=<%= id %>" onclick="PageLoad()">我要評價這服務</a>
                                                    <!--<asp:Button ID="btngoEva" runat="server" class="btn btn-success" Text="我要評價這服務" />-->
                                                </div>
                                                <hr />
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </div>
                                </div>

    </form>
</body>



</html>
