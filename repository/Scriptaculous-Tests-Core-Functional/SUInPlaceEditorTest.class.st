Class {
	#name : #SUInPlaceEditorTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'text',
		'list',
		'selected'
	],
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #initialization }
SUInPlaceEditorTest >> initialize [
	super initialize.
	text := 'Click me, edit me.'.
	list := #( 'Daffy Duck' 'Danger Duck' 'Duck Dodgers' 'Melissa Duck' 'Plucky Duck' ).
	selected := list first
]

{ #category : #rendering }
SUInPlaceEditorTest >> renderContentOn: html [
	self renderInPlaceEditorOn: html.
	self renderInPlaceCollectionEditorOn: html
]

{ #category : #rendering }
SUInPlaceEditorTest >> renderInPlaceCollectionEditorOn: html [
	html paragraph
		script: (html scriptaculous inPlaceCollectionEditor
			collection: list;
			cancelControl: 'button';
			triggerInPlaceEditor: [ :value | selected := value ];
			callback: [ :r | r render: selected ]);
		with: selected

]

{ #category : #rendering }
SUInPlaceEditorTest >> renderInPlaceEditorOn: html [
	html paragraph
		script: (html scriptaculous inPlaceEditor
			cancelControl: 'button';
			triggerInPlaceEditor: [ :value | text := value ];
			callback: [ :r | r render: text ]);
		with: text

]
