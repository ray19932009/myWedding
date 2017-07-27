<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AnswerPrice.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .well ul{
            width:100%;
            list-style-type:none;
        }
        .datepicker{
            width:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--關於我們內容-->
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="FactoryDBDataContext" EntityTypeName="" TableName="tServices" Where="fIdStores == @fIdStores">
        <WhereParameters>
            <asp:QueryStringParameter Name="fIdStores" QueryStringField="stid" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
      <div class="container" style="width:100%; padding:0;" >
        <div class="well" style="text-align:center;">
            
            <h3 style="margin: 0px; padding: 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(232, 75, 128); border-left-color: initial; border-image: initial; outline: 0px; font-size: 18px; vertical-align: baseline; background: transparent; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: normal; line-height: normal; font-family: 微軟正黑體, &quot;Microsoft JhengHei&quot;; color: rgb(232, 75, 128); letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">我有檔期，我要報價( <i class="must">*</i> 為必填)</h3>
        <br />
                
            <ul>
                <li>
                    <asp:Label ID="Label4" runat="server" style="font-size: x-large; color: #FF0000" Text="Label"></asp:Label>
                <li><span class="item_name"><i class="must">*</i>提供服務：</span>
    <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="24px" Height="35%" Width="45%" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList>
</li>
                
                <asp:Label ID="Label1" runat="server" Text="" ></asp:Label>  &nbsp;<li><span class="item_name" ><i class="must"></i>價錢：</span> <span class="sattus" id="price1" style="display:none"><i></i></span>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    &nbsp;<span class="sattus" id="descri" style="display:none"></span>&nbsp;<li><span class="item_name" ><i class="must">*</i>備註：</span> <span class="sattus" id="descri_check" style="display:none"><i></i></span>
                    <asp:TextBox ID="TextBox1" runat="server" Height="323px" Width="595px" TextMode="MultiLine"></asp:TextBox>
      &nbsp;</li>
            </ul>
            <ul><li class="sub_title"></li>
<li><span class="item_name"></span>
</li><li id="request_type_li_6002"><span class="item_name"></span></li></ul>
    <asp:Button ID="Button1" runat="server" Text="選擇方案" OnClick="Button1_Click1"  />
    </div>
    </div>







</asp:Content>

