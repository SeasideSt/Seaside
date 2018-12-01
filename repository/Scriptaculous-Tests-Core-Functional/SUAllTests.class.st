Class {
	#name : #SUAllTests,
	#superclass : #WAComponent,
	#instVars : [
		'tabs',
		'selected'
	],
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #hooks }
SUAllTests >> children [
	^ selected collect: [ :each | each value ]
]

{ #category : #initialization }
SUAllTests >> initialize [
	super initialize.
	self initializeTabs.
	selected := tabs first value
]

{ #category : #initialization }
SUAllTests >> initializeTabs [
	tabs := OrderedCollection new
		add: 'Welcome' -> (Array
			with: 'Welcome' -> SUWelcomeTest new
			with: 'Counter' -> SUCounterTest new);
		add: 'Ajax' -> (Array
			with: 'Updater' -> SUUpdaterTest new
			with: 'Periodical' -> SUPeriodicalTest new
			with: 'Evaluator' -> SUEvaluatorTest new);
		add: 'Form' -> (Array
			with: 'Elements' -> SUFormTest new);
		add: 'Controls' -> (Array
			with: 'Autocompleter' -> SUAutocompleterTest new
			with: 'In Place Editor' -> SUInPlaceEditorTest new
			with: 'Slider' -> SUSliderTest new);
		add: 'Drag & Drop' -> (Array
			with: 'Drag & Drop' -> SUDragDropTest new
			with: 'Sortable' -> SUSortableTest new
			with: 'Sortable (two lists)' -> SUSortableDoubleTest new
			with: 'Tree' -> SUTreeTest new);
		add: 'Effects' -> (Array
			with: 'Effects' -> SUEffectsTest new
			with: 'Toggles' -> SUTogglesTest new
			with: 'Morph' -> SUMorphTest new);
		yourself
]

{ #category : #rendering }
SUAllTests >> renderChildrenOn: html [
	"Standard version of child layout."
	
	html div id: 'content'; with: [
		selected do: [ :each | html heading: each key; render: each value ] ]
]

{ #category : #rendering }
SUAllTests >> renderContentOn: html [
	self renderHeaderOn: html.
	self renderMenuOn: html.
	self renderChildrenOn: html
]

{ #category : #rendering }
SUAllTests >> renderHeaderOn: html [
	html div id: 'header'; with: [
		html image
			id: 'logo';
			url: SUAllTestLibrary / #logoGif;
			altText: self title ]
]

{ #category : #rendering }
SUAllTests >> renderMenuOn: html [
	html unorderedList id: 'menu'; with: [
		tabs do: [ :each |
			html listItem: [
				html anchor
					class: (selected = each value
						ifTrue: [ 'active' ]);
					callback: [ selected := each value ];
					with: each key ] ] ]
]

{ #category : #hooks }
SUAllTests >> states [
	^ Array with: self
]

{ #category : #accessing }
SUAllTests >> title [
	^ 'Seaside - script.aculo.us'
]

{ #category : #updating }
SUAllTests >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: self title
]
