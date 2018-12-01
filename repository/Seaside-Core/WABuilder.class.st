"
This is a convenience class which provides a result of a rendering operation as a string. It is expected to be used like this:

WAHtmlCanvas builder render: [ :html |
	html anchor
		url: 'htttp://www.seaside.st';
		with: 'Seaside Homepage' ]

See WABuilderCanvasTest for more examples.
"
Class {
	#name : #WABuilder,
	#superclass : #WAObject,
	#instVars : [
		'fullDocument',
		'rootBlock',
		'rootClass',
		'documentClass',
		'scriptGeneratorClass',
		'rendererClass',
		'codec',
		'actionUrl',
		'resourceUrl'
	],
	#category : 'Seaside-Core-Rendering'
}

{ #category : #'instance creation' }
WABuilder class >> on: aRendererClass [
	^ self new
		rendererClass: aRendererClass;
		yourself
]

{ #category : #accessing }
WABuilder >> actionUrl [
	^ actionUrl ifNil: [ actionUrl := WAUrl new ]
]

{ #category : #accessing }
WABuilder >> actionUrl: aUrl [
	actionUrl := aUrl
]

{ #category : #private }
WABuilder >> closeDocument: aDocument [
	self fullDocument 
		ifTrue: [ aDocument close ]
		ifFalse: [ 
			"hack to make it work"
			(aDocument isKindOf: WAHtmlDocument)
				ifTrue: [ aDocument scriptGenerator closeOn: aDocument ] ]
]

{ #category : #accessing }
WABuilder >> codec [
	^ codec ifNil: [
		 codec := [ self requestContext codec ] 
			on: WARequestContextNotFound
			do: [ :e | GRNullCodec new ] ]
]

{ #category : #accessing }
WABuilder >> codec: aCodec [
	codec := aCodec
]

{ #category : #accessing }
WABuilder >> documentClass [
	^ documentClass ifNil: [ documentClass := WADocument ]
]

{ #category : #accessing }
WABuilder >> documentClass: aDocumentClass [
	documentClass := aDocumentClass
]

{ #category : #accessing }
WABuilder >> fullDocument [
	^ fullDocument
]

{ #category : #accessing }
WABuilder >> fullDocument: aBoolean [
	fullDocument := aBoolean
]

{ #category : #initialization }
WABuilder >> initialize [
	super initialize.
	self fullDocument: false
]

{ #category : #private }
WABuilder >> openDocument: aDocument context: aContext [ 
	| documentRoot |
	self fullDocument ifFalse: [ ^ self ].
	documentRoot := self rootClass context: aContext.
	self rootBlock value: documentRoot.
	aDocument open: documentRoot
]

{ #category : #rendering }
WABuilder >> render: anObject [
	"Render anObject and return the contents of the resulting Document as a String.
	anObject must understand #renderOn:. Commonly anObject will be a one-argument
	block, which will be evaluated with the appropriate renderer."
	
	^ String streamContents: [ :stream |
		| context document renderer |
		document := self documentClass on: stream codec: self codec.
		document scriptGenerator: self scriptGeneratorClass new.
		context := WARenderContext new.
		context document: document.
		context actionUrl: self actionUrl; resourceUrl: self resourceUrl.
		renderer := self rendererClass context: context.
		
		self openDocument: document context: context.
		renderer render: anObject; flush.
		self closeDocument: document ]
]

{ #category : #accessing }
WABuilder >> rendererClass [
	^ rendererClass
]

{ #category : #accessing }
WABuilder >> rendererClass: aRendererClass [ 
	rendererClass := aRendererClass
]

{ #category : #accessing }
WABuilder >> resourceUrl [
	^ resourceUrl
]

{ #category : #accessing }
WABuilder >> resourceUrl: aUrl [
	resourceUrl := aUrl
]

{ #category : #accessing }
WABuilder >> rootBlock [
	^ rootBlock ifNil: [ rootBlock := [ :root | ] ]
]

{ #category : #accessing }
WABuilder >> rootBlock: anObject [
	rootBlock := anObject
]

{ #category : #accessing }
WABuilder >> rootClass [
	^ rootClass ifNil: [ rootClass := WARoot ]
]

{ #category : #accessing }
WABuilder >> rootClass: aRootClass [
	rootClass := aRootClass
]

{ #category : #accessing }
WABuilder >> scriptGeneratorClass [
	^ scriptGeneratorClass ifNil: [ scriptGeneratorClass := WADefaultScriptGenerator  ]
]

{ #category : #accessing }
WABuilder >> scriptGeneratorClass: aScriptGeneratorClass [
	scriptGeneratorClass := aScriptGeneratorClass
]
