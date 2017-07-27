$(function () {   
   /* $("div.Acg #ContentPlaceHolder1_Button2").live("click", function () {
        $.pgwModal({
            title: '個人資料更新',
            content: '<center>更新成功</center>',
            maxWidth: 200
        });
        return false;
    })*/
    
    var href = location.search;    
    var tabside = href.indexOf("tab");
    var success = href.indexOf("success")
    var delete2 = href.indexOf("delete")
    var delete1 = href.indexOf("delete1")
    var fail2 = href.indexOf("fail2")
    var Evasucc = href.indexOf("suc")
    if (delete2 !== -1) {
         $("a.qqb").click();
    }
    if (delete1 !== -1) {
        $("a.qqc").click();
    }
   // alert(href.substr(tabside + 4, 1))
    if (href.substr(tabside + 4, 1).match("1")) {
        $("a.qqa").click();
        if (success !== -1) {
            $("div.succ").html("更新資料成功");
        }
      
        else if (fail2 !== -1 ) {
            $("div.succ").html("只能上傳gif,png,jpeg,jpg,bmp圖像檔！");
        }
    }
    if (href.substr(tabside + 4, 1).match("5")) {
        $("a.qqe").click();
        if (Evasucc !== -1) {
            $("div.Evasuccess").html("評價完成");
        }
    }
   

    if (href.substr(tabside + 4, 1).match("2")) {
        $("a.qqb").click();
    }
    if (href.substr(tabside + 4, 1).match("3")) {
        $("a.qqc").click();
    }

    for (i = 0; i < 50; i++) {
        $("div.thumbnail #ContentPlaceHolder1_DLLMyservices_Button3_"+ i).live("click", function () {
            $.pgwModal({
                title: '確認是否刪除',
                content: "<div style='text-align:center;margin-bottom:3px'><a href='#' class='btn btn-success btn-large godelete1'>確定</a> <a href='#' class='btn btn-large sendno'>取消</a></div>",
                maxWidth: 200
            });
        })
    }
    $(".godelete1").live("click", function () {
        $(" #ContentPlaceHolder1_Button5").click();
    });


    for (i = 0; i < 50; i++) {
        $("div.thumbnail #ContentPlaceHolder1_DataList1_Button3_" + i).live("click", function () {
            $.pgwModal({
                title: '確認是否刪除',
                content: "<div style='text-align:center;margin-bottom:3px'><a href='#' class='btn btn-success btn-large godelete'>確定</a> <a href='#' class='btn btn-large sendno'>取消</a></div>",
                maxWidth: 200
            });           
        })        
    }
    $(".godelete").live("click", function () {
        $(" #ContentPlaceHolder1_Button4").click();
    });
    

});