"
I represent the abstract root of all JavaScript objects in the Smalltalk world. My subclasses provide accessors and action methods to configure instances of myself and implement the method #javascriptContentOn: to emit valid JavaScript code for my presentation.

Instance Variables
	decoration:			<JSObject|JSDecoration>
	renderContext:		<WARenderContext>
	rendererClass:		<WARenderer>
"
Class {
	#name : #JSObject,
	#superclass : #WAObject,
	#instVars : [
		'decoration',
		'renderContext',
		'rendererClass'
	],
	#category : 'Javascript-Core-Base'
}

{ #category : #'instance creation' }
JSObject class >> context: aRenderContext [
	^ self new setContext: aRenderContext; yourself
]

{ #category : #decorations }
JSObject >> & anObject [ 
	"Combine the receiver and anObject with a logical AND."
	
	self addDecoration: (JSBinary new operator: '&&'; statement: anObject)
]

{ #category : #convenience }
JSObject >> , anObject [ 
	"Concatenate the receiver with anObject."

	self addDecoration: (JSConcatenation on: anObject)
]

{ #category : #decorations }
JSObject >> access: aString [ 
	"Access the member aString."
	
	self addDecoration: (JSAccess named: aString)
]

{ #category : #adding }
JSObject >> addDecoration: aDecoration [
	"Add a new decoration to the receiver."

	aDecoration setOwner: decoration.
	decoration := aDecoration
]

{ #category : #decorations }
JSObject >> alias: aString [ 
	"Uses aString as an alias for the receiver."
	
	self addDecoration: (JSAlias named: aString)
]

{ #category : #decorations }
JSObject >> apply: aCollection [ 
	"Apply aCollection of arguments."
	
	self addDecoration: (JSApply new arguments: aCollection)
]

{ #category : #decorations }
JSObject >> assign: anObject [ 
	"Assign anObject to the receiver."
	
	self addDecoration: (JSAssignment new object: anObject)
]

{ #category : #decorations }
JSObject >> assignLocalTo: aString [ 
	"Assign the receiver to a local variable aString."
	
	self addDecoration: (JSAssignLocal named: aString)
]

{ #category : #decorations }
JSObject >> assignTo: aString [ 
	"Assign the receiver to a global variable aString."
	
	self addDecoration: (JSAssign named: aString)
]

{ #category : #decorations }
JSObject >> call: aString [
	"Call the method named aString."

	self call: aString withArguments: #()
]

{ #category : #decorations }
JSObject >> call: aString with: anObject [
	"Call the method named aString with anObject as its argument."

	self call: aString withArguments: (Array with: anObject)
]

{ #category : #decorations }
JSObject >> call: aString with: anObject1 with: anObject2 [
	"Call the method named aString with anObject1 and anObject2 as its arguments."

	self call: aString withArguments: (Array with: anObject1 with: anObject2)
]

{ #category : #decorations }
JSObject >> call: aString with: anObject1 with: anObject2 with: anObject3 [
	"Call the method named aString with anObject1 and anObject2 and anObject3 as its arguments."

	self call: aString withArguments: (Array with: anObject1 with: anObject2 with: anObject3)
]

{ #category : #decorations }
JSObject >> call: aString withArguments: anArray [
	"Call the method named aString with anArray as arguments."

	self addDecoration: (JSCall new 
		name: aString;
		arguments: anArray;
		yourself)
]

{ #category : #decorations }
JSObject >> condition: anObject [ 
	"Treat anObject as a condition to the execution of the receiver."
	
	self addDecoration: (JSCondition on: anObject)
]

{ #category : #decorations }
JSObject >> condition: anObject  else: otherObject [
	"Treat anObject as a condition to the execution of the receiver."
	
	self addDecoration: (JSConditionElse on: anObject else: otherObject)
]

{ #category : #convenience }
JSObject >> confirm: anObject [ 
	"Show a confirmation with the message anObject before evaluating the receiver."
	
	self condition: (JSStream new
		nextPutAll: 'confirm';
		argument: anObject)
]

{ #category : #decorations }
JSObject >> create [
	"Instantiate the receiver."
	
	self addDecoration: JSCreate new
]

{ #category : #accessing }
JSObject >> decoration [
	"Answer the top-level decoration in the receivers decoration stack."

	^ decoration
]

{ #category : #printing }
JSObject >> greaseString [
	^ String streamContents: [ :stream | stream javascript: self ]
]

{ #category : #initialization }
JSObject >> initialize [
	super initialize.
	decoration := self
]

{ #category : #decorations }
JSObject >> interval: aDuration [
	"Execute the receiver every aDuration."

	self addDecoration: (JSInterval duration: aDuration)
]

{ #category : #testing }
JSObject >> isJavascript [
	^ true
]

{ #category : #printing }
JSObject >> javascriptContentOn: aStream [
	"Generate the JavaScript string of the receiver. Override this method in subclasses to define custom JavaScript code. Note, if you run into this method, you likely use old Seaside code need to rename #printContentOn: to #javascriptContentOn:."
	
	self subclassResponsibility
]

{ #category : #printing }
JSObject >> javascriptOn: aStream [
	"Generate the JavaScript code from the receiver by dispatching to the outermost surrounding decoration. Do not override this method, instead override #javascriptContentOn:."

	self decoration javascriptContentOn: aStream
]

{ #category : #decorations }
JSObject >> not [
	"Negate the receiver logically."
	
	self addDecoration: JSNegation new
]

{ #category : #printing }
JSObject >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' ('; javascript: self; nextPut: $)
]

{ #category : #decorations }
JSObject >> property: aString [ 
	"Treat anObject as a condition to the execution of the receiver."
	
	self addDecoration: (JSProperty named: aString)
]

{ #category : #utilities }
JSObject >> render: aRenderable [
	"Render aRenderable and answer the resulting string."
	
	^ String streamContents: [ :stream | self render: aRenderable on: stream ]
]

{ #category : #utilities }
JSObject >> render: aRenderable on: aStream [
	"Render aRenderable on aStream."
	
	| document |
	document := (WAHtmlDocument
		on: aStream
		codec: self requestContext codec)
		scriptGenerator: self requestContext handler scriptGeneratorClass new;
		yourself.
	self renderContext document: document during: [
		(self rendererClass context: self renderContext)
			render: aRenderable; flush ].
	document scriptGenerator closeOn: document
]

{ #category : #accessing }
JSObject >> renderContext [
	"Answer the current WARenderContext."

	^ renderContext
]

{ #category : #accessing }
JSObject >> rendererClass [
	"Answer the class that should be used when rendering objects."

	^ rendererClass ifNil: [ rendererClass := WARenderer default ]
]

{ #category : #accessing }
JSObject >> rendererClass: aRendererClass [
	"Specify the class that should be used when rendering objects."

	rendererClass := aRendererClass
]

{ #category : #convenience }
JSObject >> return: anObject [ 
	"Return anObject after evaluating the receiver."
	
	self , (JSStream new
		nextPutAll: 'return ';
		javascript: anObject)
]

{ #category : #utilities }
JSObject >> script: aBlock [
	"Evaluate aBlock and answer the string of the generated script."
	
	^ String streamContents: [ :stream | self script: aBlock on: stream ]
]

{ #category : #utilities }
JSObject >> script: aBlock on: aStream [
	"Evaluate aBlock and pass in a script object that is subsequently written to aStream."

	| script document |
	document := (WAHtmlDocument
		on: aStream
		codec: self requestContext codec)
		scriptGenerator: self requestContext handler scriptGeneratorClass new;
		yourself.
	self renderContext document: document during: [ 
		script := (JSScript context: self renderContext)
			rendererClass: self rendererClass;
			yourself.
		aBlock value: script.
		script addAll: document loadScripts ].
	script javascriptOn: aStream
]

{ #category : #initialization }
JSObject >> setContext: aRenderContext [
	renderContext := aRenderContext
]

{ #category : #decorations }
JSObject >> setTimeout: aDuration [ 
	"Evaluates the receiver after aDuration."
	
	self addDecoration: (JSTimeout duration: aDuration)
]

{ #category : #decorations }
JSObject >> then: anObject [
	"Evaluates anObject if the receiver treated as a boolean evaluates to true."

	self then: anObject else: nil
]

{ #category : #decorations }
JSObject >> then: anObject else: anotherObject [ 
	"Evaluates anObject if the receiver treated as a boolean evaluates to true, otherwise evaluate anotherObject."
	
	self addDecoration: (JSIfThenElse new
		trueStatement: anObject;
		falseStatement: anotherObject)
]

{ #category : #decorations }
JSObject >> | anObject [ 
	"Combine the receiver and anObject with a logical OR."
	
	self addDecoration: (JSBinary new operator: '||'; statement: anObject)
]
