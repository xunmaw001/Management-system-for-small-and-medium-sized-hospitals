<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>注册</title>
		<!-- bootstrap样式，地图插件使用 -->
		<link rel="stylesheet" href="../../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		html::after {
			position: fixed;
			top: 0;
			right: 0;
			left: 0;
			bottom: 0;
			content: '';
			display: block;
			background-attachment: fixed;
			background-size: cover;
			background-position: center;
			background-image: url(http://codegen.caihongy.cn/20220307/4c32f993aaa34fadbde3791f33f83669.png);
			z-index: -1;
		}
		#swiper {
			overflow: hidden;
			margin: 0 auto;
		}
		#swiper .layui-carousel-ind li {
			width: 16px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 3px;
			background-color: #f7f7f7;
			box-shadow: 0 0 6px rgba(110,22,64,.8);
		}
		#swiper .layui-carousel-ind li.layui-this {
			width: 24px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 0;
			background-color: rgba(110,22,64,1);
			box-shadow: 0 0 6px rgba(110,22,64,.8);
		}
		
		button, button:focus {
			outline: none;
		}
		
		.data-add-container .add .layui-select-title .layui-unselect {
			padding: 0 12px;
			height: 40px;
			font-size: 14px;
			color: #333;
			border-radius: 4px;
			border-width: 1px;
			border-style: solid;
			border-color: rgba(209, 209, 209, 1);
			background-color: #fff;
			box-shadow: 0 0 0px rgba(110,22,64,.8);
			text-align: left;
		}
		.data-add-container .add .layui-form-item {
			display: flex;
			align-items: center;
			justify-content: center;
		}
		.data-add-container .layui-form-pane .layui-form-item[pane] .layui-form-label {
			margin: 0;
			position: inherit;
			background: transparent;
			border: 0;
		}
		.data-add-container .add .layui-input-block {
			margin: 0;
			flex: 1;
		}
		.data-add-container .layui-form-pane .layui-form-item[pane] .layui-input-inline {
			margin: 0;
			flex: 1;
			display: flex;
		}
	</style>
	<body>


		<div id="app">
		
			<!-- 轮播图 -->
			<!-- <div class="layui-carousel" id="swiper">
				<div carousel-item id="swiper-item">
					<div v-for="(item,index) in swiperList" v-bind:key="index">
						<img class="swiper-item" :src="item.img">
					</div>
				</div>
			</div> -->
			<div class="layui-carousel" id="swiper" :style='{"boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"0 auto","borderColor":"rgba(0,0,0,.3)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid"}'>
			  <div carousel-item id="swiper-item">
				<div v-for="(item,index) in swiperList" :key="index">
					<img style="width: 100%;height: 100%;object-fit:cover;" :src="item.img" />
				</div>
			  </div>
			</div>
			<!-- 轮播图 -->
		
			<div class="data-add-container">
		
				<form class="layui-form layui-form-pane" lay-filter="myForm">
					
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">住院编号：</label>
						<div class="layui-input-block">
							<input v-model="detail.zhuyuanbianhao" type="text" :readonly="ro.zhuyuanbianhao" name="zhuyuanbianhao" id="zhuyuanbianhao" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">病房编号：</label>
						<div class="layui-input-block">
							<input v-model="detail.bingfangbianhao" type="text" :readonly="ro.bingfangbianhao" name="bingfangbianhao" id="bingfangbianhao" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">床位号：</label>
						<div class="layui-input-block">
							<input v-model="detail.chuangweihao" type="text" :readonly="ro.chuangweihao" name="chuangweihao" id="chuangweihao" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
		                <label class="layui-form-label">科室名称</label>
		                <div class="layui-input-block">
		                    <select name="keshimingcheng" id="keshimingcheng" lay-filter="keshimingcheng"  >
		                        <option value="">请选择</option>
		                        <option v-for="(item,index) in keshimingcheng" v-bind:key="index" :value="item">{{item}}</option>
		                    </select>
		                </div>
		            </div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">科室类型：</label>
						<div class="layui-input-block">
							<input v-model="detail.keshileixing" type="text" :readonly="ro.keshileixing" name="keshileixing" id="keshileixing" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">医生账号：</label>
						<div class="layui-input-block">
							<input v-model="detail.yishengzhanghao" type="text" :readonly="ro.yishengzhanghao" name="yishengzhanghao" id="yishengzhanghao" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">医生姓名：</label>
						<div class="layui-input-block">
							<input v-model="detail.yishengxingming" type="text" :readonly="ro.yishengxingming" name="yishengxingming" id="yishengxingming" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
		                <label class="layui-form-label">用户账号</label>
		                <div class="layui-input-block">
		                    <select name="yonghuzhanghao" id="yonghuzhanghao" lay-filter="yonghuzhanghao"  >
		                        <option value="">请选择</option>
		                        <option v-for="(item,index) in yonghuzhanghao" v-bind:key="index" :value="item">{{item}}</option>
		                    </select>
		                </div>
		            </div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">用户姓名：</label>
						<div class="layui-input-block">
							<input v-model="detail.yonghuxingming" type="text" :readonly="ro.yonghuxingming" name="yonghuxingming" id="yonghuxingming" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">性别：</label>
						<div class="layui-input-block">
							<input v-model="detail.xingbie" type="text" :readonly="ro.xingbie" name="xingbie" id="xingbie" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">年龄：</label>
						<div class="layui-input-block">
							<input v-model="detail.nianling" type="text" :readonly="ro.nianling" name="nianling" id="nianling" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">登记时间：</label>
						<div class="layui-input-block">
							<input type="text" name="dengjishijian" id="dengjishijian" autocomplete="off" class="layui-input" >
						</div>
					</div>
		            
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">入住原因：</label>
						<div class="layui-input-block">
							<textarea name="ruzhuyuanyin" id="ruzhuyuanyin">请输入入住原因</textarea>
						</div>
					</div>
		
					<div class="layui-form-item">
						<div class="layui-input-block" style="text-align: right;margin-right: 30px;">
							<button  class="layui-btn btn-submit" lay-submit lay-filter="*">提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<script src="../../layui/layui.js"></script>
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<!-- 校验格式工具类 -->
		<script src="../../js/validate.js"></script>
		<!-- 地图 -->
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=ca04cee7ac952691aa67a131e6f0cee0"></script>
		<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../../js/bootstrap.AMapPositionPicker.js"></script>

		<script>
			var jquery = $;
			
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					baseurl: '',
					dataList: [],
					ro:{
                                        zhuyuanbianhao : false,
                                        bingfangbianhao : false,
                                        chuangweihao : false,
                                        keshimingcheng : false,
                                        keshileixing : false,
                                        yishengzhanghao : false,
                                        yishengxingming : false,
                                        yonghuzhanghao : false,
                                        yonghuxingming : false,
                                        xingbie : false,
                                        nianling : false,
                                        dengjishijian : false,
                                        ruzhuyuanyin : false,
					},
                    detail: {
                        zhuyuanbianhao: genTradeNo(),
                        bingfangbianhao: genTradeNo(),
                        chuangweihao: '',
                        keshimingcheng: '',
                        keshileixing: '',
                        yishengzhanghao: '',
                        yishengxingming: '',
                        yonghuzhanghao: '',
                        yonghuxingming: '',
                        xingbie: '',
                        nianling: '',
                        dengjishijian: '',
                        ruzhuyuanyin: '',
                    },
					keshimingcheng: [],
					yonghuzhanghao: [],
					centerMenu: centerMenu
				},
				updated: function() {
					layui.form.render('select', 'myForm');
				},
                computed: {
                },
				methods: {
					jump(url) {
						jump(url)
					}
				}
			})


			layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload', 'laydate','tinymce'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				var form = layui.form;
				var upload = layui.upload;
				var laydate = layui.laydate;
				var tinymce = layui.tinymce;
				vue.baseurl = http.baseurl;

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						var swiperItemHtml = '';
						for (let item of res.data.list) {
							if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
								swiperItemHtml +=
									'<div>' +
									'<img style="width: 100%;height: 100%;object-fit:cover;" class="swiper-item" src="' + http.baseurl+item.value + '">' +
									'</div>';
							}
						}
						jquery('#swiper-item').html(swiperItemHtml);
						// 轮播图
						vue.$nextTick(() => {
						  carousel.render({
						  	elem: '#swiper',
							width: '100%',
						  	height: '300px',
						  	arrow: 'hover',
						  	anim: 'default',
						  	autoplay: 'true',
						  	interval: '3000',
						  	indicator: 'none'
						  });
						
						})
					}
				});

				http.request(`option/menzhenxinxi/keshimingcheng`,'get',{},(res)=>{
					vue.keshimingcheng = res.data
				});
				form.on('select(keshimingcheng)', (data) => {
					console.log(data.value);
					http.request('follow/menzhenxinxi/keshimingcheng', 'get', {
						columnValue: data.value
					}, function(res) {
						vue.detail.keshimingcheng=res.data.keshimingcheng
						vue.detail.keshileixing=res.data.keshileixing
						vue.detail.yonghuxingming=res.data.yonghuxingming
						vue.detail.xingbie=res.data.xingbie
						vue.detail.nianling=res.data.nianling
					})
				});
				http.request(`option/yonghu/yonghuzhanghao`,'get',{},(res)=>{
					vue.yonghuzhanghao = res.data
				});
				form.on('select(yonghuzhanghao)', (data) => {
					console.log(data.value);
					http.request('follow/yonghu/yonghuzhanghao', 'get', {
						columnValue: data.value
					}, function(res) {
						vue.detail.yonghuzhanghao=res.data.yonghuzhanghao
						vue.detail.keshileixing=res.data.keshileixing
						vue.detail.yonghuxingming=res.data.yonghuxingming
						vue.detail.xingbie=res.data.xingbie
						vue.detail.nianling=res.data.nianling
					})
				});
                                jquery('#dengjishijian').val(getCurDate());
				laydate.render({
					elem: '#dengjishijian'
				});
                var edit = tinymce.render({
                    elem: "#ruzhuyuanyin",
                    height: 600,
                    images_upload_handler: function(blobInfo, succFun, failFun) {
                        var xhr, formData;
                        var file = blobInfo.blob(); //转化为易于理解的file对象
                        xhr = new XMLHttpRequest();
                        xhr.withCredentials = false;
                        xhr.open('POST', http.baseurl + 'file/upload');
                        xhr.setRequestHeader("Token", localStorage.getItem('Token')); //设置请求头
                        xhr.onload = function() {
                            var json;
                            if (xhr.status != 200) {
                                failFun('HTTP Error: ' + xhr.status);
                                return;
                            }
                            json = JSON.parse(xhr.responseText);
                            if (!json || typeof json.file != 'string') {
                                failFun('Invalid JSON: ' + xhr.responseText);
                                return;
                            }
                            succFun(http.baseurl + '/upload/' + json.file);
                        };
                        formData = new FormData();
                        formData.append('file', file, file.name); //此处与源文档不一样
                        xhr.send(formData);
                    }
                }, (opt) => {

                });
				
                // session独取
				let table = localStorage.getItem("userTable");
				http.request(`${table}/session`, 'get', {}, function(data) {
					// 表单赋值
					//form.val("myForm", data.data);
					data = data.data
					for(var key in data){
                        if(key=='yishengzhanghao'){
                                vue.detail['yishengzhanghao'] = data[`${key}`]
                                vue.ro.yishengzhanghao = true;
                                continue;
                        }
                        if(key=='yishengxingming'){
                                vue.detail['yishengxingming'] = data[`${key}`]
                                vue.ro.yishengxingming = true;
                                continue;
                        }
					}
				});

                // 跨表计算
                if(http.getParam('corss')){
					var obj = JSON.parse(localStorage.getItem('crossObj'));
					//form.val("myForm", obj);
					for(var o in obj){
                                        if(o=='zhuyuanbianhao'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.zhuyuanbianhao = true;
                                                continue;
                                        }
                                        if(o=='bingfangbianhao'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.bingfangbianhao = true;
                                                continue;
                                        }
                                        if(o=='chuangweihao'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.chuangweihao = true;
                                                continue;
                                        }
                                        if(o=='keshimingcheng'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.keshimingcheng = true;
                                                continue;
                                        }
                                        if(o=='keshileixing'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.keshileixing = true;
                                                continue;
                                        }
                                        if(o=='yishengzhanghao'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.yishengzhanghao = true;
                                                continue;
                                        }
                                        if(o=='yishengxingming'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.yishengxingming = true;
                                                continue;
                                        }
                                        if(o=='yonghuzhanghao'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.yonghuzhanghao = true;
                                                continue;
                                        }
                                        if(o=='yonghuxingming'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.yonghuxingming = true;
                                                continue;
                                        }
                                        if(o=='xingbie'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.xingbie = true;
                                                continue;
                                        }
                                        if(o=='nianling'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.nianling = true;
                                                continue;
                                        }
                                        if(o=='dengjishijian'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.dengjishijian = true;
                                                jquery('#dengjishijian').val(obj[o]);
                                                continue;
                                        }
                                        if(o=='ruzhuyuanyin'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.ruzhuyuanyin = true;
                                                continue;
                                        }
					}
				}
				

				// 提交
				form.on('submit(*)', function(data) {
					data = data.field;
					
                    // 数据校验
					var ruzhuyuanyin = tinymce.get('#ruzhuyuanyin').getContent()
					data.ruzhuyuanyin = ruzhuyuanyin;

					// 跨表计算判断
					
                    // 比较大小

                //更新跨表属性
               var crossuserid;
               var crossrefid;
               var crossoptnum;
                if(http.getParam('corss')){
                        var statusColumnName = localStorage.getItem('statusColumnName');
                        var statusColumnValue = localStorage.getItem('statusColumnValue');
                        if(statusColumnName!='') {
                                var obj = JSON.parse(localStorage.getItem('crossObj'));
				if(!statusColumnName.startsWith("[")) {
					for (var o in obj){
						if(o==statusColumnName){
							obj[o] = statusColumnValue;
						}
					}
					var table = localStorage.getItem('crossTable');
					http.requestJson(`${table}/update`,'post',obj,(res)=>{});
				} else {
                                       crossuserid=Number(localStorage.getItem('userid'));
                                       crossrefid=obj['id'];
                                       crossoptnum=localStorage.getItem('statusColumnName');
                                       crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
				}
                        }
                }
                        if(crossrefid && crossuserid) {
                                data.crossuserid=crossuserid;
                                data.crossrefid=crossrefid;
                                http.request('zhuyuandengji/list', 'get', {
                                        page: 1,
                                        limit: 10,
                                        crossuserid:crossuserid,
                                        crossrefid:crossrefid,
                                }, function(res) {
                                        if(res.data.total>=crossoptnum) {
                                                layer.msg(localStorage.getItem('tips'), {
                                                        time: 2000,
                                                        icon: 6
                                                })
                                             return false;
                                        } else {
                                            // 跨表计算



                                            // 提交数据
                                            http.requestJson('zhuyuandengji' + '/add', 'post', data, function(res) {
                                                    layer.msg('提交成功', {
                                                            time: 2000,
                                                            icon: 6
                                                    }, function() {
                                                            back();
                                                    });
                                             });
                                        }
                                });
                        } else {
                                // 跨表计算

                                // 提交数据
                                http.requestJson('zhuyuandengji' + '/add', 'post', data, function(res) {
                                        layer.msg('提交成功', {
                                                time: 2000,
                                                icon: 6
                                        }, function() {
                                                back();
                                        });
                                 });
                        }
			return false
			});
		});
		</script>
	</body>
</html>
