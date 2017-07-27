$(document).ready(function () {
    $(".fancybox-thumb").fancybox({
        prevEffect: 'none',
        nextEffect: 'none',
        helpers: {
            title: {
                type: 'outside'
            },
            thumbs: {
                width: 50,
                height: 50
            }
        }
    });

    $("a.liClickStar").live("click", function () {


        if ($(this).find("img").attr("src") === "img/starfull.png") {

            $(this).find("img").attr("src", "img/starempty.png");

            $.ajax({
                type: 'get',
                url: 'processStar.ashx',
                data: { 'serviceId': $(this).attr("data-serviceid"), 'deleteOrInsert': 0 },
                error: function (err) {
                    alert("錯誤: " + err);
                }
            });


        }
        else            
        {
            $(this).find("img").attr("src", "img/starfull.png");

            $.ajax({
                type: 'get',
                url: 'processStar.ashx',
                data: { 'serviceId': $(this).attr("data-serviceid"), 'deleteOrInsert': 1 },
                error: function (err) {
                    alert("錯誤: " + err);
                }
            });

           


        }
       
        return false;
    })

    $("a.liClickLike").live("click", function () {


        if ($(this).find("img").attr("src") === "img/like1.jpg") {

            $(this).find("img").attr("src", "img/like4.jpg");

            $.ajax({
                type: 'get',
                url: 'processLike.ashx',
                data: { 'fid': $(this).attr("data-serviceid1"), 'deleteOrInsert': 0 },
                error: function (err) {
                    alert("錯誤: " + err);
                }
            });


        }
        else {
            $(this).find("img").attr("src", "img/like1.jpg");

            $.ajax({
                type: 'get',
                url: 'processLike.ashx',
                data: { 'fid': $(this).attr("data-serviceid1"), 'deleteOrInsert': 1 },
                error: function (err) {
                    alert("錯誤: " + err);
                }
            });




        }

        return false;
    })

});
