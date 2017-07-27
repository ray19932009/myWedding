<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
               .auto-style6 {
            font-size: large;
        }
        .auto-style7 {
            color: #FF0000;
            font-size: large;
        }
        

.card-container.card {
    max-width: 650px;
    padding: 40px 40px;
  
}

.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}

/*
 * Card component
 */
.card {
    background-color: #F7F7F7;
    /* just in case there no content*/
  
    margin: 0 auto 25px;
    margin-top: 50px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.profile-img-card {
    width: 310px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
}

.reauth-email {
    display: block;
    color: #404040;
    line-height: 2;
    margin-bottom: 10px;
    font-size: 14px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin #inputEmail,
.form-signin #inputPassword {
    direction: ltr;
    height: 44px;
    font-size: 16px;
}

.form-signin input[type=email],
.form-signin input[type=password],
.form-signin input[type=text],
.form-signin button {
    width: 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
            top: 0px;
            left: 0px;
            height: 35px;
        }


.btn.btn-signin {
    /*background-color: #4d90fe; */
    background-color: rgb(104, 145, 162);
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    padding: 0px;
    font-weight: 700;
    font-size: 14px;
    height: 36px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
}

.btn.btn-signin:hover,
.btn.btn-signin:active,
.btn.btn-signin:focus {
    background-color: rgb(12, 97, 33);
}

.forgot-password {
    color: rgb(104, 145, 162);
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: rgb(12, 97, 33);
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!--註冊內容-->
    <div class="container" style="margin-top:3%;">
        <div class="card card-container" style="border-radius:10px; box-shadow:5px 5px 5px 5px #999;margin-top:2%;">
                <div style="text-align:center; margin-bottom:10px; font-weight:bold;">
                    <h2>立即線上註冊，享受完整服務</h2>
                    <br/>
    <ul style="list-style-type:none;"><li class="choose_type"><span class="item_name"><i>*</i> 選擇身份：</span>
        <asp:RadioButtonList ID="rdoList" runat="server" RepeatDirection="Horizontal" style="margin:0 auto;">
            <asp:ListItem Selected="True" Value="0">「準新人 (找婚禮服務)」</asp:ListItem>
             <asp:ListItem  Value="1">「店家 (提供婚禮服務)」</asp:ListItem>
        </asp:RadioButtonList>
<br />
<div>
</li><li><span class="item_name">
    <br />
 <i>*</i> 帳號：</span><input type="text" name="account" class="basic_input w_100 input_code" placeholder="請輸入信箱，作為您的登入帳號"/>
 <span class="sattus" style="display:none"><i></i></span></li><li><span class="item_name">
     <br />
 <i>*</i> 密碼：</span>
<input type="password" name="pwd" maxlength="20" class="basic_input w_100 input_code" placeholder="請輸入您的密碼"/><span class="sattus" style="display:none"><i></i></span>
</li><li><span class="item_name">
    <br />
 <i>*</i>再輸入一次密碼：</span><input type="password" name="pwd_dou" maxlength="20" class="basic_input w_100 input_code" placeholder="再輸入一次密碼"/>
 <span class="sattus" style="display:none"><i></i></span></li></ul>
    <br />
 <span class="item_name">
 <i>*</i> 姓名：</span><input type="text" name="name" class="basic_input w_100 input_code" placeholder="請輸入姓名、廠商名稱"/>
 <span class="sattus" style="display:none"><i></i></span><span class="item_name">
                    <br />
 <asp:Label ID="lblMessage" runat="server" CssClass="auto-style4" Text="Label" ForeColor="Red"></asp:Label>
                    <br />
  <asp:Button ID="btnRegister" runat="server" CssClass="auto-style2" OnClick="btnRegister_Click" Text="註冊" />
     </span>




                </div>

            </div><!-- /form -->
              
           
        </div><!-- /card-container -->
   




</asp:Content>

