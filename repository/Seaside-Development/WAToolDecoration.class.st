Class {
	#name : #WAToolDecoration,
	#superclass : #WADecoration,
	#instVars : [
		'plugins',
		'showHalos',
		'halos'
	],
	#category : 'Seaside-Development-Core'
}

{ #category : #testing }
WAToolDecoration class >> canBeRoot [
	^ true
]

{ #category : #'plugin-halos' }
WAToolDecoration >> haloFor: aPresenter [
	^ halos at: aPresenter ifAbsentPut: [ aPresenter haloClass on: aPresenter ]
]

{ #category : #initialization }
WAToolDecoration >> initialize [
	super initialize.
	showHalos := WAValueHolder with: false.
	halos := GRPlatform current weakDictionaryOfSize: 20.
	plugins := WAToolPlugin allSubclassesFor: self
]

{ #category : #testing }
WAToolDecoration >> isGlobal [
	^ true
]

{ #category : #accessing }
WAToolDecoration >> plugins [
	^ plugins
]

{ #category : #rendering }
WAToolDecoration >> renderChildOn: html [
	self showHalos ifTrue: [
		html context addHaloVisitor: (WAHaloVisitor decoration: self context: html context).
		html context enableHalos ].
	self renderNextOn: html.
	html context disableHalos
]

{ #category : #rendering }
WAToolDecoration >> renderContentOn: html [
	self renderChildOn: html.
	self renderToolbarOn: html
]

{ #category : #rendering }
WAToolDecoration >> renderToolbarOn: html [
	html div class: 'wa-toolbar'; with: [
		(self plugins select: [ :each | each isActive ])
			do: [ :each | html render: each ]
			separatedBy: [ html text: ' ' ] ]
]

{ #category : #'plugin-halos' }
WAToolDecoration >> showHalos [
	^ showHalos contents
]

{ #category : #hooks }
WAToolDecoration >> states [
	^ Array with: showHalos
]

{ #category : #'plugin-halos' }
WAToolDecoration >> toggleHalos [
	showHalos contents: showHalos contents not
]

{ #category : #updating }
WAToolDecoration >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	WADevelopmentFiles default updateRoot: anHtmlRoot
]

{ #category : #updating }
WAToolDecoration >> updateStates: aSnapshot [
	super updateStates: aSnapshot.
	"Create halos for all visible presenters at the end of the action phase so that we
	can properly snapshot their initial values (otherwise they get created in the render
	phase and we have no snapshot of the state for that render)."
	self showHalos ifTrue: [ self visiblePresentersDo: [ :each | self haloFor: each ] ].
	aSnapshot register: halos.
	halos do: [ :each  | each updateStates: aSnapshot ]
]
