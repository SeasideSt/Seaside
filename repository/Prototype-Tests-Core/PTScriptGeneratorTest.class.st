Class {
	#name : #PTScriptGeneratorTest,
	#superclass : #WAScriptGeneratorTest,
	#category : 'Prototype-Tests-Core'
}

{ #category : #configuration }
PTScriptGeneratorTest >> scriptGeneratorClass [
	^ PTScriptGenerator
]

{ #category : #testing }
PTScriptGeneratorTest >> testEmpty [
	self
		assert: [ :html | ]
		gives: '<html><head><title></title></head><body></body></html>'
]

{ #category : #testing }
PTScriptGeneratorTest >> testEvent [
	self
		assert: [ :html |
				html
					anchor
					onClick: 'console.log("clicked")';
					with: 'click' ]
		gives: '<html><head><title></title></head><body><a onclick="console.log(&quot;clicked&quot;)">click</a></body></html>'
]

{ #category : #testing }
PTScriptGeneratorTest >> testLoadScript [
	self
		assert: [ :html | html document addLoadScript: (JSStream on: 'console.log("loaded")') ]
		gives: '<html><head><title></title></head><body><script type="text/javascript">document.observe("dom:loaded", function() {console.log("loaded");});</script></body></html>'
]
