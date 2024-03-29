Class {
	#name : 'WADefaultScriptGeneratorTest',
	#superclass : 'WAScriptGeneratorTest',
	#category : 'Seaside-Tests-Canvas-Base',
	#package : 'Seaside-Tests-Canvas',
	#tag : 'Base'
}

{ #category : 'configuration' }
WADefaultScriptGeneratorTest >> createHandlers [

	^ Array with: WARequestHandler new
]

{ #category : 'configuration' }
WADefaultScriptGeneratorTest >> scriptGeneratorClass [
	^ WADefaultScriptGenerator
]

{ #category : 'testing' }
WADefaultScriptGeneratorTest >> testEmpty [
	self
		assert: [ :html | ]
		gives: '<html><head><title></title></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]

{ #category : 'testing' }
WADefaultScriptGeneratorTest >> testEvent [
	self
		assert: [ :html |
				html
					anchor
					onClick: 'console.log("clicked")';
					with: 'click' ]
		gives: '<html><head><title></title></head><body onload="onLoad()"><a onclick="console.log(&quot;clicked&quot;)">click</a><script type="text/javascript">function onLoad(){};</script></body></html>'
]

{ #category : 'testing' }
WADefaultScriptGeneratorTest >> testLoadScript [
	self
		assert: [ :html | html document addLoadScript: (WAStubJsObject on: 'console.log("loaded")') ]
		gives: '<html><head><title></title></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){console.log("loaded");};</script></body></html>'
]

{ #category : 'testing' }
WADefaultScriptGeneratorTest >> testNestedScripts [

	self
		assert: [ :html |
			html anchor script:
				((html jQuery this closest: 'div') append: [ :r |
					 r div script: (html jQuery this
							  on: 'click'
							  selector: '.class'
							  do: (JSStream on: 'alert(''nested script''')) ]) ]
		gives: '<html><head><title></title></head><body onload="onLoad()"><a id="id2"></a><script type="text/javascript">function onLoad(){$("#id2").closest("div").append("<div id=\"id1\"><\/div><script type=\"text/javascript\">$(\"#id1\").on(\"click\",\".class\",function(){alert(''nested script''});<\/script>");};</script></body></html>'
]
