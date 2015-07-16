tests-convenience
testSerializeFileUpload
	self
		assert: (self ajax serializeFileUpload: (self jQuery: '#something'))
		equals: self function , '.ajax({"data":function(){var formdata = new FormData();var name=$("#something").attr("name");var files=$("#something")[0].files;for(i=0;i<files.length;i++) formdata.append(name,files[i]);return formdata}(),"url":"http://www.seaside.st/?_s=1&_k=a","type":"POST","cache":false,"processData":false,"contentType":false})'