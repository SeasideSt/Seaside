Class {
	#name : #PTScriptGenerator,
	#superclass : #WAScriptGenerator,
	#category : 'Prototype-Core'
}

{ #category : #actions }
PTScriptGenerator >> close: aHtmlRoot on: aDocument [
	self loadScripts isEmpty
		ifTrue: [ ^ self ].
	self 
		writeScriptTag: [ 
			aDocument nextPutAll: 'document.observe("dom:loaded", function() {'.
			self writeLoadScriptsOn: aDocument.
			aDocument nextPutAll: '});' ]
		on: aDocument
]
