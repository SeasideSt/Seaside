Class {
	#name : #WAObjectLogInspector,
	#superclass : #WAComponent,
	#instVars : [
		'path',
		'selected',
		'input'
	],
	#category : 'Seaside-GemStone-Tools-Production-ObjectLog'
}

{ #category : #'instance creation' }
WAObjectLogInspector class >> on: anObject [
	^ self new object: anObject; yourself
]

{ #category : #actions }
WAObjectLogInspector >> actions [
	"A list of action selectors used to render buttons in the Inspector."

	^ #(doIt inspectIt)
]

{ #category : #hooks }
WAObjectLogInspector >> children [
	^ Array with: path
]

{ #category : #actions }
WAObjectLogInspector >> chooseObject: anObject named: aString [
	"Choose a new object to be inspected, adding aString to the navigation path."

	path pushSegment: anObject name: aString.
	selected := nil
]

{ #category : #actions }
WAObjectLogInspector >> displayFullPrintStringFor: anObject [

	self call: (WAStringInspector new
		string: anObject printString;
		yourself)
]

{ #category : #actions }
WAObjectLogInspector >> doIt [
	| result |
	result := super doIt.
	selected ifNil: [ ^ result ].
	^ selected isNumber
		ifTrue: [ self object at: selected put: result ]
		ifFalse: [ self object instVarNamed: selected put: result ]
]

{ #category : #actions }
WAObjectLogInspector >> evaluate [
	"GemStone does not have a thisContext variable..."

	^input evaluateInContext: self object symbolList: GsSession currentSession symbolList
]

{ #category : #private }
WAObjectLogInspector >> fieldsFor: anObject [
	^ anObject inspectorFields
]

{ #category : #initialization }
WAObjectLogInspector >> initialize [
	super initialize.
	path := WAPath new
]

{ #category : #actions }
WAObjectLogInspector >> inspectIt [
	"Evaluate the code in the textarea and then inspect the result."
	| result |
	result := self evaluate.
	self 
		chooseObject: result
		named: result greaseString
]

{ #category : #testing }
WAObjectLogInspector >> isPrimitiveType: anObject [
	"Return a boolean indicating whether anObject is a primitive type in the system.
	Primitive types will not be rendered with a link allowing them to be inspected."

	^ anObject isNumber or: [ #(nil true false) includes: anObject ]
]

{ #category : #accessing }
WAObjectLogInspector >> object [
	^ path currentSegment
]

{ #category : #accessing }
WAObjectLogInspector >> object: anObject [ 
	self 
		chooseObject: anObject
		named: anObject greaseString
]

{ #category : #rendering }
WAObjectLogInspector >> renderContentOn: html [
	html heading
		level: 1;
		with: (self object printStringLimitedTo: 50).
	html render: path.
	html form: [
		self renderMembersOn: html.
		self renderEditAreaOn: html ]
]

{ #category : #rendering }
WAObjectLogInspector >> renderEditAreaOn: html [
	html textArea
		value: input;
		callback: [ :value | input := value ].
	html break.
	self actions do: [ :each |
		html submitButton
			callback: [ self perform: each ];
			text: each ]
]

{ #category : #rendering }
WAObjectLogInspector >> renderMembersOn: html [
	| members radioGroup |
	selected := nil.
	members := self fieldsFor: self object.
	members isEmpty ifTrue: [ ^ self ].
	radioGroup := html radioGroup.
	radioGroup
		callback: [ :value | selected := value ];
		selected: selected.
	html table: [
		members do: [ :association |
			self
				renderRow: association value
				named: association key
				group: radioGroup
				on: html ] ]
]

{ #category : #rendering }
WAObjectLogInspector >> renderRow: anObject named: aString group: aRadioGroup on: html [
	| radioButton |
	html tableRow: [
		html tableHeading: [
			radioButton := aRadioGroup radioButton
				ensureId;
				value: aString;
				yourself.
			html label for: radioButton id; with: [
				(self isPrimitiveType: anObject)
					ifTrue: [ html text: aString ]
					ifFalse: [
						html anchor
							callback: [ self chooseObject: anObject named: aString ];
							with: aString ] ] ].
		html tableData: [ | str |
			str := anObject printStringLimitedTo: 100.
			str size > 90
				ifTrue: [
					html anchor
						callback: [ self displayFullPrintStringFor: anObject ];
						with: str]
				ifFalse: [
					html text: str]] ]
]

{ #category : #hooks }
WAObjectLogInspector >> style [
	^ 'form {
	padding: 2px;
	margin: 0;
}
form th {
	text-align: left;
	padding-right: 2em;
}
form textarea {
	width: 100%;
	height: 100px;
	border: 1px solid #aaa;
}'
]
