function getCookie(name) {
    var r = document.cookie.match("\\b" + name + "=([^;]*)\\b");
    return r ? r[1] : undefined;
}
//
// //供应商管理页面上点击删除按钮弹出删除框(stockList.html)
// $(function () {
//     $('.removestock').click(function () {
//         $("#msg_info").html("are you sure")
//         $('.zhezhao').css('display', 'block');
//         $('#removeProv').fadeIn();
//     });
// });
//
// $(function () {
//     $('#no').click(function () {
//         $('.zhezhao').css('display', 'none');
//         $('#removeProv').fadeOut();
//     });
// });
//



// //订单管理页面上点击删除按钮弹出删除框(billList.html)
// $(function () {
//     $('.removeBill').click(function () {
//         $("#msg_info").html("are you sure")
//         $('.zhezhao').css('display', 'block');
//         $('#removeBi').fadeIn();
//         alert($(this).attr("clstag"))
//     });
// });
//
// $(function () {
//     $('#no').click(function () {
//         $('.zhezhao').css('display', 'none');
//         $('#removeBi').fadeOut();
//     });
//     return "no"
// });
//
// $(function () {
//     $('#yes').click(function () {
//         $('.zhezhao').css('display', 'none');
//         $('#removeBi').fadeOut();
//         return "yes"
//
//     });
// });
//
//
// //用户管理页面上点击删除按钮弹出删除框(userList.html)
// $(function () {
//     $('.removeUser').click(function () {
//         $('.zhezhao').css('display', 'block');
//         $('#removeUse').fadeIn();
//     });
// });
//
// $(function () {
//     $('#no').click(function () {
//         $('.zhezhao').css('display', 'none');
//         $('#removeUse').fadeOut();
//     });
// });

function deletebill(obj) {
    if (confirm('确实要删除该内容吗?')){
        var json_str={"bill_id":$(obj).attr("bill_id")}
        jsondata=JSON.stringify(json_str)
        $.ajax({
            url:"/api/billdelete",
            type:"POST",
            data: jsondata,
            contentType: "application/json",
            dataType: "json",
            headers:{
                "X-XSRFTOKEN":getCookie("_xsrf"),
            },
            success: function (data) {
                if ("0" == data.errcode) {
                    location.reload();
                    return;
                }
                else {
                    alert("删除失败"+data.errmsg)
                    return;
                }
            }
        })
    }
}