$(function () {
    //指到日期選擇器時變換不可選之日期
    $(".colinpicker").live("focusin", function () {        
        //小的選擇可服務日期
        if ($(this).attr('id') == 'picker0') {
            array = array0;
        } else if ($(this).attr('id') == 'picker1'){
            array = array1;
        } else if ($(this).attr('id') == 'picker2') {
            array = array2;
        } else if ($(this).attr('id') == 'picker3') {
            array = array3;
        }
            $(this).datepicker({
                firstDay: 1,
                beforeShowDay: function (date) {
                    //轉換日期格式
                    var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
                    return [array.indexOf(string) == -1]
                },
                minDate: '+1'
            });
    });


    //宣告變數初始
    var msg = 1, colinsubclass = 0, colinclass = 1, page = 1, delclass = 0, chooseserviceid = 0,city=0;
    //隱藏地區
    $("div#city").hide();    
    //刪除已選服務
    $("a[data-delclass]").live('click', function () {
        delclass=$(this).attr('data-delclass');
        $.pgwModal({
            title: '確認刪除',
            content: "<h5>確定要刪除該服務嗎?</h5><br/><div style='text-align:right;margin-bottom:3px'><a href='#' class='btn btn-success btn-large colindel'>確定</a> <a href='#' class='btn btn-large sendno'>取消</a></div>",
            maxWidth: 200
        });
        return false;
    });
    $("a.colindel").live('click', function () {
        $.ajax({
            type: 'get',
            url: 'ProcessDeleteServices.ashx',
            data: { 'delclass': delclass },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        $("dd[data-num='" + delclass + "']").html("無選擇").hide().fadeIn(500);
        $.pgwModal('close');
        return false; 
    });
    //點選送出一條龍服務產生選日期UI
    $("a.colinsend").live("click", function () {
        strchoosetime = "";
        count = -1;
        $("dd[data-num]").each(function () {
            count++;
            if ($(this).text() != "無選擇") {
                strchoosetime += $(this).text().substr(2, $(this).text().length);
                strchoosetime += "<br/><input id='picker" + count + "' type='text' class='colinpicker' placeholder='點我選擇日期' readonly='readonly'/><br/>";
            }

        });
        if (!strchoosetime) {
            $.pgwModal({
                title: '抱歉',
                content: "請至少選擇一組服務",
                maxWidth: 200
            });
            return false;
        } else {
            $.pgwModal({
                title: '服務日期選擇',
                content: strchoosetime + "<br/><div style='text-align:right;margin-bottom:3px'><a href='#' class='btn btn-success btn-large sendtocalender'>確定</a> <a href='#' class='btn btn-large sendno'>取消</a></div>",
                maxWidth: 400
            });
        }

        array0 = [], array1 = [], array2 = [], array3 = [],
        $.ajax({
            type: 'post',
            url: 'ProcessAvailableTime.ashx',
            dataType: 'json',
            success: function (data) {                
                $.each(data, function (key,value) {
                    if (key == "c0") {
                        $.each(value, function (index, value) {
                            array0 = array0.concat(value);                                                 
                        });
                    } else if (key == "c1") {
                        $.each(value, function (index, value) {
                            array1 = array1.concat(value);
                        });
                    } else if (key == "c2") {
                        $.each(value, function (index, value) {
                            array2 = array2.concat(value);
                        });
                    } else if (key == "c3") {
                        $.each(value, function (index, value) {
                            array3 = array3.concat(value);
                        });
                    }
                });
            }
        });
        
        return false;
    });
    $("a.sendtocalender").live('click', function () {
        for (i = 0; i <= 3; i++) {
            if ($("#picker"+i).length > 0) {
                if ($("#picker" + i).val() == "") {
                    $.pgwModal({
                        title: "日期是必填欄位",
                        content: "<div style='text-align:center;margin-bottom:3px'><a href='#' class='btn btn-large sendno'>確定</a></div>",
                        maxWidth:200
                    });
                    return false;
                }
            }
        }
        
        $.ajax({
            type: 'get',
            url: 'ProcessSendToCalendar.ashx',
            data: { 'picker0': $("#picker0").val(), 'picker1': $("#picker1").val(), 'picker2': $("#picker2").val(), 'picker3': $("#picker3").val()},
            success: function (data) {
                $.pgwModal({
                    title: "成功媒合服務方案",
                    content: "三秒後導向專屬行事曆查看服務方案！<br/><div style='text-align:center;margin-bottom:3px;margin-top:3px'><a href='#' class='btn btn-large sendno'>確定</a></div>",
                    maxWidth: 300
                });
                setTimeout(function () {
                        location.href = "memberCenter_New.aspx?calendar=1";                    
                }, 3000);

            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });
    $("a.sendno").live('click', function () {
        $.pgwModal('close');
        return false;
    });
    //ColinOneDragon
    $(".Gplus").next().slideDown("slow");
    $("ul.colintabonedragon a").addClass("colindisableCss");
    $("a[data-page]").live("click", function () {        
        if ($(this).attr("data-page") == 2) {
            if (colinclass == 4) {                
                return false;
            }
            colinclass++;            
        } else {
            if (colinclass == 1) {
                return false;
            }
            colinclass--;            
        }
        if (colinclass == 4) {
            $("div#city").show();
        } else {
            $("div#city").hide();
        }
        $("#runningman").stop().animate({ "margin-left": (20 + (25 * (colinclass - 1))) + "%" }, 500, 'easeOutSine');
        $("div.bar").css("width", (colinclass * 25) + "%");
        $.ajax({
            type: 'get',
            url: 'ProcessManual.ashx',
            data: 'id=' + colinclass,
            success: function (data) {
                $("div#manual").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        
        $.ajax({
            type: 'get',
            url: 'ProcessServiceSubClassTitle.ashx',
            data: { 'id': colinclass },
            dataType: 'text',
            success: function (data) {
                $("div#p1 div.colinoptions ul.colinfilters").html(data).hide().fadeIn(500);
                $("div#p1 div.colinoptions ul.colinfilters a:first").click();
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        $("ul.nav li").removeClass("active");
        $("ul.nav a[data-id='" + colinclass + "']").parent().addClass("active");        
        return false;
    });
    //排序下拉選單
    $("ul.colindropdownmenu a").live("click", function () {
        $("a.colindropdown span:first").html($(this).html());
        $("a.colindropdown span:first").attr({ 'data-sort': $(this).attr('data-sort') })        
        $.ajax({
            type: 'get',
            url: 'ProcessPage.ashx',
            data: { 'subclass': colinsubclass, 'class': colinclass, 'page': page, 'sort': $("a.colindropdown span:first").attr('data-sort'), 'city': city },
            dataType: 'text',
            success: function (data) {
                $("div#content1").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });
    //下拉選單地區
    $("ul.colindropdownmenucity a").live("click", function () {        
        $("a.colindropdowncity span:first").html($(this).html());
        $("a.colindropdowncity span:first").attr({ 'data-city': $(this).attr('data-city') })        
        city=$(this).attr('data-city');
        $.ajax({
            type: 'get',
            url: 'ProcessPage.ashx',
            data: { 'subclass': colinsubclass, 'class': colinclass, 'page': page, 'sort': $("a.colindropdown span:first").attr('data-sort'),'city':city },
            dataType: 'text',
            success: function (data) {
                $("div#content1").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });
    //ServiceChoose
    $("a[data-service]").live("click", function () {
        if ($("div[data-identity]").attr('data-identity') == 1) {
            $.pgwModal({
                title:'抱歉',
                content: '<center>你不是新人</center>',
                maxWidth:200
            });
            return false;
        }
        if ($("dd[data-num='" + colinclass + "']").text() != "無選擇") {
            $.pgwModal({
                title: '該類別已有一組方案',
                content: "<h5>確定要更改為此方案嗎?</h5><br/><div style='text-align:right;margin-bottom:3px'><a href='#' class='btn btn-success btn-large colinchoose'>確定</a> <a href='#' class='btn btn-large sendno'>取消</a></div>",
                maxWidth: 300
            });
        } else {
            $.pgwModal({
                title: '確認選取',
                content: "<h5>確定要選取該服務嗎?</h5><br/><div style='text-align:right;margin-bottom:3px'><a href='#' class='btn btn-success btn-large colinchoose'>確定</a> <a href='#' class='btn btn-large sendno'>取消</a></div>",
                maxWidth: 200
            });
        }        
        chooseserviceid = $(this).attr("data-service");
        return false;
    });
    $("a.colinchoose").live('click', function () {
        $.ajax({
            type: 'get',
            url: 'ProcessChooseService.ashx',
            data: { 'serviceid': chooseserviceid, 'serviceclass': colinclass },
            dataType: 'text',
            success: function (data) {
                $("dd[data-num='" + colinclass + "']").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        $.pgwModal('close');
        return false;
    });
    //gotop
    $("div#gotop").live("click",function(){
        jQuery("html,body").animate({
            scrollTop:0
        },300);
    });
    $(window).scroll(function() {
        if ( $(this).scrollTop() > 300){
            $('div#gotop').stop().show().animate({ "bottom": '1%' }, 200, 'easeOutSine');
        } else {
            $('div#gotop').stop().hide().animate({ "bottom": '30%' }, 200, 'easeOutSine');
        }
    });
    //go
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('div#go').stop().show().animate({ "bottom": '70%' }, 200);
        } else {
            $('div#go').stop().show().animate({ "bottom": '35%' }, 200);
        }
    });
    //分頁
    $("div.paginationonedragon a").live("click", function () {
        page = $(this).text();
        if ($(this).parent().hasClass('active')) {
            return false;
        }
        $("div#gotop").click();
        $.ajax({
            type: 'get',
            url: 'ProcessPage.ashx',
            data: { 'subclass': colinsubclass, 'class': colinclass, 'page': $(this).text(), 'sort': $("a.colindropdown span:first").attr('data-sort'),'city':city },
            dataType: 'text',
            success: function (data) {
                $("div#content1").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });
    var $optionSets = $('div.colinoptions .colinfilters'),
        $optionLinks = $optionSets.find('a');

    $optionLinks.live('click', function () {
        var $this = $(this);
        // don't proceed if already selected
        if ($this.hasClass('selected')) {
            return false;
        }
        var $optionSet = $this.parents('.colinfilters');
        $optionSet.find('.selected').removeClass('selected');
        $this.addClass('selected');
        msg = $(this).attr("data-class");
        colinsubclass = $(this).attr("data-subclass");
        colinclass = $(this).attr("data-class");
        $.ajax({
            type: 'get',
            url: 'ProcessPage.ashx',
            data: { 'subclass': $(this).attr("data-subclass"), 'class': $(this).attr("data-class"), 'sort': $("a.colindropdown span:first").attr('data-sort'),'city':city },
            dataType: 'text',
            success: function (data) {
                $("div#content1").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });

        return false;
    });
    //右邊slide    
    $(".Gplus").live('click',function () {
        $(this).next().slideToggle("slow");
    });
    //processManual
    $("div#manual a").live('click', function () {
        $.pgwModal({
            title: $("div#" + $(this).attr('data-target')+" div[data-title]").html(),
            content: $("div#" + $(this).attr('data-target') + " div[data-content]").html()
        });
    });

    //討論區
    $("div.paginationonedragon12 a").live("click", function () {
        page = $(this).text();
        if ($(this).parent().hasClass('active')) {
            return false;
        }
        $("div#gotop").click();
        $.ajax({
            type: 'get',
            url: 'ProcessPage1.ashx',
            data: { 'fIdTitle': $("div[data-titleid]").attr("data-titleid"), 'page': $(this).text() },
            dataType: 'text',
            success: function (data) {
                $("div#content2").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });
    //問報價

    $("div.paginationonedragonask a").live("click", function () {
     
        page = $(this).text();
        if ($(this).parent().hasClass('active')) {
            return false;
        }
        $("div#gotop").click();
        $.ajax({
            type: 'get',
            url: 'ProcessPageAsk.ashx',
            data: {'page': $(this).text() },
            dataType: 'text',
            success: function (data) {
                $("div#content3").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });



    $("div.paginationonedragonforum a").live("click", function () {

        page = $(this).text();
        if ($(this).parent().hasClass('active')) {
            return false;
        }
        $("div#gotop").click();
        $.ajax({
            type: 'get',
            url: 'ProcessPageforum.ashx',
            data: { 'page': $(this).text() },
            dataType: 'text',
            success: function (data) {
                $("div#content3").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });

    $("div.paginationonedragonAnswer a").live("click", function () {

        page = $(this).text();
        if ($(this).parent().hasClass('active')) {
            return false;
        }
        $("div#gotop").click();
        $.ajax({
            type: 'get',
            url: 'ProcessPageAnswer.ashx',
            data: { 'fid': $("div[data-askid]").attr("data-askid"), 'page': $(this).text() },
            dataType: 'text',
            success: function (data) {
                $("div#content3").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });
    $(".well a[data-askid]").live("click", function () {
        if ($(".well a[data-identity]").attr('data-identity') == 0 ) {
            $.pgwModal({
                title: '抱歉',
                content: '<center>你不是廠商</center>',
                maxWidth: 200
            });
            return false;
        }else if ($("a[data-identity]").attr('data-identity') == 3) {
            $.pgwModal({
                title: '抱歉',
                content: '<center>請先登入</center>',
                maxWidth: 200
            });
            return false;
        } else {
    
            document.location.href = "AnswerPrice.aspx?id=" + $(".well a[data-askid]").attr('data-askid') + "&stid=" + $("a[data-identity]").attr('data-storeid') + ""
        
        }
        return false;
    });
    //報價選定方案
    $(".well a[data-answerid]").live("click", function () {
      
        if ($(".well a[data-identity]").attr('data-identity') == 1) {
            $.pgwModal({
                title: '抱歉',
                content: '<center>你不是新人</center>',
                maxWidth: 200
            });
            return false;
        } else if ($("a[data-identity]").attr('data-identity') == 3) {
            $.pgwModal({
                title: '抱歉',
                content: '<center>請先登入</center>',
                maxWidth: 200
            });
            return false;
        } else {    
            strchoosetime = "";
            count = -1;
                count++;
                samservicesid = $(this).attr('data-servicesid')
                samanswerstorid =  $(this).attr('data-answerstoreid')
                samdate = $(this).attr('data-date')
               $.pgwModal({
                    title: '是否確定選擇此方案',
                    content:"<div style='text-align:center;margin-bottom:3px'><a href='#' class='btn btn-success btn-large sendtocalendercase'>確定</a> <a href='#' class='btn btn-large sendno'>取消</a></div>",
                    maxWidth: 250
                });
            
        }
        array = []
       $.ajax({
           type: 'post',
           url: 'ProcessAvailableTimeSam.ashx',
           data: { 'storeid': $(".well a[data-answerstoreid]").attr('data-answerstoreid') },
           dataType: 'json',
           success: function (data) {
               $.each(data, function (index, value) {
                   array = array.concat(value);
               });
           }
       });
        return false;
    });
    $("a.sendtocalendercase").live('click', function () {
        //alert($("#sampicker").val() + $(".well a[data-servicesid]").attr('data-servicesid') + $(".well a[data-answerstoreid]").attr('data-answerstoreid'))

        $.ajax({
            type: 'get',
            url: 'ProcessSendToCalendarCase.ashx',
            data: { 'servicesid': samservicesid, 'storeid': samanswerstorid, 'date': samdate },
            success: function (data) {
                $.pgwModal({
                    title: "成功媒合服務方案",
                    content: "已成功選擇方案！<br/>詳細時間請前往專屬行事曆查看<br/><div style='text-align:center;margin-bottom:3px;margin-top:3px'><a href='#' class='btn btn-large sendno'>確定</a></div>",
                    maxWidth: 300
                });

            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });

});





