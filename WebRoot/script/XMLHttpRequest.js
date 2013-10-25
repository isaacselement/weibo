var xmlhttp;
function verify() {
    var userName = document.getElementById("userName").value;
    // 1������XMLHttpRequest����
    if (window.XMLHttpRequest) {
        // ���Firefox,Mozillar,Opera,Safari,IE7,IE8
        xmlhttp = new XMLHttpRequest();
        if (xmlhttp.overrideMimeType) {// ���ĳЩ�汾��mozilla�������XMLHttpRequest������շ��������ص�xml���ݻ�������һ��bug�����
            xmlhttp.overrideMimeType("text/xml");
        }
    } else if (window.ActiveXObject) {
        // ���IE6��IE5.5��IE5
        var activeName = [ "MSXML2.XMLHTPP", "Microsoft.XMLHTTP" ];
        for (var i = 0; i < activeName.length; i++) {// ���Դ���xmlhttp
            try {
                xmlhttp = new ActiveXObject(activeName[i]);
                break;
            } catch (e) {
            }

        }
    }

    if (!xmlhttp) {
        alert("XMLHttpRequest���󴴽�ʧ�ܣ�");
    } else {
        alert("xmlhttp��" + xmlhttp + "�����ɹ���");
    }
    // 2��ע��ص�����������
    xmlhttp.onreadystatechange = callback;

    // 3������������Ϣ
    xmlhttp.open("GET", "ServerHtml?name=" + userName, true);// true��ʾ�첽
    // 4����������
    xmlhttp.send(null); // ͬ����ʽ�£�send��仰���������ִ��

    // ��post��ʽ����
    // xmlhttp.open("POST", "ServerHtml?", true);
    // xmlhttp.setRequestHeader("Content-Type",
    // "application/x-www-form-urlencoded");// ��������ͷ
    // xmlhttp.send("name=" + userName);
}
function callback() {
    // alert(xmlhttp.readyState);
    // �ж϶���״̬�Ƿ񽻻����
    if (xmlhttp.readyState == 4) {
        // �жϷ��������ص������Ƿ�ɹ�
        if (xmlhttp.status == 200) {
            var responseText = xmlhttp.responseText;

            var divNode = document.getElementById("result");
            divNode.innerHTML = responseText;
        }
    }
}