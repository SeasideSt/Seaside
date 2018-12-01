Class {
	#name : #JQAjaxTest,
	#superclass : #JQueryTest,
	#category : 'JQuery-Tests-Core-Unit'
}

{ #category : #accessing }
JQAjaxTest >> ajax [
	^ self jQuery ajax
]

{ #category : #accessing }
JQAjaxTest >> ajaxSetup [
	^ self jQuery ajaxSetup
]

{ #category : #'tests-parameters' }
JQAjaxTest >> testAddParameter [
	self 
		assert: (self ajax addParameter: 'foo')
		equals: self function, '.ajax({"data":"foo"})'
]

{ #category : #'tests-parameters' }
JQAjaxTest >> testAddParameterValue [
	self
		assert: (self ajax addParameter: 'foo' -> 12)
		equals: self function, '.ajax({"data":"foo="+encodeURIComponent(12)})'.
	self
		assert: (self ajax addParameter: 'foo' -> true)
		equals: self function, '.ajax({"data":"foo="+encodeURIComponent(true)})'.
	self
		assert: (self ajax addParameter: 'foo' -> self mock)
		equals: self function, '.ajax({"data":"foo="+encodeURIComponent(mock)})'
]

{ #category : #tests }
JQAjaxTest >> testAjax [
	self 
		assert: self ajax
		equals: self function, '.ajax()'
]

{ #category : #tests }
JQAjaxTest >> testAjaxSetup [
	self 
		assert: self ajaxSetup
		equals: self function, '.ajaxSetup()'
]

{ #category : #'tests-options' }
JQAjaxTest >> testAsync [
	self
		assert: (self ajax async: true)
		equals: self function, '.ajax({"async":true})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testCache [
	self
		assert: (self ajax cache: false)
		equals: self function, '.ajax({"cache":false})'
]

{ #category : #'tests-callbacks' }
JQAjaxTest >> testCallback [
	self 
		assert: (self ajax callback: [ ])
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1"].join("&")})'
]

{ #category : #'tests-callbacks' }
JQAjaxTest >> testCallbackForEvent [
	self 
		assert: (self ajax callback: [ ] forEvent: #(
			(passenger tab)
			(number index)
			(position position)
			(size originalSize)
			(string contributor)))
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1"',
			',"2="+encodeURIComponent(',
			'$(arguments[1].tab).attr("id")',
				'+","+',
			'arguments[1].index',
				'+","+',
			'arguments[1].position.top+","+arguments[1].position.left',
				'+","+',
			'arguments[1].originalSize.width+","+arguments[1].originalSize.height',
				'+","+',
			'arguments[1].contributor',
				')].join("&")})'
]

{ #category : #'tests-callbacks' }
JQAjaxTest >> testCallbackValue [
	self 
		assert: (self ajax callback: [ ] value: (self jQuery this hasClass: 'foo'))
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1","2="+encodeURIComponent(' , self function, '(this).hasClass("foo"))].join("&")})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testContentType [
	self
		assert: (self ajax contentType: 'text/html')
		equals: self function, '.ajax({"contentType":"text/html"})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testContext [
	self
		assert: (self ajax context: self jQuery this)
		equals: self function, '.ajax({"context":', self function , '(this)})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testData [
	self
		assert: (self ajax data: 'foo')
		equals: self function, '.ajax({"data":"foo"})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testDataFilter [
	self
		assert: (self ajax dataFilter: (self javascript alert: 'Hello'))
		equals: self function, '.ajax({"dataFilter":function(){return alert("Hello")}})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testDataType [
	self
		assert: (self ajax dataType: 'xml')
		equals: self function, '.ajax({"dataType":"xml"})'
]

{ #category : #'tests-accessing' }
JQAjaxTest >> testFullUrl [
	self 
		assert: (self ajax fullUrl)
		equals: '"/"'.
	self
		assert: (self ajax callback: [ ]; fullUrl)
		equals: '"http://www.seaside.st/?_s=1&_k=a&1"'.
	self
		assert: (self ajax callback: [ ] value: $a; fullUrl)
		equals: '"http://www.seaside.st/?_s=1&_k=a&1&2=a"'.
	self
		assert: (self ajax callback: [ ] value: self mock; fullUrl)
		equals: '"http://www.seaside.st/?_s=1&_k=a&1"'
]

{ #category : #tests }
JQAjaxTest >> testGet [
	self
		assert: (self jQuery get)
		equals: self function, '.get("/")'
]

{ #category : #tests }
JQAjaxTest >> testGetJson [
	self
		assert: (self jQuery getJson)
		equals: self function, '.getJSON("/")'
]

{ #category : #tests }
JQAjaxTest >> testGetScript [
	self
		assert: (self jQuery getScript)
		equals: self function, '.getScript("/")'
]

{ #category : #'tests-options' }
JQAjaxTest >> testGlobal [
	self
		assert: (self ajax global: false)
		equals: self function, '.ajax({"global":false})'
]

{ #category : #'tests-callbacks' }
JQAjaxTest >> testHtml [
	self 
		assert: (self ajax html: [ :html | html div ])
		equals: self function, '.ajax({"dataType":"html","url":"http://www.seaside.st/","data":["_s=1","_k=a","1"].join("&")})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testIfModified [
	self
		assert: (self ajax ifModified: false)
		equals: self function, '.ajax({"ifModified":false})'
]

{ #category : #'tests-accessing' }
JQAjaxTest >> testJavascriptUrl [
	self 
		assert: (self ajax javascriptUrl)
		equals: '"/"'.
	self
		assert: (self ajax callback: [ ]; javascriptUrl)
		equals: '"http://www.seaside.st/"+"?"+["_s=1","_k=a","1"].join("&")'.
	self
		assert: (self ajax callback: [ ] value: $a; javascriptUrl)
		equals: '"http://www.seaside.st/"+"?"+["_s=1","_k=a","1","2=a"].join("&")'.
	self
		assert: (self ajax callback: [ ] value: self mock; javascriptUrl)
		equals: '"http://www.seaside.st/"+"?"+["_s=1","_k=a","1","2="+encodeURIComponent(mock)].join("&")'
]

{ #category : #'tests-options' }
JQAjaxTest >> testJsonp [
	self
		assert: (self ajax jsonp: 'onJsonPLoad')
		equals: self function, '.ajax({"jsonp":"onJsonPLoad"})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testJsonpCallback [
	self
		assert: (self ajax jsonpCallback: 1)
		equals: self function, '.ajax({"jsonpCallback":function(){1}})'
]

{ #category : #tests }
JQAjaxTest >> testLoad [
	self
		assert: ((self jQuery: 'li') load)
		equals: self function , '("li").load("/")'.
	self
		assert: ((self jQuery: 'li') load 
			selector: '#jq-p-Getting-Started li')
		equals: self function , '("li").load("/ #jq-p-Getting-Started li")'.
	self
		assert: ((self jQuery: 'li') load 
			url: '/Main_Page';
			selector: '#jq-p-Getting-Started li')
		equals: self function , '("li").load("/Main_Page #jq-p-Getting-Started li")'
]

{ #category : #'tests-callbacks' }
JQAjaxTest >> testMultiple [
	self 
		assert: (self ajax
			callback: [ :value | ] value: $a; 
			callback: [ :value | ] value: $b;
			callback: [ ])
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1","2=a","3=b"].join("&")})'
]

{ #category : #'tests-events' }
JQAjaxTest >> testOnBeforeSend [
	self
		assert: (self jQuery ajax onBeforeSend: (self javascript alert: 'before'))
		equals: self function, '.ajax({"beforeSend":function(){alert("before")}})'
]

{ #category : #'tests-events' }
JQAjaxTest >> testOnComplete [
	self
		assert: (self jQuery ajax onComplete: (self javascript alert: 'loaded'))
		equals: self function, '.ajax({"complete":function(){alert("loaded")}})'.
	self
		assert: ((self jQuery: 'li') load onComplete: (self javascript alert: 'loaded'))
		equals: self function, '("li").load("/",function(){alert("loaded")})'
]

{ #category : #'tests-events' }
JQAjaxTest >> testOnError [
	self
		assert: (self jQuery ajax onError: (self javascript alert: 'error'))
		equals: self function, '.ajax({"error":function(){alert("error")}})'
]

{ #category : #'tests-events' }
JQAjaxTest >> testOnSuccess [
	self
		assert: (self jQuery ajax onSuccess: (self javascript alert: 'success'))
		equals: self function, '.ajax({"success":function(){alert("success")}})'
]

{ #category : #'tests-events' }
JQAjaxTest >> testOnXhr [
	self
		assert: (self jQuery ajax onXhr: (self javascript alert: 'create'))
		equals: self function, '.ajax({"xhr":function(){alert("create")}})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testPassword [
	self
		assert: (self ajax password: 'topsecret')
		equals: self function, '.ajax({"password":"topsecret"})'
]

{ #category : #tests }
JQAjaxTest >> testPost [
	self
		assert: (self jQuery post)
		equals: self function, '.post("/")'.
	self
		assert: (self jQuery post addParameter: 'foo')
		equals: self function, '.post("/","foo")'.
	self
		assert: (self jQuery post addParameter: 'foo' -> true)
		equals: self function, '.post("/","foo="+encodeURIComponent(true))'
]

{ #category : #'tests-options' }
JQAjaxTest >> testProcessData [
	self
		assert: (self ajax processData: false)
		equals: self function, '.ajax({"processData":false})'
]

{ #category : #'tests-callbacks' }
JQAjaxTest >> testScript [
	self 
		assert: (self ajax script: [ :script | script alert: 'Hello' ])
		equals: self function, '.ajax({"dataType":"script","url":"http://www.seaside.st/","data":["_s=1","_k=a","1"].join("&")})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testScriptCharset [
	self
		assert: (self ajax scriptCharset: 'utf-8')
		equals: self function, '.ajax({"scriptCharset":"utf-8"})'
]

{ #category : #'tests-convenience' }
JQAjaxTest >> testSerialize [
	self
		assert: (self ajax serialize: (self jQuery: 'form'))
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '("form").serialize()].join("&")})'
]

{ #category : #'tests-convenience' }
JQAjaxTest >> testSerializeArray [
	self
		assert: self jQuery this serializeArray
		equals: self function, '(this).serializeArray()'
]

{ #category : #'tests-convenience' }
JQAjaxTest >> testSerializeChildren [
	self
		assert: self ajax serializeChildren
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '(this).find(":input").serialize()].join("&")})'.
	self
		assert: (self ajax serializeChildren: (self jQuery: 'form'))
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '("form").find(":input").serialize()].join("&")})'
]

{ #category : #'tests-convenience' }
JQAjaxTest >> testSerializeFileUpload [
	self
		assert: (self ajax serializeFileUpload: (self jQuery: '#something'))
		equals: self function , '.ajax({"data":function(){var formdata = new FormData();var name=$("#something").attr("name");var files=$("#something")[0].files;for(i=0;i<files.length;i++) formdata.append(name,files[i]);return formdata}(),"url":"http://www.seaside.st/?_s=1&_k=a","type":"POST","cache":false,"processData":false,"contentType":false})'
]

{ #category : #'tests-convenience' }
JQAjaxTest >> testSerializeForm [
	self
		assert: self ajax serializeForm
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '(this).closest("form").find(":input").serialize()].join("&")})'.
	self
		assert: (self ajax serializeForm: (self jQuery: '#something'))
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '("#something").closest("form").find(":input").serialize()].join("&")})'
]

{ #category : #'tests-convenience' }
JQAjaxTest >> testSerializeThis [
	self
		assert: self ajax serializeThis
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '(this).serialize()].join("&")})'
]

{ #category : #'tests-convenience' }
JQAjaxTest >> testSerializeThisWithHidden [
	self
		assert: self ajax serializeThisWithHidden
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '(this).next("input:hidden").addBack().serialize()].join("&")})'
]

{ #category : #'tests-convenience' }
JQAjaxTest >> testSerializeWithHidden [
	self
		assert: (self ajax serializeWithHidden: (self jQuery: '#foobar'))
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '("#foobar").next("input:hidden").addBack().serialize()].join("&")})'
]

{ #category : #'tests-callbacks' }
JQAjaxTest >> testText [
	self 
		assert: (self ajax text: [ :stream | stream nextPutAll: 'Supergirl' ])
		equals: self function, '.ajax({"dataType":"text","url":"http://www.seaside.st/","data":["_s=1","_k=a","1"].join("&")})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testTimeout [
	self
		assert: (self ajax timeout: 1200)
		equals: self function, '.ajax({"timeout":1200})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testTraditional [
	self
		assert: (self ajax traditional: true)
		equals: self function, '.ajax({"traditional":true})'
]

{ #category : #'tests-options' }
JQAjaxTest >> testType [
	self
		assert: (self ajax type: 'post')
		equals: self function, '.ajax({"type":"POST"})'
]

{ #category : #'tests-accessing' }
JQAjaxTest >> testUrl [
	self 
		assert: self ajax url
		equals: '"/"'.
	self
		assert: (self ajax callback: [ ]; url)
		equals: '"http://www.seaside.st/"'.
	self
		assert: (self ajax callback: [ ] value: $a; url)
		equals: '"http://www.seaside.st/"'.
	self
		assert: (self ajax callback: [ ] value: self mock; url)
		equals: '"http://www.seaside.st/"'
]

{ #category : #'tests-options' }
JQAjaxTest >> testUsername [
	self
		assert: (self ajax username: 'seaside')
		equals: self function, '.ajax({"username":"seaside"})'
]
