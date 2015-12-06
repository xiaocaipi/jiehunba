<#import "/manage/tpl/pageBase.ftl" as page/>
<@page.pageBase currentMenu=(e.type=="p")?string("商品目录","文章分类")>
<script type="text/javascript">

KindEditor.ready(function(K) {
	var editor = K.editor({
		fileManagerJson : '${basepath}/resource/kindeditor-4.1.7/jsp/file_manager_json.jsp'
	});
	K('input[name=filemanager]').click(function() {
		var imagesInputObj = $(this).parent().children("input[ccc=imagesInput]");
		editor.loadPlugin('filemanager', function() {
			editor.plugin.filemanagerDialog({
				viewType : 'VIEW',
				dirName : 'image',
				clickFn : function(url, title) {
					//K('#picture').val(url);
					//alert(url);
					imagesInputObj.val(url);
					editor.hideDialog();
					clearRootImagePath(imagesInputObj);//$("#picture"));
				}
			});
		});
	});
	
});

	$(function() {
		$("#title").focus();
		//$('#cc').combotree('setValue', "随遇而安随遇而安随遇而安随遇而安随遇而安");
	});

	function onSubmit() {
		//if($("#pid").val()==''){
			//var t = $('#cc').combotree('tree');	// get the tree object
			//var n = t.tree('getSelected');		// get selected node
			//if(!n || !n.id){
				//alert("请选择父亲类别");
				//return false;
			//}
			//$("#pid").val(n.id);
		//}
		
		if ($.trim($("#name").val()) == "") {
			alert("名称不能为空!");
			$("#title").focus();
			return false;
		}
	}
</script>
	<form action="${basepath}/manage/catalog" theme="simple" id="form" name="form" enctype="multipart/form-data">
		<input id="catalogID" value="${e.pid!""}" style="display: none;"/>
		<input id="catalogID_currentID" value="${e.id!""}" style="display: none;"/>
		<input type="hidden" value="${e.type!""}" name="type" id="type"/>
		
		<table class="table table-bordered" style="width: 95%;margin: auto;">
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>编辑分类</strong>
					
					<#if e.type?? && e.type=="p">
						<span class="badge badge-important">商品分类</span>&nbsp;<strong>
					<#else>
						<span class="badge badge-success">文章分类</span>&nbsp;<strong>
					</#if>
				</td>
			</tr>
			<tr style="display: none;">
				<td>id</td>
				<td><input type="hidden" value="${e.id!""}" name="id" label="id" /></td>
			</tr>
				<tr>
				<td style="text-align: right;">大类</td>
				<td style="text-align: left;">
					<select onchange="catalogChange(this)" name="pid" id="catalogSelect">
						<option></option>
                        <#list catalogs as item>
							<option pid="0" value="${item.id!""}"><font color='red'>${item.name!""}</font></option>
                            <#if item.children??>
                                <#list item.children as item>
                                    <option value="${item.id!""}">&nbsp;&nbsp;&nbsp;&nbsp;${item.name!""}</option>
                                </#list>
                            </#if>
                        </#list>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">名称</td>
				<td style="text-align: left;"><input type="text"  value="${e.name!""}" name="name"  id="name" data-rule="名称;required;name;" size="20" maxlength="20"
						/></td>
			</tr>
			<tr>
				<td style="text-align: right;">编码</td>
				<td style="text-align: left;">
<!-- 							<input type="button" onclick="getCode()" value="自动获取" class="btn btn-default"/> -->
					<input type="text"  value="${e.code!""}" name="code"  data-rule="编码;required;code;length[1~45];remote[uniqueCode, id]" size="45" maxlength="45" id="code" /></td>
