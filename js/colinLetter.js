$(function () {
    //訊息記錄點開載入內容
    var intervalMsg;
    var pageletter=1;
    $("div.msgtitle").live('click', function () {
        if ($(this).attr('data-chat') != null) {

            $(this).find($("span.badge")).remove();
            $("#Button1").click();
            $("#anotherid").val($(this).attr('data-chat'));
                $.ajax({
                    type: 'get',
                    url: 'ProcessRefreshChatMsg.ashx',
                    data: { 'anotherid': $("#anotherid").val() },
                    success: function (data) {
                        $("ul[data-anotherid=" + $("#anotherid").val() + "]").html(data).parent("div.panel-body").scrollTop(9999);

                    },
                    error: function (err) {
                        alert("錯誤: " + err);
                    }
                });
                clearInterval(intervalMsg);
                intervalMsg = setInterval(function () {
                    $.ajax({
                        type: 'get',
                        url: 'ProcessRefreshChatMsg.ashx',
                        data: { 'anotherid': $("#anotherid").val() },
                        success: function (data) {
                            $("ul[data-anotherid=" + $("#anotherid").val() + "]").html(data).parent("div.panel-body");

                        },
                        error: function (err) {
                            alert("錯誤: " + err);
                        }
                    });
                }, 3000);
        } else {
            $(this).find("span").remove();
            $.ajax({
                type: 'get',
                url: 'ProcessLetter.ashx',
                data: { 'letterid': $(this).find("a[data-letterid]").attr('data-letterid') },
                error: function (err) {
                    alert("錯誤: " + err);
                }
            });
        }
        
        
        $("div.msgtitle").next().slideUp('slow');
        $("div.msgtitle").css({ 'border': '1px solid #dddddd' });
        if ($(this).next().is(':hidden')) {
            $(this).css({ 'border-left': '5px solid #888888' });
            $(this).next().slideDown('slow');
        } else {
            $(this).css({ 'border': '1px solid #dddddd' });
            $(this).next().slideUp('slow');
        }
    });
    $("div.paginationchat a").live('click', function () {
        if ($(this).parent().hasClass('active')) {
            return false;
        }
    });
    
    //點擊站內信載入站內信內容
    $("a.colinletter").live('click', function () {
        $.ajax({
            type: 'get',
            url: 'ProcessLetter.ashx',
            data: { 'page': 1 },
            dataType: 'text',
            success: function (data) {
                $("div.lettercontent").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
    });
    
    //分頁
    $("div.paginationletter a").live("click", function () {
        pageletter = $(this).text();
        if ($(this).parent().hasClass('active')) {
            return false;
        }
        $.ajax({
            type: 'get',
            url: 'ProcessLetter.ashx',
            data: { 'page': $(this).text() },
            dataType: 'text',
            success: function (data) {
                $("div.lettercontent").html(data).hide().fadeIn(500);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });

    //刪除站內信
    $("a.colinletterdel").live('click', function () {
        delletter = $(this).parent().parent().parent();
        delletterid = $(this).attr('data-letterid');
        $.pgwModal({
            title: '確認刪除',
            content: "<h5>確定要刪除該信件嗎?</h5><br/><div style='text-align:right;margin-bottom:3px'><a href='#' class='btn btn-success btn-large colindelletter'>確定</a> <a href='#' class='btn btn-large sendno'>取消</a></div>",
            maxWidth: 200
        });
        return false;
    });
    $("a.colindelletter").live('click', function () {
        delletter.remove();
        $.ajax({
            type: 'get',
            url: 'ProcessDeleteLetter.ashx',
            data: { 'letterid': delletterid },
            dataType: 'text',
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        $.pgwModal('close');
        return false;
    });


});