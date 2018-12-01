Class {
	#name : #JQScriptGenerator,
	#superclass : #WAScriptGenerator,
	#category : 'JQuery-Core-Objects'
}

{ #category : #actions }
JQScriptGenerator >> close: aHtmlRoot on: aDocument [
	self loadScripts isEmpty
		ifTrue: [ ^ self ].
	self 
		writeScriptTag: [ 
			aDocument nextPutAll: JQuery functionName; nextPutAll: '(function(){'.
			self writeLoadScriptsOn: aDocument.
			aDocument nextPutAll: '});' ]
		on: aDocument
]

{ #category : #public }
JQScriptGenerator >> event: aString do: anObject on: aBrush [
	anObject ifNil: [ ^ self ].
	self addLoadScript: (JQueryInstance new
		id: aBrush ensureId;
		on: aString do: anObject)
]
