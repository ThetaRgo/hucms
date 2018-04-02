//订单添加页js
function getCookie(name) {
    var r = document.cookie.match("\\b" + name + "=([^;]*)\\b");
    return r ? r[1] : undefined;
}

$(document).ready(function () {
    $("#bill_price").change(function () {
        var bill_qty = $("#bill_qty").val()
        if (isNaN($(this).val())) {
            alert("请正确输入价格")
            $(this).val("")
        }
        if (bill_qty) {
            $("#all_price").html("商品总金额(元): " + bill_qty * $(this).val())
        }
    })
    $("#bill_qty").change(function () {
        var bill_price = $("#bill_price").val()
        if (isNaN($(this).val())) {
            alert("请正确输入数量")
            $(this).val("")
        }
        if (bill_price) {
            $("#all_price").html("商品总金额(元): " + bill_price * $(this).val())
        }
    })
    //输入part_no 及时查询出该编码对应的库存数
    $("#part_no").change(function () {
        var part_no = {part_no: $(this).val()};
        jsonData = JSON.stringify(part_no)
        //     console.log(jsonData)
        $.ajax({
            url: "/api/getinforbypartno",
            type: "POST",
            data: jsonData,
            contentType: "application/json",
            dataType: "json",
            headers: {
                "X-XSRFTOKEN": getCookie("_xsrf"),
            },
            success: function (data) {
                if ("0" == data.errcode) {
                    $("#stock_qty").html("当前库存量:  " + data.stock_qty)
                    if ((data.stock_qty) == '商品编码不存在') {
                        $("#part_no").val("")
                    }
                    return;
                }
                else {
                    return;
                }
            }
        });

    })
    //订单新增
    $("#saveaddbill").click(function (e) {
        e.preventDefault();
        var data = {};
        $(".BillSaveForm").serializeArray().map(function (x) {
            data[x.name] = x.value;
        })
        var jsondata = JSON.stringify(data);
        $.ajax({
            url: "/api/billaddsave",
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
    //订单修改
    $("#saveupdate").click(function (e) {
        e.preventDefault();
        var data = {};
        $(".BillUpdateForm").serializeArray().map(function (x) {
            data[x.name] = x.value;
        })
        var jsondata = JSON.stringify(data);
        $.ajax({
            url: "/api/billupdate",
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
        var zhifu = $(".zhifu").val();
        var stock_out = $(".stock_out").val();

        var get_url = "/billList?part_no=" + part_no + "&zhifu=" + zhifu + "&stock_out=" + stock_out;
        window.location.href = get_url;

    })

})