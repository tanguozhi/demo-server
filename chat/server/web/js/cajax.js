function ajaxAppendTo(id, removeTagName, url, body) {
	$.ajax({  
         url:url,
         data:body,
         error:function(){  
         	alert("操作失败,请重新再试!");  
         },  
         success:function(data){ 
         	if(removeTagName!=null){
         		$('#'+id).children(removeTagName).remove();
         	}
         	$(data).appendTo($('#'+id));
         }  
       });
}