function testform(form)
{
   if(!document.getElementById) return false;
   username=form.username.value;
   password=form.password.value;
   var errString="";
   if(username==""){
    	errString ="请填写用户名！";
   }
   if(password==""){
    	errString ="请填写密码！";
   }
   if(username==""&&password==""){
      errString = "请填写用户名和密码！"
   }
   if(errString!=""){
    	document.getElementById("caution").style.display="block";
    	document.getElementById("caution1").innerHTML=errString;	
    	return false;
   }
}

function check() {
  var check = document.getElementById("testform");
  check.onsubmit = function() {
    return testform(this);
  }
}

window.onload = check;