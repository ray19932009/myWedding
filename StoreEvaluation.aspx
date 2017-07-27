<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StoreEvaluation.aspx.cs" Inherits="StoreEvaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="tabbable tabs-left colinfont">
        <div class="col-lg-3 col-md-3 ">
            <div class="panel panel-default">
                <div style="height: 100%">
                    <div class="media">
                        <div>
                            <%--<img class="thumbnail img-responsive" src="https://pic.marry.com.tw/2016/08/23/1430/2017/06/19/trim_149783566001148700_450x300.jpg" width="300px" height="300px">--%>
                            <center> <asp:Image ID="imgPic" runat="server"  onerror="this.src='/img/head.png'" Height="300" Width="250" /></center>
                            <br />
                            <center>店名:<asp:Label ID="lblUserName" runat="server" Text="名子" Font-Bold="true" ForeColor="black"></asp:Label></center>
                            <hr />
                            <center>服務名:<asp:Label ID="lblservicesName" runat="server" Text="服務名" Font-Bold="true" ForeColor="#ff0000"></asp:Label></center>
                        </div>
                        <hr />

                        <div class="media-body">
                         
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

           <div class="tab-content colintabcontent">
               <div style=" height:600px;width:100%;text-align:left">
                   
                   <div >
                       <asp:Label ID="Label2" runat="server" Text="評價:"></asp:Label>
                       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                           <ContentTemplate>
                              <table style="display:inline">
                           <asp:ImageButton ID="stare1" ImageUrl="~/img/starempty1.png" runat="server" OnClick="stare1_Click" Height="50px" Width="50px" />
                           <asp:ImageButton ID="stare2" ImageUrl="~/img/starempty1.png" runat="server" OnClick="stare2_Click" Height="50px" Width="50px" />
                           <asp:ImageButton ID="stare3" ImageUrl="~/img/starempty1.png" runat="server" OnClick="stare3_Click" Height="50px" Width="50px" />
                           <asp:ImageButton ID="stare4" ImageUrl="~/img/starempty1.png" runat="server" OnClick="stare4_Click" Height="50px" Width="50px" />
                           <asp:ImageButton ID="stare5" ImageUrl="~/img/starempty1.png" runat="server" OnClick="stare5_Click" Height="50px" Width="50px" />
                           <asp:Label ID="lblstare" runat="server" Text="點擊評價" Font-Size="Large"></asp:Label>
                           <asp:Label ID="Label6" runat="server" Text="分" Visible="False"></asp:Label>
                            </table>
                           </ContentTemplate>
                       </asp:UpdatePanel>
                       
                   </div>
                   <div>
                       <asp:Label ID="Label3" runat="server" Text="留言:"></asp:Label><br />
                       <asp:TextBox ID="tbContent" runat="server" Height="300px" Width="60%" TextMode="MultiLine" Font-Size="16px"></asp:TextBox>
                       <br />
                       <asp:Button  ID="Button1" class="btn btn-success" runat="server" Text="完成評價" OnClick="Button1_Click" />
                       
                   </div>
                   
               </div>
    </div></div>
</asp:Content>

