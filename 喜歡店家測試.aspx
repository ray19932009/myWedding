<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="喜歡店家測試.aspx.cs" Inherits="模板測試" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 20px;
        }
        .test{
            text-align:center;
        }

    </style>
    <script type="text/javascript">
 


        
        


    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  

        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSession" runat="server" Text="2" Width="50px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
    <div>
                    <asp:Label  ID="Label1" runat="server" Text=""></asp:Label>
                    <asp:DataList ID="DLLikeStores" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" OnItemDataBound="DLLikeStores_ItemDataBound1">
                        <ItemTemplate>
                            <br />
                            <asp:ImageButton ID="imgBtnLikeStores" runat="server" onerror="this.src='/img/noob.png'" ImageUrl='<%#Eval("fPhoto") %>' Height="190px" Width="170px" />
                            &nbsp;&nbsp;
                            <br />
                            <asp:Label ID="lblLikeStores" runat="server"   Width="160px"  style="TEXT-ALIGN:left;" Text='<%# Eval("fName") %>'  ></asp:Label>
                        </ItemTemplate>

                    </asp:DataList>
                  <!--  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myWeddingConnectionString %>" SelectCommand="SELECT tMember.fName, tMember.fPhoto FROM tCollection INNER JOIN tMember ON tCollection.fIdStores = tMember.fIdMember WHERE (tCollection.fIdMember = @fIdMember)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblSession" DefaultValue="" Name="fIdMember" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>-->



                </div>
    
   

    
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
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
        </table>


   

    
</asp:Content>