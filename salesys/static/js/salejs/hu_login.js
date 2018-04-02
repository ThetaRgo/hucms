function getCookie(name) {
    var r = document.cookie.match("\\b" + name + "=([^;]*)\\b");
    return r ? r[1] : undefined;
}

$(document).ready(function(){
    $(".loginForm").submit(function(e){
        e.preventDefault();
        var data={};
        $(".loginForm").serializeArray().map(function(x){data[x.name]=x.value;})
        var jsondata=JSON.stringify(data);
        $.ajax({
            url:"/api/login",
            type:"POST",
            data: jsondata,
            contentType: "application/json",
            dataType: "json",
            headers:{
                "X-XSRFTOKEN":getCookie("_xsrf"),
            },
            success: function (data) {
                if ("0" == data.errcode) {
                    location.href = "/index";
                    return;
                }
                else {
                    alert("用户名或者密码错误")
                    return;
                     }

                }
            });
        });
})