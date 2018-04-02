//订单添加页js
function getCookie(name) {
    var r = document.cookie.match("\\b" + name + "=([^;]*)\\b");
    return r ? r[1] : undefined;
}

$(document).ready(function () {
    //密码修改
    $("#pwdchange").click(function (e) {
        e.preventDefault();
        if ($("#newPassword").val() !=$("#reNewPassword").val()){
            alert("两次新密码输入的不一致,请重新输入")
            $("#newPassword").val("")
            $("#reNewPassword").val("")
            return;
        }

        var data = {};
        $(".PwdChangeForm").serializeArray().map(function (x) {
            data[x.name] = x.value;
        })
        var jsondata = JSON.stringify(data);
        $.ajax({
            url: "/api/pwdchange",
            type: "POST",
            data: jsondata,
            contentType: "application/json",
            dataType: "json",
            headers: {
                "X-XSRFTOKEN": getCookie("_xsrf"),
            },
            success: function (data) {
                if ("0" == data.errcode) {
                    alert("保存成功!")
                    return;
                }
                else {
                    alert("保存失败," + data["errmsg"])
                }
                return;
            }
        });
    })

})


