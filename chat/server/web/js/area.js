function initArea(areaUrl, id) {
	$.ajax({  
         url:areaUrl,  
         error:function(){  
         	alert("error occured!!!");  
         },  
         success:function(data){  
         	$('#'+id).before(data);  
         	
         }  
       });
}

function areaChange(type, obj) {
	var selectValue = obj.options[obj.selectedIndex].value;
	if(selectValue=="") {
		return;
	}
	areaChangeValue(type, selectValue);
}

function areaChangeValue(type, value) {
	if(value==""){
		return;
	}
	
	if(type=="province") {
		//删除城市下拉选择框
		$('#select_city').remove();
		//删除地区下拉选择框
		$('#select_area').remove();
		//删除镇/街道下拉选择框
		$('#select_street').remove();
		
		if(value!="*"){
			initArea("/demo/city.action?model.submitFlag=EBL000006&am.puuid="+value, "area_search");
		}
	} else if(type=="city") {
		//删除地区下拉选择框
		$('#select_area').remove();
		//删除镇/街道下拉选择框
		$('#select_street').remove();
		
		if(value!="*"){
			initArea("/demo/area.action?model.submitFlag=EBL000006&am.puuid="+value, "area_search");
		}
	} else if(type=="area") {
		//删除镇/街道下拉选择框
		$('#select_street').remove();
		if(value!="*"){
			initArea("/demo/street.action?model.submitFlag=EBL000006&am.puuid="+value, "area_search");
		}
	}
}

function getFullAreaText() {
	var fullAreaText = "";
	
	var provinceObj = document.getElementById("select_province");
	if(provinceObj!=null){
		var index = provinceObj.selectedIndex; //序号，取当前选中选项的序号      
		var provinceText = provinceObj.options[index].text;
		var provinceValue = provinceObj.options[index].value;
		if(provinceText!=undefined && provinceValue!="*") {
			fullAreaText = provinceText;
		}
	}
	
	var cityObj = document.getElementById("select_city");
	if(cityObj!=null) {
		var index = cityObj.selectedIndex; //序号，取当前选中选项的序号      
		var cityText = cityObj.options[index].text;
		var cityValue = cityObj.options[index].value;
		if(cityText!=undefined && cityValue!="*") {
			fullAreaText = fullAreaText+"|"+cityText;
		}
	}
	
	
	var areaObj = document.getElementById("select_area");
	if(areaObj!=null) {
		var index = areaObj.selectedIndex; //序号，取当前选中选项的序号      
		var areaText = areaObj.options[index].text;
		var areaValue = areaObj.options[index].value;
		if(areaText!=undefined && areaValue!="*") {
			fullAreaText = fullAreaText+"|"+areaText;
		}
	}
	
	var streetObj = document.getElementById("select_street");
	if(streetObj!=null) {
		var index = streetObj.selectedIndex; //序号，取当前选中选项的序号      
		var streetText = streetObj.options[index].text;
		var streetValue = streetObj.options[index].value;
		if(streetText!=undefined && streetValue!="*") {
			fullAreaText = fullAreaText+"|"+streetText;
		}
	}
	
	return fullAreaText;
}

function getFullAreaUuid() {
	var areaUuid = "";
	var provinceValue = $('#select_province').val();
	if(provinceValue!=undefined && provinceValue!="*") {
		areaUuid = provinceValue;
	}
	
	var cityValue = $('#select_city').val();
	if(cityValue!=undefined && cityValue!="*") {
		areaUuid = areaUuid+"|"+cityValue;
	}
	
	var areaValue = $('#select_area').val();
	if(areaValue!=undefined && areaValue!="*") {
		areaUuid = areaUuid+"|"+areaValue;
	}
	
	var streetValue = $('#select_street').val();
	if(streetValue!=undefined && streetValue!="*") {
		areaUuid = areaUuid+"|"+streetValue;
	}
	return areaUuid;
}

function getLastAreaUuid() {
	var streetValue = $('#select_street').val();
	if(streetValue!=undefined && streetValue!="*") {
		return streetValue;
	}
	
	var areaValue = $('#select_area').val();
	if(areaValue!=undefined && areaValue!="*") {
		return areaValue;
	}
	
	var cityValue = $('#select_city').val();
	if(cityValue!=undefined && cityValue!="*") {
		return cityValue;
	}
	
	var provinceValue = $('#select_province').val();
	if(provinceValue!=undefined && provinceValue!="*") {
		return provinceValue;
	}
}