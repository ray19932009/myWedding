<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="storePhotoCover.aspx.cs" Inherits="storePhotoCover" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div style="padding: 0 10% 0 10%">
        <div class="tabbable tabs-left colinfont">
            <div class="col-lg-3 col-md-3 ">
                <div class="panel panel-default" style="border: none">
                    <div style="height: 500px">
                        <div class="media">
                            <div>
                                <%--<img class="thumbnail img-responsive" src="https://pic.marry.com.tw/2016/08/23/1430/2017/06/19/trim_149783566001148700_450x300.jpg" width="300px" height="300px">--%>
                                <center> 
                                    <asp:Image ID="imgPic" runat="server"  onerror="this.src='/img/head.png'" Height="300" Width="250" /></center>
                                <br />
                                <center>廠商名:<asp:Label ID="lblUserName" runat="server" Text="名子" Font-Bold="True" ForeColor="Black"></asp:Label></center>
                                <br />
                                <div style="float: right">
                                    <asp:HyperLink ID="HyperLink1" class="btn btn-success btn-lg2 " runat="server" NavigateUrl="~/memberCenter_Store.aspx">回會員中心</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink3" class="btn btn-success btn-lg2 " runat="server" NavigateUrl="~/storeAddServices.aspx">增加服務</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-content colintabcontent">
                <div class="container" style="width: 100%; padding: 0;">
                    <div class="well" style="margin: 0 0 0 0; text-align: left; padding-left: 100px">
                        <!--更換封面-->
                         <h5>※必須先新增作品集相片才可挑選!</h5>

                        <!--更換封面-->
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="請選擇要更換封面的作品集"></asp:Label><br /><br />
                        <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" runat="server" DataTextField="fname" DataValueField="fvalue" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" AutoPostBack="True" Font-Size="20px" Height="35px">
                        <asp:ListItem>請選擇</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label4" runat="server" Text="" ForeColor="Red"></asp:Label>
                        <div style="height:650px;overflow-y:auto;overflow-x:hidden;">
                        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" OnItemCommand="DataList1_ItemCommand">
                            <ItemTemplate>
                              <div class="thumbnail" style="border: solid; border-width: 1px; margin-top: 30px; margin-left: 5px;">
                                        <div style="float: right;">                                            
                                         <asp:Button ID="Button2" CssClass="btn btn-danger btn-lg" CommandName="bbb" runat="server" Text="選此照片為封面" />
                                        </div>                                        
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("fPhoto") %>' Height="250px" Width="300px" />
                                        <asp:Label ID="Label1" runat="server" Visible="false"  Text='<%# Eval("fid") %>'></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Visible="false" Text='<%# Eval("fPhotoid") %>'></asp:Label>
                                    </div>
                            </ItemTemplate>
                        </asp:DataList></div>
                        </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

