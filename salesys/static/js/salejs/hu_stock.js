//订单添加页js
function getCookie(name) {
    var r = document.cookie.match("\\b" + name + "=([^;]*)\\b");
    return r ? r[1] : undefined;
}

$(document).ready(function () {

    //库存新增
    $("#saveaddstock").click(function (e) {
        e.preventDefault();
        var data = {};
        $(".StockSaveForm").serializeArray().map(function (x) {
            data[x.name] = x.value;
        })
        var jsondata = JSON.stringify(data);
        $.ajax({
            url: "/api/stockaddsave",
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
    //库存修改
    $("#saveupdate").click(function (e) {
        e.preventDefault();
        var data = {};
        $(".StockUpdateForm").serializeArray().map(function (x) {
            data[x.name] = x.value;
        })
        var jsondata = JSON.stringify(data);
        $.ajax({
            url: "/api/stockupdate",
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
//   查询按钮get请求发送
    $("#chaxun").click(function (e) {
        var part_no = $(".part_no").val();

        var get_url = "/stockList?part_no=" + part_no;
        window.location.href = get_url;

    })

})



function deletestock(obj) {
    if (confirm('确实要删除该内容吗?')){
        var json_str={"part_no":$(obj).attr("part_no")}
        jsondata=JSON.stringify(json_str)
        $.ajax({
            url:"/api/stockdelete",
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