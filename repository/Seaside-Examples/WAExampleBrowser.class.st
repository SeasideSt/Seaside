"
I browse all the examples available in the system ie all the results of class side methods beginning with #exampleComponent... 

If you want to see these examples point your browser to localhost:xxx/examples/examplebrowser
"
Class {
	#name : #WAExampleBrowser,
	#superclass : #WAExampleComponent,
	#instVars : [
		'class',
		'selector',
		'component',
		'hasAnswer',
		'answer'
	],
	#category : 'Seaside-Examples-Misc'
}

{ #category : #accessing }
WAExampleBrowser class >> description [
	^ 'Browse through Seaside examples'
]

{ #category : #'class initialization' }
WAExampleBrowser class >> initialize [
	WAAdmin register: self asApplicationAt: 'examples/examplebrowser'
]

{ #category : #helper }
WAExampleBrowser >> allClasses [
	^ (WAComponent allSubclasses
		select: [ :each |
			each class selectors
				anySatisfy: [ :sel | sel beginsWithSubCollection: self selectorPrefix ] ])
		asSortedCollection: [ :a :b | a name < b name ]
]

{ #category : #helper }
WAExampleBrowser >> allSelectors [
	^ (class class selectors select: [ :each | each beginsWithSubCollection: self selectorPrefix ]) sorted
]

{ #category : #hooks }
WAExampleBrowser >> children [
	^ Array with: component
]

{ #category : #accessing }
WAExampleBrowser >> class: aClass [
	class := aClass.
	self selector: self allSelectors first
]

{ #category : #accessing }
WAExampleBrowser >> component: aComponent [
	component := aComponent.
	hasAnswer := false.
	answer := nil.
	component onAnswer: [ :value | hasAnswer := true. answer := value ]
]

{ #category : #initialization }
WAExampleBrowser >> initialize [
	super initialize.
	self class: self allClasses first
]

{ #category : #rendering }
WAExampleBrowser >> renderChooserOn: html [
	html div class: 'chooser'; with: [
		html form: [
			html div: [
				html select
					selected: class;
					list: self allClasses;
					onChange: 'submit()';
					callback: [ :value | self class: value ] ] ].
		self allSelectors size > 1 ifTrue: [
			html form: [
				html div: [
					html select
						selected: selector;
						list: self allSelectors;
						onChange: 'submit()';
						callback: [ :value | self selector: value ] ] ] ] ]
]

{ #category : #rendering }
WAExampleBrowser >> renderComponentOn: html [

	html heading level4; with: component class headerForExampleBrowser.
	html div
		class: 'component';
		with: component.
	hasAnswer ifTrue: [
		html div
			class: 'answer';
			with: answer printString ]
]

{ #category : #rendering }
WAExampleBrowser >> renderContentOn: html [
	self renderChooserOn: html.
	self renderComponentOn: html
]

{ #category : #accessing }
WAExampleBrowser >> selector: aSymbol [
	selector := aSymbol.
	self component: (class perform: selector)
]

{ #category : #helper }
WAExampleBrowser >> selectorPrefix [
	^ 'exampleComponent'
]

{ #category : #hooks }
WAExampleBrowser >> states [
	^ Array with: self
]

{ #category : #hooks }
WAExampleBrowser >> style [
	^ '.chooser {
	background-color: #eee;
	padding: 5px;
}
.chooser form,
.chooser form div {
	display: inline;
}
.chooser form select {
	margin-right: 5px;
}
.component {
	padding: 5px;
}
.answer {
	background-color: #eee;
	padding: 5px;
}'
]
