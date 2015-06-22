/*添加商品<--*/

function addImg() {

  var para = document.createElement("div");
  var add = document.getElementById("pho");
  add.appendChild(para);
  var photo = document.createElement("input");
  photo.setAttribute("type", "file");
  photo.setAttribute("name", "photo");
  photo.setAttribute("onchange", "c(this)");
  para.appendChild(photo);
  var img = document.createElement("a");
  img.style.margin = "0 0 0 5px";
  img.setAttribute("href", "javascript:;");
  img.setAttribute("onclick", "this.parentNode.remove(this)");
  var txt = document.createTextNode("[-]");
  img.appendChild(txt);
  para.appendChild(img);
}

UpLoadFileCheck = function() {
  this.AllowExt = ".jpg,.bmp,.png,.jpeg"; //允许上传的文件类型 0为无限制 每个扩展名后边要加一个"," 小写字母表示 
  this.AllowImgFileSize = 200; //允许上传文件的大小 0为无限制 单位：KB 
  this.AllowImgWidth = 0; //允许上传的图片的宽度 0为无限制　单位：px(像素) 
  this.AllowImgHeight = 0; //允许上传的图片的高度 0为无限制　单位：px(像素)
  this.ImgObj = new Image();
  this.ImgFileSize = 0;
  this.ImgWidth = 0;
  this.ImgHeight = 0;
  this.FileExt = "";
  this.ErrMsg = "";
  this.IsImg = false; //全局变量
}

UpLoadFileCheck.prototype.CheckExt = function(obj) {
  this.ErrMsg = "";
  this.ImgObj.src = obj.value;
  //this.HasChecked=false; 
  if (obj.value == "") {
    this.ErrMsg = "\n请选择一个文件";
  } else {
    this.FileExt = obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();
    if (this.AllowExt != 0 && this.AllowExt.indexOf(this.FileExt) == -1) //判断文件类型是否允许上传 
    {
      this.ErrMsg = "\n该文件类型不允许上传。请上传 " + this.AllowExt + " 类型的文件，当前文件类型为" + this.FileExt;
      obj.value = "";
    }
  }
  if (this.ErrMsg != "") {
    this.ShowMsg(this.ErrMsg, false);
    return false;
  } else
    return this.CheckProperty(obj);
}

UpLoadFileCheck.prototype.CheckProperty = function(obj) {
  if (this.ImgObj.readyState != "complete") //
  {
    sleep(1000); //一秒使用图能完全加载 
  }

  if (this.IsImg == true) {
    this.ImgWidth = this.ImgObj.width; //取得图片的宽度 
    this.ImgHeight = this.ImgObj.height; //取得图片的高度
    if (this.AllowImgWidth != 0 && this.AllowImgWidth < this.ImgWidth)
      this.ErrMsg = this.ErrMsg + "\n图片宽度超过限制。请上传宽度小于" + this.AllowImgWidth + "px的文件，当前图片宽度为" + this.ImgWidth + "px";

    if (this.AllowImgHeight != 0 && this.AllowImgHeight < this.ImgHeight)
      this.ErrMsg = this.ErrMsg + "\n图片高度超过限制。请上传高度小于" + this.AllowImgHeight + "px的文件，当前图片高度为" + this.ImgHeight + "px";
  }

  this.ImgFileSize = Math.round(this.ImgObj.fileSize / 1024 * 100) / 100; //取得图片文件的大小 
  if (this.AllowImgFileSize != 0 && this.AllowImgFileSize < this.ImgFileSize)
    this.ErrMsg = this.ErrMsg + "\n文件大小超过限制。请上传小于" + this.AllowImgFileSize + "KB的文件，当前文件大小为" + this.ImgFileSize + "KB";
  obj.value = "";
  if (this.ErrMsg != "") {
    this.ShowMsg(this.ErrMsg, false);
    return false;
  } else
    return true;
}

UpLoadFileCheck.prototype.ShowMsg = function(msg, tf) //显示提示信息 tf=false 显示错误信息 msg-信息内容 
{

  alert(msg);
}

function sleep(num) {
  var tempDate = new Date();
  var tempStr = "";
  var theXmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  while ((new Date() - tempDate) < num) {
    tempStr += "\n" + (new Date() - tempDate);
    try {
      theXmlHttp.open("get", "about:blank?JK=" + Math.random(), false);
      theXmlHttp.send();
    } catch (e) {;
    }
  }
  //containerDiv.innerText=tempStr; 
  return;
}

function c(obj) {
  var d = new UpLoadFileCheck();
  d.IsImg = true;
  d.AllowImgFileSize = 160;
  d.CheckExt(obj)
}

function add() {

  var para = document.createElement("div");
  var add = document.getElementById("addtitle");
  add.appendChild(para);
  var title = document.createElement("input");
  title.setAttribute("type", "text");
  title.setAttribute("name", "title");
  para.appendChild(title);
  var img = document.createElement("a");
  img.style.margin = "0 0 0 5px";
  img.setAttribute("href", "javascript:;");
  img.setAttribute("onclick", "this.parentNode.remove(this)");
  var txt = document.createTextNode("[-]");
  img.appendChild(txt);
  para.appendChild(img);
}

/*添加商品 商品分类*/
//若一级菜单没选中则不显示二级菜单
if($(".kind p").html()=='--请选择--')
 $(".kind-1 p").hide();
//kind-title显示选中项
$(".kinded li").click(function(){
  var tit = $(this).html();
  $(".kind-1 p").show();
  $(".kind-1").css("display","block");
  $(this).parent().parent().children("p")
  .html(tit);
});
//鼠标经过显示下拉菜单
$(".kind,.kind-1").mouseenter(function(){
  $(this).children(".showul").show();
}).mouseleave(function(){
  $(this).children(".showul").hide();
});
//选择一级菜单内容，二级菜单显示
$(".kd").click(function(){
  $(this).parent().parent().next()
  .children("p").html("--请选择--")
  .parent().find("ul").eq( $(this).index())
  .addClass("showul")
  .show()
  .siblings("ul").removeClass("showul")
  .hide();
});




/*买家中心*/
/*$('.SC_addgoods').click(function(){
              $('.warpper-middle').html();
              $('.warpper-middle').load('SC_addgoods.jsp');
          });*/
         /* $('.selled').click(function(){
            $('.warpper-addgoods').css("display","none");
            $('.warpper-other').css("display","block");
              $('.warpper-other').html();
              $('.warpper-other').load('SC_selled.jsp');
          });
          $('.selling').click(function(){
            $('.warpper-addgoods').css("display","none");
            $('.warpper-other').css("display","block");
              $('.warpper-other').html();
              $('.warpper-other').load('SC_selling.jsp');
          });
          $('.keeping').click(function(){
            $('.warpper-addgoods').css("display","none");
            $('.warpper-other').css("display","block");
              $('.warpper-other').html();
              $('.warpper-other').load('SC_keeping.jsp');
          });
        $('.addgoods').click(function(){
            $('.warpper-addgoods').css("display","block");
            $('.warpper-other').css("display","none");
          });*/

