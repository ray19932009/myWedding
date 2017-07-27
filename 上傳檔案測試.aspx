<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="上傳檔案測試.aspx.cs" Inherits="上傳檔案測試" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--婚宴場地內容-->

    <center>
        <div style="height:800px;width:1000px;border:dashed; background-color:white">
        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="fName" DataValueField="fser" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
             <asp:ListItem>請選擇</asp:ListItem>
        </asp:DropDownList>
     
              <ul style="text-align: left; padding: 0 20% 0 10%;">
                         
                            <br />
                            <li>
                                <asp:Label ID="Label5" runat="server" Text="詳細服務名稱:" Font-Size="20px"></asp:Label>
                                <asp:TextBox ID="TextBox1" runat="server"  Font-Size="20px" Height="40px" CssClass="col-xs-offset-0" Width="100%"></asp:TextBox>
                            </li>
                            <li>&nbsp;</li>
                            <li>
                                <asp:Label ID="lblMax" runat="server" Text="大約價格:" Font-Size="20px"></asp:Label>
                                <asp:TextBox ID="tbMax" runat="server" Font-Size="20px" Height="40px" Width="100%"></asp:TextBox>
                                <ul style="text-align: left; padding-left: 10%">
                                    <li>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbMax" ErrorMessage="價格請輸入純數字" Font-Size="12pt" ForeColor="Red" ValidationExpression="\d*"></asp:RegularExpressionValidator>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </li>
                                </ul>
                            </li>

                            <li>
                                <asp:Label ID="Label3" runat="server" Text="方案簡介:" Font-Size="20px"></asp:Label>
                                <asp:TextBox ID="TextBox2" runat="server" Width="100%" Font-Size="20px" Height="40px"></asp:TextBox>


                            </li>
                            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" Text="P.S. 詳細介紹要進入服務後才可視" Font-Size="X-Small"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="lblcon" runat="server" Text="詳細介紹:" Font-Size="20px"></asp:Label>
                                <textarea rows="10" id="Textarea" runat="server" style="width: 100%; font-size: 20px" class="auto-style1"></textarea>
                            </li>
                            <li>

                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="修改服務成功" Visible="False"></asp:Label>
                            </li>
                            <li>

                                <asp:Button ID="update" class="btn btn-success" runat="server"  Text="確認修改" OnClick="update_Click" />
                            </li>
                        </ul>



    </div></center>



</asp:Content>
