<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script> --%>
<style type="text/css">
	a{color: #fff;}
.bdsharebuttonbox a { width: 60px!important; height: 60px!important; margin: 0 auto 10px!important; float: none!important; padding: 0!important; display: block; }
.bdsharebuttonbox a img { width: 60px; height: 60px; }
.bdsharebuttonbox .bds_tsina { background: url(images/gbRes_6.png) no-repeat center center/60px 60px; }
.bdsharebuttonbox .bds_qzone { background: url(images/gbRes_4.png) no-repeat center center/60px 60px; }
.bdsharebuttonbox .bds_tqq { background: url(images/gbRes_5.png) no-repeat center center/60px 60px; }
.bdsharebuttonbox .bds_weixin { background: url(images/gbRes_2.png) no-repeat center center/60px 60px; }
.bdsharebuttonbox .bds_sqq { background: url(images/gbRes_3.png) no-repeat center center/60px 60px; }
.bdsharebuttonbox .bds_renren { background: url(images/gbRes_1.png) no-repeat center center/60px 60px; }
.bd_weixin_popup .bd_weixin_popup_foot { position: relative; top: -12px; }
</style>
</head>
<body>
<div class="kePublic">
	<div class="gb_resLay">
		<div class="gb_res_t"><span>分享到</span><i></i></div>
		<div class="bdsharebuttonbox">
			<ul class="gb_resItms">
				<li><a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin" ></a>微信好友</li>
				<li><a title="分享到QQ好友" href="#" class="bds_sqq" data-cmd="sqq" ></a>QQ好友</li>
				<li><a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone" ></a>QQ空间</li>
				<li><a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq" ></a>腾讯微博</li>
				<li><a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina" ></a>新浪微博</li>
				<li><a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren" ></a>人人网</li>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
</body>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<!-- <script type="text/javascript" src="http://g.alicdn.com/dingding/open-develop/1.9.0/dingtalk.js"></script> -->
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/sha1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/weixinjsdata.js"></script>
<script type="text/javascript">
/* 通过config接口注入权限验证配置(这里需要后台配合操作) */
wx.config({
	debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。		 
    /* appId: 'wxd44e9d16ce2bdb2d', // 必填，公众号的唯一标识	  */
    appId:'wxf50744e61fc05a0f', // 必填，公众号的唯一标识	 
    timestamp:wxdata.wx_account[1] , // 必填，生成签名的时间戳	 
    nonceStr:wxdata.wx_account[2], // 必填，生成签名的随机串	 
    signature:wxdata.wx_account[3],// 必填，签名，见附录1	 
    jsApiList: [
    	'onMenuShareTimeline', 
        'onMenuShareAppMessage' 	
    ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});
alert(wxdata.wx_account[1]);
alert(wxdata.wx_account[2]);
alert(wxdata.wx_account[3]);
/* 通过ready接口处理成功验证 */
wx.ready(function(){
	// config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
});
/* 通过error接口处理失败验证 */
wx.ready(function(res){
	// config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
	console.log(res);
});
/* 配置分享 */
/* $(function(){		
	//发送ajax请求获取api接口
	$.ajax({
		"url":"${pageContext.request.contextPath}/jsapiTcet/getJsapiTcet.do",//微信a'pi接口地址
		"type":"post",
		"dataType":"json",
		"data":{"url":window.location.href},//获取所需分享的连接
		"success":function(data){
			wxstart(data,"");
		}
	}); 
}); */

$("a").on("click",function(){
	//发送ajax请求获取api接口
	$.ajax({
		"url":"${pageContext.request.contextPath}/jsapiTcet/getJsapiTcet.do",//微信a'pi接口地址
		"type":"post",
		"dataType":"json",
		"data":{"url":window.location.href},//获取所需分享的连接
		"success":function(data){
			alert(data);
			wxstart(data,"");
		}
	});
});

//调用分享方法
function wxstart(data,url){
	var url='http://localhost:8080/testWeixinShareDemo/share.jsp';/* //分享的文章地址 */
	var appId=data.appId;//公众号的唯一标识
	var timestamp=data.timestamp;//生成签名的时间戳
	var nonceStr = data.nonceStr;//生成签名的随机串
	var signature = data.signature;//签名，见附录1
	 /*  通过config接口注入权限验证配置 */
	 wx.config({
		 debug:true,// 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，
		 appId:'wxf50744e61fc05a0f',// 必填，公众号的唯一标识
		 timestamp:timestamp,// 必填，生成签名的时间戳
		 nonceStr:nonceStr, // 必填，生成签名的随机串
		 signature:signature,// 必填，签名，见附录1
		 jsApList:["onMenuShareTimeline", "onMenuShareAppMessage", "onMenuShareQQ","onMenuShareWeibo","onMenuShareWeibo","onMenuShareQZone"]  // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	 });
	
	 /* 通过ready接口处理成功验证 */
	 wx.ready(function(){
		 //获取参数
		  var imgurl = '';
    	  var title = '';
    	  var desc = '';

			wx.onMenuShareTimeline({
				title:title,// 分享标题
				desc:desc, // 分享描述
				link:url,// 分享链接
				imgUrl:imgurl,// 分享图标
				success:function(){
					// 用户确认分享后执行的回调函数
					alert("分享成功");
				},
				cancel:function(){
					 // 用户取消分享后执行的回调函数
					 alert("取消分享");
				},
				faile:function(){
					alert(JSON.stringify(res));
				}
			});
			
			/* 分享给朋友 */
			wx.onMenuShareAppMessage({
				titel:title,// 分享标题
				desc:desc,// 分享描述
				link:url,// 分享链接
				imgUrl:imgurl, // 分享图标
				type:'', // 分享类型,music、video或link，不填默认为link
				dataUrl:'',// 如果type是music或video，则要提供数据链接，默认为空
				success:function(){
					 // 用户确认分享后执行的回调函数
					alert('分享给朋友成功'); 
				},
				cancel:function(){
					alert('没有分享给朋友');
				}
			});
			
			//分享到QQ
			wx.onMenuShareQQ({
				titel:title,// 分享标题
				desc:desc,// 分享描述
				link:url,// 分享链接
				imgUrl:imgurl, // 分享图标
				type:'', // 分享类型,music、video或link，不填默认为link
				dataUrl:'',// 如果type是music或video，则要提供数据链接，默认为空
				success:function(){
					 // 用户确认分享后执行的回调函数
					alert('分享给朋友成功'); 
				},
				cancel:function(){
					alert('没有分享给朋友');
				}					
			});
			
			//分享到微博
			wx.onMenuShareWeibo({
				titel:title,// 分享标题
				desc:desc,// 分享描述
				link:url,// 分享链接
				imgUrl:imgurl, // 分享图标
				type:'', // 分享类型,music、video或link，不填默认为link
				dataUrl:'',// 如果type是music或video，则要提供数据链接，默认为空
				success:function(){
					 // 用户确认分享后执行的回调函数
					alert('分享给朋友成功'); 
				},
				cancel:function(){
					alert('没有分享给朋友');
				}		
			});
			
			//分享到qq空间
			wx.onMenuShareQZone({
				titel:title,// 分享标题
				desc:desc,// 分享描述
				link:url,// 分享链接
				imgUrl:imgurl, // 分享图标
				type:'', // 分享类型,music、video或link，不填默认为link
				dataUrl:'',// 如果type是music或video，则要提供数据链接，默认为空
				success:function(){
					 // 用户确认分享后执行的回调函数
					alert('分享给朋友成功'); 
				},
				cancel:function(){
					alert('没有分享给朋友');
				}	
			});				
	 });
}
</script>
</html>