<#--<%-- 						<td style="text-align: left;"><input type="text"  value="${e.code!""}" name="code"  data-rule="编码;required;code;" size="20" maxlength="20" id="code" /></td> --%>-->
			</tr>
			<tr>
				<td style="text-align: right;">顺序</td>
				<td style="text-align: left;"><input type="text"  value="${e.order1!""}" name="order1"  data-rule="顺序;required;integer;order1;" size="20" maxlength="20"
						id="order1" /></td>
			</tr>
			<tr>
				<th>图片地址</th>
				<td style="text-align: left;" colspan="3">
					<input type="button" name="filemanager" value="浏览图片" class="btn btn-warning"/>
					<input type="text"  value="${e.picture!""}" name="picture"  id="picture" ccc="imagesInput" style="width: 600px;" data-rule="图片地址:required;picture;" />
					<#if e.picture??>
						<a target="_blank" href="${systemSetting().imageRootPath}/..${e.picture!""}">
							<img style="max-width: 50px;max-height: 50px;" alt="" src="${systemSetting().imageRootPath}/..${e.picture!""}">
						</a>
					</#if>
				</td>
			</tr>
			
			<#if e.type??&&e.type=="p">
				<tr>
					<td style="text-align: right;">是否在导航条显示</td>
					<td style="text-align: left;">
                        <#assign map = {'n':'否','y':'是'}>
                        <select id="showInNav" name="showInNav" class="input-medium">
                            <#list map?keys as key>
                                <option value="${key}" <#if e.showInNav?? && e.showInNav==key>selected="selected" </#if>>${map[key]}</option>
                            </#list>
                        </select>
					</td>
				</tr>
			</#if>
			<tr>
				<td colspan="2" style="text-align: center;">
                    <#if e.id??>
                        <button method="update" class="btn btn-success">
                            <i class="icon-ok icon-white"></i> 保存
                        </button>
					<#else>
                        <button method="insert" class="btn btn-success">
                            <i class="icon-ok icon-white"></i> 新增
                        </button>
					</#if>
				</td>
			</tr>
		</table>
	</form>
	
<script type="text/javascript">

KindEditor.ready(function(K) {
	var editor = K.editor({
		fileManagerJson : '${basepath}/resource/kindeditor-4.1.7/jsp/file_manager_json.jsp'
	});
	K('input[name=filemanager]').click(function() {
		var imagesInputObj = $(this).parent().children("input[ccc=imagesInput]");
		editor.loadPlugin('filemanager', function() {
			editor.plugin.filemanagerDialog({
				viewType : 'VIEW',
				dirName : 'image',
				clickFn : function(url, title) {
					//K('#picture').val(url);
					//alert(url);
					imagesInputObj.val(url);
					editor.hideDialog();
					clearRootImagePath(imagesInputObj);//$("#picture"));
				}
			});
		});
	});
}

$(function(){
	selectDefaultCatalog();
	
	$("#name").blur(function(){
		getCode();
	});
});
function selectDefaultCatalog(){
	var _catalogID = $("#catalogID").val();
	console.log("selectDefaultCatalog._catalogID="+_catalogID);
	//if(_catalogID!='' && _catalogID>0){
		$("#catalogSelect").val(_catalogID);
	//}
}

function catalogChange(obj){
	var _pid = $(obj).find("option:selected").attr("pid");
	console.log("_pid="+_pid);
	if(!(_pid && _pid==0)){
		alert("不能选择子类!");
		selectDefaultCatalog();
		return false;
	}
}

function getCode(){
	var _name = $("#name").val();
	//var _url = "catalog!autoCode.action?e.name="+_name;
	var _url = "autoCode";
	$.ajax({
	  type: 'POST',
	  url: _url,
	  data: {"name":_name},
	  dataType:"text",
	  //async:false,
	  success: function(data){
		  if(!data){return null;}
		  console.log("data="+data);
		  $("#code").val(data);
	  },
	  error:function(){
		  console.log("加载数据失败，请联系管理员。");
	  }
	});
	
	
	//删除图片主路径
function clearRootImagePath(picInput){
	var _pifeSpan = $("#pifeSpan").text();
	var _imgVal = picInput.val();
	picInput.val(_imgVal.substring(_imgVal.indexOf("/attached/")));
	//if(_imgVal && _imgVal.length>0 && _imgVal.indexOf(_pifeSpan)==0){
		//picInput.val(_imgVal.substring(_pifeSpan.length));
	//}
}


	
</script>
</@page.pageBase>