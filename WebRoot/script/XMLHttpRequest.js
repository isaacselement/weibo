var xmlhttp;
function verify() {
    var userName = document.getElementById("userName").value;
    // 1、创建XMLHttpRequest对象
    if (window.XMLHttpRequest) {
        // 针对Firefox,Mozillar,Opera,Safari,IE7,IE8
        xmlhttp = new XMLHttpRequest();
        if (xmlhttp.overrideMimeType) {// 解决某些版本的mozilla浏览器在XMLHttpRequest对象接收服务器返回的xml数据会出问题的一个bug而添加
            xmlhttp.overrideMimeType("text/xml");
        }
    } else if (window.ActiveXObject) {
        // 针对IE6，IE5.5，IE5
        var activeName = [ "MSXML2.XMLHTPP", "Microsoft.XMLHTTP" ];
        for (var i = 0; i < activeName.length; i++) {// 尝试创建xmlhttp
            try {
                xmlhttp = new ActiveXObject(activeName[i]);
                break;
            } catch (e) {
            }

        }
    }

    if (!xmlhttp) {
        alert("XMLHttpRequest对象创建失败！");
    } else {
        alert("xmlhttp：" + xmlhttp + "创建成功！");
    }
    // 2、注册回调函数的名字
    xmlhttp.onreadystatechange = callback;

    // 3、设置连接信息
    xmlhttp.open("GET", "ServerHtml?name=" + userName, true);// true表示异步
    // 4、发送数据
    xmlhttp.send(null); // 同步方式下，send这句话会立即完成执行

    // 以post方式传递
    // xmlhttp.open("POST", "ServerHtml?", true);
    // xmlhttp.setRequestHeader("Content-Type",
    // "application/x-www-form-urlencoded");// 设置请求头
    // xmlhttp.send("name=" + userName);
}
function callback() {
    // alert(xmlhttp.readyState);
    // 判断对象状态是否交互完成
    if (xmlhttp.readyState == 4) {
        // 判断服务器返回的数据是否成功
        if (xmlhttp.status == 200) {
            var responseText = xmlhttp.responseText;

            var divNode = document.getElementById("result");
            divNode.innerHTML = responseText;
        }
    }
}