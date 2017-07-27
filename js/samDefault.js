$(function () {
    $(".btn_area a").live('click', function () {
        if ($("#loginid").length > 0) {
            if ($("a.loginusertype").attr('href') === "memberCenter_New.aspx") { 
        if ($('#picker').val() !== "" && $('#defaultselect').val() !== "") {
        $(".btn_area a").attr('href', 'Quotes.aspx?picker=' + $('#defaultselect').val() + "&date=" + $('#picker').val());
        } else {
            $.pgwModal({
                title: "抱歉",
                content: "<div style='text-align:center;'>請先選擇婚禮服務以及時間！</div><br/><div style='text-align:center;margin-bottom:3px;margin-top:3px'><a href='#' class='btn btn-large sendno'>確定</a></div>",
                maxWidth: 300
            });
            return false;
        }
            }else{
                $.pgwModal({
                    title: "抱歉",
                    content: "<div style='text-align:center;'>您不是新人 無法問價！</div><br/><div style='text-align:center;margin-bottom:3px;margin-top:3px'><a href='#' class='btn btn-large sendno'>確定</a></div>",
                    maxWidth: 300
                });
                return false;
            }
        } else {
            $.pgwModal({
                title: "抱歉",
                content: "<div style='text-align:center;'>請先登入！</div><div style='text-align:center;margin-bottom:3px;margin-top:3px'><a href='#' class='btn btn-large sendno'>確定</a></div>",
                maxWidth: 300
            });
            return false;
        }
        
    });
   
});