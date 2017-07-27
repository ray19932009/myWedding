$(function () {
    var interval;
    //重新抓取訊息紀錄row
    function refreshChatRow(page) {
        $.ajax({
            type: 'get',
            dataType: 'json',
            url: 'ProccessChat.ashx',
            data: { 'page': page },
            success: function (data) {
                $("div.chatcontent").html(data.allcontent).hide().fadeIn('slow');
                $("div.colinpaganation").html(data.paganation).hide().fadeIn('slow');
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
    }
    function colinsetInterval(setpage) {
        clearInterval(interval);
        interval = setInterval(function () {
            $.ajax({
                type: 'get',
                dataType:'json',
                url: 'ProccessChat.ashx',
                data: { 'page': setpage },
                success: function (data) {
                    $.each(data.allrowcontent, function (i, item) {
                        isExist = false;
                        $("div.colinchatrow div[data-chat]").each(function () {
                            if ($(this).attr('data-chat').indexOf(item.anotherid)>=0) {
                                $(this).children().children().text(item.badge)
                                isExist = true;
                                return false;
                            }
                        });
                        if (!isExist) {
                            $("div.chatcontent").prepend(item.rowcontent).hide().fadeIn('slow');
                        }
                    });
                    
                },
                error: function (err) {
                    alert("錯誤: " + err);
                }
            });
        }, 3000);
    }
    //點擊訊息紀錄tab載入訊息紀錄ROW
    $("a.colinchats").live('click', function () {
        refreshChatRow(1);
        colinsetInterval(1);
        return false;
    });
    //chat分頁點擊
    $("div.paginationchat a").live('click', function () {
        if ($(this).parent().hasClass('active')) {
            return false;
        }
        refreshChatRow($(this).text());
        colinsetInterval($(this).text());        
        return false;
    });
    if (location.search.includes("page")) {
        $("a.colinchat").click();
    }    
    $("a[data-chat]").live('click', function () {
        if ($("#login ul li:first").text().indexOf("免費註冊") >= 0) {
            $.pgwModal({
                title: '請先登入',
                content:"<center><a class='sendno btn'>確定</a></center>",
                maxWidth:150
            });
        } else if ($("input#loginid").val() == $("a[data-chat]").attr('data-chat')) {            
            $.pgwModal({
                title: '你不可以跟自己聊天',
                content: "<center><a class='sendno btn'>確定</a></center>",
                maxWidth: 300
            });
        } else {        
            $("div.colinchat").fadeIn('slow');
            $("div.colinchat div.panel-body").scrollTop(9999);
            $("input#anotherid").val($(this).attr('data-chat'));
            $("#Button1").click();
        }        
        return false;
    });
    $("span.colinchatclose").live('click', function () {
        $("div.colinchat").fadeOut('slow');
        $("div#minchat").fadeIn('slow');
        return false;
    });
    $("div#minchat").live('click', function () {
        $("div#minchat").fadeOut('slow');
        $("div.colinchat").fadeIn('slow');
    });
    //卷至底部
    $("ul.chat").parent("div.panel-body").bind('DOMNodeInserted', function (e) {
        $(this).scrollTop(9999);
    });
    $("a.colinchatsend").live('click', function () {
        $.ajax({
            type: 'get',
            url: 'ProcessChat.ashx',
            data: { 'storeid': $("a[data-chat]").attr('data-chat'), 'content': $("div.colinchatfoot input").val() },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        $("#Button1").click();
        $("div.colinchatfoot input").val("");
        return false;
    });
    $("a.colinchatsendstorerecieve").live('click', function () {
        $.ajax({
            type: 'get',
            url: 'ProcessChat.ashx',
            data: { 'storeid': $("#anotherid").val(), 'content': $(this).parent().prev().val() },
            success: function (data) {
                $("ul[data-anotherid=" + $("#anotherid").val() + "]").html(data).parent("div.panel-body").scrollTop(9999);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        $("div.colinchatfoot input").val("");
        return false;
    });
    $("a[data-more]").live('click', function () {
        $(this).attr('data-more', parseInt($(this).attr('data-more')) + 1);        
        $("input#more").val($(this).attr('data-more'));
        $("#Button1").click();
        return false;
    });
    
});