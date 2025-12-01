"
I am a  specific canvas to render JSON output.
"
Class {
	#name : 'JSJavascriptCanvas',
	#superclass : 'WACanvas',
	#instVars : [
		'first'
	],
	#category : 'Javascript-Core-Base',
	#package : 'Javascript-Core',
	#tag : 'Base'
}

{ #category : 'instance creation' }
JSJavascriptCanvas class >> builder [
	^ (WABuilder on: self)
		documentClass: JSJavascriptDocument;
		yourself
]

{ #category : 'public' }
JSJavascriptCanvas >> argument: aBlock [
	^ (self brush: JSJavascriptFunctionArgumentBrush new) with: aBlock
]

{ #category : 'public' }
JSJavascriptCanvas >> arguments: aBlock [
	^ (self brush: JSJavascriptFunctionArgumentsBrush new) with: aBlock
]

{ #category : 'public' }
JSJavascriptCanvas >> array: aBlock [
	^ (self brush: JSJavascriptArrayBrush new) with: aBlock
]

{ #category : 'public' }
JSJavascriptCanvas >> assignment: aBlock [
	^ (self brush: JSJavascriptAssignmentBrush new) with: aBlock
]

{ #category : 'double-dispatch' }
JSJavascriptCanvas >> boolean: aBoolean [
	self document nextPutAll: (aBoolean ifTrue: [ 'true' ] ifFalse: [ 'false' ])
]

{ #category : 'public' }
JSJavascriptCanvas >> bracketProperty: aStringOrInteger [
	self document openBracket.
	self render: aStringOrInteger.
	self document closeBracket
]

{ #category : 'double-dispatch' }
JSJavascriptCanvas >> dateAndTime: aDateAndTime [
	" Note: date and time is not standard json. So we use the ISO 8601 standard here. We convert to string to make it valid json."
	self flag: #TODO. "will have to change"
	self document beginString.
	aDateAndTime printOn: self document stream.
	self document endString
]

{ #category : 'public' }
JSJavascriptCanvas >> defineFunction [
	^ self brush: (JSJavascriptFunctionDefinitionBrush new)
]

{ #category : 'public' }
JSJavascriptCanvas >> defineFunction: aBlock [
	^ (self brush: (JSJavascriptFunctionDefinitionBrush new)) with: aBlock
]

{ #category : 'public' }
JSJavascriptCanvas >> encodeURIComponent: anObject [
	self document encodeURIComponent.
	self document nextPut: $(.
	self render: anObject.
	self document nextPut: $)
]

{ #category : 'public' }
JSJavascriptCanvas >> function: aFunctionNameString [
	^ self brush: (JSJavascriptFunctionCallBrush name: aFunctionNameString)
]

{ #category : 'initialization' }
JSJavascriptCanvas >> initializeWithContext: aRenderContext [
	super initializeWithContext: aRenderContext.
	first := true
]

{ #category : 'public' }
JSJavascriptCanvas >> javascript: aString [
	self document javascript: aString
]

{ #category : 'public' }
JSJavascriptCanvas >> key: aKeyString value: aValueObject [
	^ (self brush: (JSJavascriptKeyValueBrush key: aKeyString)) with: aValueObject
]

{ #category : 'private' }
JSJavascriptCanvas >> nest: aBlock [
	first := true.
	super nest: aBlock.
	first := false
]

{ #category : 'public' }
JSJavascriptCanvas >> new: aString [
	^ self brush: (JSJavascriptConstructorCallBrush name: aString)
]

{ #category : 'public' }
JSJavascriptCanvas >> nextPut: aCharacter [ 
	self document nextPut: aCharacter
]

{ #category : 'double-dispatch' }
JSJavascriptCanvas >> null [
	self document nextPutAll: 'null'
]

{ #category : 'double-dispatch' }
JSJavascriptCanvas >> number: aNumber [
	aNumber printOn: self document stream
]

{ #category : 'public' }
JSJavascriptCanvas >> object: aBlock [
	^ (self brush: JSJavasciptObjectBrush new) with: aBlock
]

{ #category : 'public' }
JSJavascriptCanvas >> operator: aString [ 
	^ self brush: (JSJavascriptOperatorBrush operator: aString)
]

{ #category : 'public' }
JSJavascriptCanvas >> render: anObject [
	self flush.
	anObject javascriptOn: self
]

{ #category : 'public' }
JSJavascriptCanvas >> return: aBlock [
	^ (self brush: JSJavascriptReturnBrush new) with: aBlock
]

{ #category : 'double-dispatch' }
JSJavascriptCanvas >> scaledDecimal: aScaledDecimal [
	| converter |
	converter := GRSignPrinter new, (GRNumberPrinter new precision: aScaledDecimal scale).
	converter print: aScaledDecimal on: self document stream
]

{ #category : 'double-dispatch' }
JSJavascriptCanvas >> string: aString [
	self document string: aString
]

{ #category : 'public' }
JSJavascriptCanvas >> value: aBlock [
	^ (self brush: JSJavascriptValueBrush new) with: aBlock
]

{ #category : 'private' }
JSJavascriptCanvas >> writeCharacterIfNotFirst: aCharacter [
	first ifFalse: [
		self document nextPut: aCharacter ]
]

{ #category : 'private' }
JSJavascriptCanvas >> writeIfNotFirst: aString [
	first ifFalse: [
		self document nextPutAll: aString ]
]
