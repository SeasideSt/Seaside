"
A script generator that does not support any load scripts. This results in cleaner HTML and should result in slightly faster page loads.
"
Class {
	#name : #WANullScriptGenerator,
	#superclass : #WAScriptGenerator,
	#category : 'Seaside-Core-Document'
}

{ #category : #accesing }
WANullScriptGenerator >> addLoadScript: anObject [
	WAError signal: '#addLoadScript: is not supported by WANullScriptGenerator use WADefaultScriptGenerator or JQScriptGenerator instead'
]

{ #category : #accesing }
WANullScriptGenerator >> addLoadScriptFirst: anObject [
	WAError signal: '#addLoadScriptFirst: is not supported by WANullScriptGenerator use WADefaultScriptGenerator or JQScriptGenerator instead'
]

{ #category : #actions }
WANullScriptGenerator >> close: aHtmlRoot on: aDocument [
	"do nothing"
]

{ #category : #actions }
WANullScriptGenerator >> open: aHtmlRoot on: aDocument [
	"do nothing"
]
