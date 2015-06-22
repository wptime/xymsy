$(function(){
			var options_array = [
				{ name:"username",type:"mail",simple:"Email",focusMsg:'请填写真实并且最常用的邮箱'},
				//{ name:"username",type:"username",simple:"用户名",focusMsg:'数字和英文及下划线和.的组合，开头为字母，4-20个字符'},
				{ name:"password",type:'password',simple:"密码",focusMsg:'最小长度:6 最大长度:16'},
				//{ name:"phone",type:'telephone',simple:"电话号码",focusMsg:'请填写真实并且最常用的电话号码'},
				//{ name:"yzm",type:'empty'},
				{ name:"password2",type:'eq',to:'password',simple:"确认密码",focusMsg:'请再输入一遍您上面填写的密码'},
				{ name:"agree",message:"请先确定已阅读并完全同意条款内容。"},
				{ name:"nickName",focusMsg:'请输入昵称',message:"请填写昵称"},
				{ name:"check",type:'yzm',simple:"验证码",focusMsg:'4位验证码'}
			];
			$("#testform").valid({
				items:options_array
			});
		});