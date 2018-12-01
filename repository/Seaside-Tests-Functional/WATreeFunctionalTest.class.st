Class {
	#name : #WATreeFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'selected',
		'tree'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WATreeFunctionalTest >> children [
	^ Array with: tree
]

{ #category : #initialization }
WATreeFunctionalTest >> initialize [
	super initialize.
	tree := WATree new
		root: Collection;
		labelBlock: [ :class | class name ];
		childrenBlock: [ :class | class subclasses ];
		selectBlock: [ :class | selected := class name ];
		canSelectBlock: [ :class | class subclasses notEmpty ];
		yourself
]

{ #category : #rendering }
WATreeFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.
	self renderTreeOn: html
]

{ #category : #rendering }
WATreeFunctionalTest >> renderExplanationOn: html [
	html paragraph: [
		html text: 'This is a functional test for WATree.'.
		html orderedList: [
			html listItem: 'Clicking on ''+'' should expand a node'.
			html listItem: 'Clicking on ''-'' should collapse a node'.
			html listItem: 'Clicking on a node should display its name after ''Selected:'''.
			html listItem: 'Leaf nodes should not be clickable' ] ]
]

{ #category : #rendering }
WATreeFunctionalTest >> renderTreeOn: html [
	html strong: 'Selected:'.
	html render: selected.
	
	html render: tree
]

{ #category : #hooks }
WATreeFunctionalTest >> states [
	^ Array with: self
]
