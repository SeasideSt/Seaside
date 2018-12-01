Class {
	#name : #WAHalo,
	#superclass : #WAObject,
	#instVars : [
		'root',
		'mode',
		'plugins'
	],
	#category : 'Seaside-Development-Core'
}

{ #category : #'instance creation' }
WAHalo class >> on: aComponent [
	^ self basicNew initializeOn: aComponent; yourself
]

{ #category : #initialization }
WAHalo >> initializeOn: aComponent [
	self initialize.
	root := aComponent.
	mode := WAValueHolder with: self modes first.
	plugins := WAHaloPlugin allSubclassesOn: self root for: self
]

{ #category : #accessing }
WAHalo >> mode [
	^ mode contents
]

{ #category : #accessing }
WAHalo >> mode: aSymbol [
	mode contents: aSymbol
]

{ #category : #accessing }
WAHalo >> modeSelector [
	^ (self mode greaseString , ':visitor:') asSymbol
]

{ #category : #accessing }
WAHalo >> modes [
	"Returns a list of possible display modes. These are selectors that are used to render the
	object we are wrapping. The current mode is selected by WAModeHaloPlugin."

	^ #( render source )
]

{ #category : #accessing }
WAHalo >> plugins [
	^ plugins
]

{ #category : #'rendering-modes' }
WAHalo >> render: html visitor: aPainterVisitor [
	"Render the object we are wrapping normally. See #modes."
	
	aPainterVisitor visit: self root
]

{ #category : #rendering }
WAHalo >> renderWithContext: aRenderContext visitor: aPainterVisitor [
	"Render the halo using aRenderContext. aPainterVisitor is the visitor that the halo
	visitor is wrapping; calling #visit: on it will perform the action that would have taken
	place had the halo wrapper not been present.
	"
	| html |
	html := WAHtmlCanvas context: aRenderContext.
	html div class: 'wa-halo'; with: [
		html div class: 'wa-halo-header'; with: [
			(self plugins select: [ :each | each isActive ])
				do: [ :each | html render: each ]
				separatedBy: [ html text: ' ' ] ].
		html div class: 'wa-halo-body'; with: [
			self perform: self modeSelector with: html with: aPainterVisitor ] ].
	html flush
]

{ #category : #accessing }
WAHalo >> root [
	^ root
]

{ #category : #'rendering-modes' }
WAHalo >> source: html visitor: aPainterVisitor [
	"Render the HTML source of the object we are wrapping using a pretty printed
	document. See #modes.
	Because we are using a new RenderContext, we can't use the passed-in visitor.
	Since we know we want to immediately render, we create a new WARenderVisitor to get
	things rolling. Rendering will then continue with the visitors in the context."
	
	| context |
	html div class: 'wa-halo-source'; with: [
		context := html context copy.
		context disableHalos.

		context document: (WAPrettyPrintedDocument context: html context).
		(WARenderVisitor context: context) start: self root.
		context document close ]
]

{ #category : #updating }
WAHalo >> updateStates: aSnapshot [
	"This class is not a Presenter but WAToolDecoration will make sure we get a chance
	to update the snapshot whenever it does."
	
	aSnapshot register: mode
]
