<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WeddingTobe.aspx.cs" Inherits="WeddingToBe" %>

<%@ Register Src="~/colinToBeDateBox.ascx" TagPrefix="uc1" TagName="colinToBeDateBox" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--連結導航-->
    <div class="breadcrumb">
        	<div class="wrap">
                <div class="container-fluid">
                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>沖宜忌煞
                 
                    </div>
            </div> 
        </div>
    <!--END 連結導航-->
    <div class="container">
    

            <h1 class="title text-center">沖宜忌煞</h1>
        
    <uc1:colinToBeDateBox runat="server" ID="colinToBeDateBox" />    
        <%--<span class="pull-right"><a href="#" class="btn btn-danger btn-large">上個月</a> <a href="#" class="btn btn-danger btn-large">下個月</a></span>--%>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        
        
            <span style="color:red">※</span>顏色為&nbsp;<div style="display:inline;background-color:#FDD;border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</div>&nbsp;宜嫁娶,&nbsp;為&nbsp;<div style="display:inline;background-color:#DDD;border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</div>&nbsp;忌嫁娶
        
        <div class="colinfatecontent">
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        
	<%--<div class="calendar" data-toggle="calendar">
                
		<div class="row">
			<div class="col-xs-12 calendar-day">                
				<time datetime="2014-06-29">29</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-06-30">30</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-01">01</time>
                <div>宜：<br/>嫁娶,安機械,交易,出行,祭祀,祈福,求嗣,齋醮,塑繪,開光,合帳,裁衣,放水,開池,掘井<br/>忌：<br/>作灶,理髮,造橋,行喪,安葬</div>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-02">02</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-03">03</time>				
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-04">04</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-05">05</time>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-06">06</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-07">07</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-08">08</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-09">09</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-10">10</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-11">11</time>				
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-12">12</time>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-13">13</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-14">14</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-15">15</time>					
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-16">16</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-17">17</time>>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-18">18</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-19">19</time>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-20">20</time>				
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-21">21</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-22">22</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-23">23</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-24">24</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-25">25</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-26">26</time>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-27">27</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-28">28</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-29">29</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-30">30</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-31">31</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-08-01">01</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-08-02">02</time>
			</div>
		</div>

	</div>--%>
	</div>

        </div>
</asp:Content>

