"
A WAHtmlDocument controls how a string is created from a series of brushes.
"
Class {
	#name : #WAHtmlDocument,
	#superclass : #WAXmlDocument,
	#instVars : [
		'scriptGenerator'
	],
	#category : 'Seaside-Core-Document'
}

{ #category : #scripting }
WAHtmlDocument >> addLoadScript: anObject [
	^ self scriptGenerator addLoadScript: anObject
]

{ #category : #scripting }
WAHtmlDocument >> addLoadScriptFirst: anObject [
	^ self scriptGenerator addLoadScriptFirst: anObject
]

{ #category : #scripting }
WAHtmlDocument >> loadScripts [
	^ self scriptGenerator loadScripts
]

{ #category : #accessing }
WAHtmlDocument >> scriptGenerator [
	^ scriptGenerator ifNil: [ scriptGenerator := WADefaultScriptGenerator new ]
]

{ #category : #accessing }
WAHtmlDocument >> scriptGenerator: aScriptGenerator [
	scriptGenerator := aScriptGenerator
]
