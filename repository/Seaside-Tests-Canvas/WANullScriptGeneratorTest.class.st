Class {
	#name : #WANullScriptGeneratorTest,
	#superclass : #WAScriptGeneratorTest,
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #configuration }
WANullScriptGeneratorTest >> scriptGeneratorClass [
	^ WANullScriptGenerator
]

{ #category : #testing }
WANullScriptGeneratorTest >> testEmpty [
	self
		assert: [ :html | ]
		gives: '<html><head><title></title></head><body></body></html>'
]

{ #category : #testing }
WANullScriptGeneratorTest >> testEvent [
	self
		assert: [ :html |
				html
					anchor
					onClick: 'console.log("clicked")';
					with: 'click' ]
		gives: '<html><head><title></title></head><body><a onclick="console.log(&quot;clicked&quot;)">click</a></body></html>'
]
