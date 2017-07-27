$(function () {
    var serviceid = 1;
    
    $("a.colinchooseservices").live('click', function () {

        if ($("#identity").val() == 1) {
            $.pgwModal({
                title: '抱歉',
                content: '<center>你不是新人</center>',
                maxWidth: 200
            });
            return false;
        }

        if ($("#login ul li:first").text().indexOf("免費註冊") >= 0) {
            $.pgwModal({
                title: '請先登入',
                content: "<center><a class='sendno btn'>確定</a></center>",
                maxWidth: 150
            });
            return false;
        }

        array = [];
        serviceid = $(this).attr('data-colinserviceid')
        $.ajax({
            type: 'post',
            url: 'ProcessAvailableTimeSam.ashx',
            data: { 'storeid': $(this).attr('data-colinstoreid') },
            dataType: 'json',
            success: function (data) {
                $.each(data, function (index, value) {
                    array = array.concat(value);
                });
            }
        });

        $.pgwModal({
            title: '服務日期選擇',
            content: "<input id='colindatepicker' type='text' class='colinpicker' placeholder='點我選擇日期' readonly='readonly'/><br/><br/><div style='text-align:right;margin-bottom:3px'><a href='#' class='btn btn-success btn-large colinsendtocalender'>確定</a> <a href='#' class='btn btn-large sendno'>取消</a></div>",
            maxWidth: 400
        });
        return false;
    });

    $("a.colinsendtocalender").live('click', function () {
        if ($("#colindatepicker").val() == "") {
            $.pgwModal({
                title: "日期是必填欄位",
                content: "<div style='text-align:center;margin-bottom:3px'><a href='#' class='btn btn-large sendno'>確定</a></div>",
                maxWidth: 200
            });
            return false;
        }

        $.ajax({
            type: 'get',
            url: 'ProcessChooseServices.ashx',
            dataType:'text',
            data: { 'date': $("#colindatepicker").val(), 'serviceid': serviceid },
            success: function () {
                $.pgwModal({
                    title: "成功送出服務方案",
                    content: "待該服務提供之廠商接受後即加入專屬行事曆，可於右上角之會員中心查看專屬行事曆瞭解詳情！<br/><div style='text-align:center;margin-bottom:3px;margin-top:3px'><a href='#' class='btn btn-large sendno'>確定</a></div>",
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