"
A WADefaultScriptGenerator uses the onLoad event on the body to trigger the load scripts. Events handlers are directly inlined with the respective elements. Both techniques are considered outdated and should be avoided if possible.
"
Class {
	#name : #WADefaultScriptGenerator,
	#superclass : #WAScriptGenerator,
	#category : 'Seaside-Core-Document'
}

{ #category : #actions }
WADefaultScriptGenerator >> close: aHtmlRoot on: aDocument [
	self 
		writeScriptTag: [
			aDocument nextPutAll: 'function onLoad(){'.
			self writeLoadScriptsOn: aDocument.
			aDocument nextPutAll: '};' ]
		on: aDocument
]

{ #category : #actions }
WADefaultScriptGenerator >> open: aHtmlRoot on: aDocument [
	aHtmlRoot bodyAttributes at: 'onload' put: 'onLoad()'
]
