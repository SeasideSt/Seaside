"
Defines a script, such as a JavaScript.
"
Class {
	#name : #WAScriptTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAScriptTag >> async [
	"If the async attribute is present, then the script will be executed asynchronously, as soon as it is available.
	See: http://www.w3.org/TR/html5/scripting-1.html#attr-script-async"

	self attributes at: 'async' put: true
]

{ #category : #attributes }
WAScriptTag >> defer [
	"When set, this boolean attribute provides a hint to the user agent that the script is not going to generate any document content (e.g., no 'document.write' in javascript) and thus, the user agent can continue parsing and rendering."
	self attributes at: 'defer' put: true
]

{ #category : #attributes }
WAScriptTag >> resourceUrl: aString [
	self url: (canvas absoluteUrlForResource: aString)
]

{ #category : #accessing }
WAScriptTag >> tag [
	^ 'script'
]

{ #category : #attributes }
WAScriptTag >> url: aString [
	self attributes at: 'src' put: aString
]

{ #category : #public }
WAScriptTag >> with: aString [ 
	self attributes 
		at: 'type'
		ifAbsentPut: [ 'text/javascript' ].
	super with: [
		aString isNil ifFalse: [
			self document nextPutAll: aString greaseString ] ]
]
