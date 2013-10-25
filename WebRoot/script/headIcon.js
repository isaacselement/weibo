//������ѹ����ʾͼƬ
function AutoResizeImage(maxWidth, maxHeight, objImg) {
	var img = new Image();
	img.src = objImg.src;
	var hRatio;
	var wRatio;
	var Ratio = 1;
	var w = img.width;
	var h = img.height;
	if (w > 152 && h > 152) {

		wRatio = maxWidth / w;
		hRatio = maxHeight / h;
		if (maxWidth == 0 && maxHeight == 0) {
			Ratio = 1;
		} else if (maxWidth == 0) {//
			if (hRatio < 1)
				Ratio = hRatio;
		} else if (maxHeight == 0) {
			if (wRatio < 1)
				Ratio = wRatio;
		} else if (wRatio < 1 || hRatio < 1) {
			Ratio = (wRatio <= hRatio ? wRatio : hRatio);
		}
		if (Ratio < 1) {
			document.getElementById('rate').value = Ratio;
			w = w * Ratio;
			h = h * Ratio;
		}
		objImg.height = h;
		objImg.width = w;
	}
}

// Our simple event handler, called from onChange and onSelect
// event handlers, as per the Jcrop invocation above
function showCoords(c) {
	jQuery('#x').val(c.x);
	jQuery('#y').val(c.y);
	jQuery('#x2').val(c.x2);
	jQuery('#y2').val(c.y2);
	jQuery('#w').val(c.w);
	jQuery('#h').val(c.h);
};

// ����ie,firefox��ʾͼƬ
var isIE = false;
var isFF = false;
var isSa = false;

if ((navigator.userAgent.indexOf("MSIE") > 0)
		&& (parseInt(navigator.appVersion) >= 4))
	isIE = true;
if (navigator.userAgent.indexOf("Firefox") > 0)
	isFF = true;
if (navigator.userAgent.indexOf("Safari") > 0)
	isSa = true;

function showimg(obj) {

	var path;
	var reg = new RegExp("\.(JPG|JPEG|jpg|jpeg)+$");// ��֤�ļ��ĸ�ʽ
	if (isFF) {
		path = obj.files.item(0).getAsDataURL();// ע�⣺��firefox��ͨ��
		// obj.files.item(0).getAsDataURL()
		// ��ȡinput�е�����·����
		// ����obj.value ֻ����ʾ�ļ����������ļ�·��
		if (obj.value.match(reg)) {
			document.getElementById('cropbox').src = path;
		} else {
			alert('�Բ���,Ŀǰֻ֧Ŀǰֻ֧��jpg��ʽ��');
		}
	} else if (isIE) {
		document.getElementById("cropbox").src = document.getElementById("pic").value;
	}

	jQuery('#cropbox').Jcrop( {
		aspectRatio : 1,
		onChange : showCoords,
		onSelect : showCoords
	});
}