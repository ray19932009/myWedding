<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="storeAddServices.aspx.cs" Inherits="storeAddServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .well ul {
            width: 100%;
            list-style-type: none;
        }

        .datepicker {
            width: 100%;
        }

        .auto-style1 {
            width: 518px;
        }
    </style>
    <link href="css/newAndStores.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--內容-->

    <div style="padding: 0 10% 0 10%">
        <div class="tabbable tabs-left colinfont">
            <div class="col-lg-3 col-md-3 ">
                <div class="panel panel-default" style="border: none">
                    <div style="height: 500px">
                        <div class="media">
                            <div>
                                <%--<img class="thumbnail img-responsive" src="https://pic.marry.com.tw/2016/08/23/1430/2017/06/19/trim_149783566001148700_450x300.jpg" width="300px" height="300px">--%>
                                <center> <asp:Image ID="imgPic" runat="server"  onerror="this.src='/img/head.png'" Height="300" Width="250" /></center>
                                <br />
                                <center>廠商名:<asp:Label ID="lblUserName" runat="server" Text="名子" Font-Bold="True" ForeColor="Black"></asp:Label></center>
                                 <br />
                                <div style="float:right">
                                    <asp:HyperLink ID="HyperLink1" class="btn btn-success btn-lg2 " runat="server" NavigateUrl="~/memberCenter_Store.aspx">回會員中心</asp:HyperLink>
                                <asp:HyperLink ID="HyperLink2" class="btn btn-success btn-lg2 " runat="server" NavigateUrl="~/storeAddGallery.aspx">新增作品集</asp:HyperLink>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-content colintabcontent">
                <div class="container" style="width: 100%; padding: 0;">
                   
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                   <div class="well addSer" style="text-align: center; margin-left: 0;">
                        <h1>新增一個方案( <i class="must">*</i> 為必填)</h1>
                                <asp:Label ID="Label1" runat="server" Font-Size="20px" Text="*選擇方案:"></asp:Label>
                                <ul style="text-align: left; padding: 0 20% 0 10%;">
                            <li>
                                <asp:DropDownList ID="Dw1" runat="server" Font-Size="20px" Height="40px" OnSelectedIndexChanged="Dw1_SelectedIndexChanged" DataTextField="fName" DataValueField="fIdServicesClass" Width="100%" AutoPostBack="True"></asp:DropDownList>
                            </li>
                            <li>&nbsp;</li>
                            <li>
                                <asp:Label ID="Label2" runat="server" Text="*選擇子方案:" Font-Size="20px"></asp:Label>
                                <asp:DropDownList ID="Dw2" runat="server" AutoPostBack="True" Font-Size="20px" Height="40px" DataTextField="fName" DataValueField="fIdServicesSubClass" Width="100%"></asp:DropDownList>
                            </li>
                            <li>&nbsp;</li>
                                      <li>
                                <asp:Label ID="Label5" runat="server" Text="*詳細方案名稱:" Font-Size="20px"></asp:Label>
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="XXX手工頂級婚紗" Font-Size="20px" Height="40px" CssClass="col-xs-offset-0" Width="100%"></asp:TextBox>
                            </li>
                            <li><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="方案名不可為空" Font-Size="12pt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li>
                                <asp:Label ID="lblMax" runat="server" Text="*大約價格:" Font-Size="20px"></asp:Label>
                                <asp:TextBox ID="tbMax" runat="server" Font-Size="20px" Height="40px" Width="100%"></asp:TextBox>
                                <ul style="text-align: left;">
                                    <li>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="大約價格不可為空" Font-Size="12pt" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbMax" ErrorMessage="價格請輸入純數字" Font-Size="12pt" ForeColor="Red" ValidationExpression="\d*"></asp:RegularExpressionValidator>
                                   </li>
                                </ul>
                            </li>

                            <li>
                                <asp:Label ID="Label3" runat="server" Text="*方案簡介:" Font-Size="20px"></asp:Label>
                                <asp:TextBox ID="TextBox2" runat="server" Width="100%" Font-Size="20px" Height="40px"></asp:TextBox>


                            </li>
                            <li>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="方案簡介不可為空" Font-Size="12pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                    <asp:Label ID="Label4" runat="server" Text="P.S. 詳細介紹要進入服務後才可視" Font-Size="X-Small"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="lblcon" runat="server" Text="詳細介紹:" Font-Size="20px"></asp:Label>
                                <textarea rows="10" id="Textarea" runat="server" style="width: 100%; font-size: 20px" class="auto-style1"></textarea>
                            </li>
                            <li>

                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="新增服務成功" Visible="False"></asp:Label>
                            </li>
                            <li>

                                <asp:Button ID="Button2" class="btn btn-success" runat="server" OnClick="Button2_Click" Text="確認送出" />
                            </li>
                        </ul>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        
                          

                    </div>


                </div>
            </div>

            <script>
                $(function () {
                    $("#datepicker").datepicker();
                });
            </script>


        </div>
    </div>



</asp:Content>

