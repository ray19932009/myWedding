$(function(){
    $("a.colinyesservice").live('click', function () {
        //廠商接受該新人選擇的服務
        calendarid = $(this).attr("data-calendarid")
        $.pgwModal({
            title: '接受確認',
            content: "<b>您確定接受該方案嗎？</b><br/><div style='text-align:right;'><a class='btn btn-success btn-large colinaccept'>接受</a><a style='margin-left:1%;' class='btn btn-large sendno'>取消</a></div>",
            maxWidth: 300
        });        
        return false;
    });
    $("a.colinaccept").live('click', function () {
        $.ajax({
            type: 'get',
            url: 'ProcessStoreAcceptServices.ashx',
            data: { 'calendarid': calendarid, "yes": 1 },
            success: function () {
                $.pgwModal({
                    title: '回覆通知',
                    content: "已接受該新人選擇的服務方案",
                    maxWidth: 300
                });
                setTimeout(function () {
                    location.href = "memberCenter_Store.aspx?calendar=1";
                }, 2000);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });
    $("a.colinsendnowhy").live('click', function () {
        //廠商拒絕新人選的服務寫下理由
        calendarid=$(this).attr("data-calendarid")
        $.pgwModal({
            title: '拒絕理由',
            content: "<b>請寫下拒絕理由:</b><br/><textarea id='reason' style='width:100%;font-size:16px;' rows=\"3\" cols=\"800\"></textarea><br/><div style='text-align:right;'><a class='btn btn-success btn-large colinsendwhynot'>送出</a><a style='margin-left:1%;' class='btn btn-large sendno'>取消</a></div>",
            maxWidth: 600
        });
        return false;
    });
    $("a.colinsendwhynot").live('click', function () {
        $.ajax({
            type: 'get',
            url: 'ProcessStoreAcceptServices.ashx',
            data: { 'calendarid': calendarid, 'reason': $("#reason").val().replace(/\r\n|\r|\n/g,"\n") },
            success: function () {
                $.pgwModal({
                    title: '回覆通知',
                    content: "已拒絕該新人選擇的服務方案",
                    maxWidth: 300
                });
                setTimeout(function () {
                    location.href = "memberCenter_Store.aspx?calendar=1";
                }, 2000);
            },
            error: function (err) {
                alert("錯誤: " + err);
            }
        });
        return false;
    });
});