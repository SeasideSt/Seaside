Class {
	#name : #WAHtmlAttributesTest,
	#superclass : #WAContextTest,
	#instVars : [
		'attributes'
	],
	#category : 'Seaside-Tests-Core-Document'
}

{ #category : #private }
WAHtmlAttributesTest >> assert: aBlock gives: aString [ 
	| stream |
	aBlock value: (attributes := WAHtmlAttributes new).
	(WAHtmlDocument 
		on: (stream := WriteStream on: String new)
		codec: self requestContext codec) print: attributes.
	self 
		assert: stream contents = aString
		description: 'Expected ' , aString printString , ', but got ' , stream contents printString
		resumable: true
]

{ #category : #running }
WAHtmlAttributesTest >> setUp [
	attributes := WAHtmlAttributes new
]

{ #category : #'tests-convenience' }
WAHtmlAttributesTest >> testAddClass [
	self
		assert: [ :attr | attr addClass: 'foo' ]
		gives: ' class="foo"'.
	self
		assert: [ :attr | attr addClass: 'foo'; addClass: 'bar' ]
		gives: ' class="foo bar"'
]

{ #category : #'tests-convenience' }
WAHtmlAttributesTest >> testAddStyle [
	self
		assert: [ :attr | attr addStyle: 'display: hidden' ]
		gives: ' style="display: hidden"'.
	self
		assert: [ :attr | attr addStyle: 'display: hidden'; addStyle: 'position: absolute' ]
		gives: ' style="display: hidden;position: absolute"'
]

{ #category : #tests }
WAHtmlAttributesTest >> testAt [
	attributes at: 'foo' put: 'bar'.
	self assert: (attributes at: 'foo') = 'bar'.
	self assert: (attributes at: 'bar') isNil
]

{ #category : #tests }
WAHtmlAttributesTest >> testAtAppend [
	self
		assert: [ :attr | attr at: 'onclick' append: 'this' separator: ';' ]
		gives: ' onclick="this"'.
	self
		assert: [ :attr |
			attr
				at: 'onclick' append: 'this' separator: ';';
				at: 'onclick' append: 'that' separator: ';' ]
		gives: ' onclick="this;that"'.
	self
		assert: [ :attr |
			attr
				at: 'onclick' append: 'this' separator: ';';
				at: 'onclick' append: nil separator: ';' ]
		gives: ' onclick="this"'.
	self
		assert: [ :attr |
			attr
				at: 'onclick' append: 1 separator: ';';
				at: 'onclick' append: 2 separator: ';' ]
		gives: ' onclick="1;2"'
]

{ #category : #tests }
WAHtmlAttributesTest >> testAtPut [
	self
		assert: [ :attr | attr at: 'id' put: 'foo' ]
		gives: ' id="foo"'.
	self
		assert: [ :attr | attr at: 'tabindex' put: 6 ]
		gives: ' tabindex="6"'.
	self
		assert: [ :attr | attr at: 'checked' put: true ]
		gives: ' checked'.
	self
		assert: [ :attr | attr at: 'readonly' put: false ]
		gives: ''.
	self
		assert: [ :attr | attr at: 'disabled' put: nil ]
		gives: ''
]

{ #category : #'tests-fixtures' }
WAHtmlAttributesTest >> testCaseSensititve [
	self
		assert: [ :attr | attr at: 'lastBuildDate' put: 'Sat, 07 Sep 2002 09:42:31 GMT' ]
		gives: ' lastBuildDate="Sat, 07 Sep 2002 09:42:31 GMT"'
]

{ #category : #tests }
WAHtmlAttributesTest >> testOrder [
	self
		assert: [ :attr | attr at: 'a' put: 1; at: 'b' put: 2; at: 'c' put: 3 ]
		gives: ' a="1" b="2" c="3"'.
	self
		assert: [ :attr | attr at: 'a' put: 1; at: 'b' put: 2; at: 'c' put: 3; at: 'b' put: 4 ]
		gives: ' a="1" b="4" c="3"'
]

{ #category : #tests }
WAHtmlAttributesTest >> testRemoveKey [
	attributes at: 'id' put: 'foo'.
	self assert: (attributes removeKey: 'id') = 'foo'.
	self assert: (attributes removeKey: 'id') isNil
]
