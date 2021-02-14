Class {
	#name : #WADefaultScriptGeneratorTest,
	#superclass : #WAScriptGeneratorTest,
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #configuration }
WADefaultScriptGeneratorTest >> scriptGeneratorClass [
	^ WADefaultScriptGenerator
]

{ #category : #testing }
WADefaultScriptGeneratorTest >> testEmpty [
	self
		assert: [ :html | ]
		gives: '<html><head><title></title></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]

{ #category : #testing }
WADefaultScriptGeneratorTest >> testEvent [
	self
		assert: [ :html |
				html
					anchor
					onClick: 'console.log("clicked")';
					with: 'click' ]
		gives: '<html><head><title></title></head><body onload="onLoad()"><a onclick="console.log(&quot;clicked&quot;)">click</a><script type="text/javascript">function onLoad(){};</script></body></html>'
]

{ #category : #testing }
WADefaultScriptGeneratorTest >> testLoadScript [
	self
		assert: [ :html | html document addLoadScript: (WAStubJsObject on: 'console.log("loaded")') ]
		gives: '<html><head><title></title></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){console.log("loaded");};</script></body></html>'
]
