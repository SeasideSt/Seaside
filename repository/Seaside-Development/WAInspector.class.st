"
This is an abstract implementation of a web-based object inspector. Platforms should implement their own subclasses, specifying behaviour for all unimplemented methods.

Note that #openNativeInspectorOn: on the class-side also needs to be implemented.

Also subclasses probably want to implement #initialize and #unload on the class-side to call 'self select' and 'self unselect' respectively. This will ensure they are registered as the current implementation when they are loaded.
"
Class {
	#name : #WAInspector,
	#superclass : #WATool,
	#instVars : [
		'path',
		'selected',
		'input'
	],
	#classVars : [
		'Current'
	],
	#category : 'Seaside-Development-Core'
}

{ #category : #registration }
WAInspector class >> current [
	^ Current
]

{ #category : #registration }
WAInspector class >> current: anInspectorClass [
	Current := anInspectorClass
]

{ #category : #'instance creation' }
WAInspector class >> on: anObject [
	^ self new object: anObject; yourself
]

{ #category : #registration }
WAInspector class >> select [
	self current: self
]

{ #category : #registration }
WAInspector class >> unselect [
	(self current = self) ifTrue: [ self current: nil ]
]

{ #category : #actions }
WAInspector >> actions [
	"A list of action selectors used to render buttons in the Inspector."

	^ #(doIt inspectIt)
]

{ #category : #hooks }
WAInspector >> children [
	^ Array with: path
]

{ #category : #actions }
WAInspector >> chooseObject: anObject named: aString [
	"Choose a new object to be inspected, adding aString to the navigation path."

	path pushSegment: anObject name: aString.
	selected := nil
]

{ #category : #actions }
WAInspector >> doIt [
	"Execute the code in the textarea. We return the result so subclasses can do something
	with it if desired."
	
	^ self evaluate
]

{ #category : #actions }
WAInspector >> evaluate [
	"Evaluate the code in the textarea and return the result."
	
	self subclassResponsibility
]

{ #category : #private }
WAInspector >> fieldsFor: anObject [
	"Return a sequenceable collection of Associations representing labels and values
	of instance variables, etc. which should be displayed when inspecting anObject."

	self subclassResponsibility
]

{ #category : #initialization }
WAInspector >> initialize [
	super initialize.
	path := WAPath new
]

{ #category : #actions }
WAInspector >> inspectIt [
	"Evaluate the code in the textarea and then inspect the result."
	| result |
	result := self evaluate.
	self 
		chooseObject: result
		named: result greaseString
]

{ #category : #testing }
WAInspector >> isPrimitiveType: anObject [
	"Return a boolean indicating whether anObject is a primitive type in the system.
	Primitive types will not be rendered with a link allowing them to be inspected."

	^ anObject isNumber or: [ #(nil true false) includes: anObject ]
]

{ #category : #accessing }
WAInspector >> object [
	^ path currentSegment
]

{ #category : #accessing }
WAInspector >> object: anObject [ 
	self 
		chooseObject: anObject
		named: anObject greaseString
]

{ #category : #rendering }
WAInspector >> renderContentOn: html [
	html heading
		level: 1;
		with: (self object printStringLimitedTo: 50).
	html render: path.
	html form: [
		self renderMembersOn: html.
		self renderEditAreaOn: html ]
]

{ #category : #rendering }
WAInspector >> renderEditAreaOn: html [
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
WAInspector >> renderMembersOn: html [
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
WAInspector >> renderRow: anObject named: aString group: aRadioGroup on: html [
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
		html tableData: (anObject printStringLimitedTo: 100) ]
]

{ #category : #hooks }
WAInspector >> style [
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
