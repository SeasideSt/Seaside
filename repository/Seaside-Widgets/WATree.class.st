"
WATree implements a tree menu, which supports nesting, collapsing and expanding. Prefixes items with ""+/-"" to indicate items that can be expanded/collapsed.

See class methods for simple example.


Instance Variables:
	canSelectBlock	<BlockClosure [:nodeInTree | ]>	returns true if user can select the argument of the block, if true node is an anchor
	childrenBlock	<BlockClosure [:nodeInTree | ]>	returns children (or subnodes) of the given node in the tree, sent to all nodes
	expanded	<IdentitySet>	Collection of all nodes that are currently expanded
	labelBlock	<[:nodeInTree | ]> returns text to display for given node
	root	<Object>	root or top level node in tree, childrenBlock is used to determine roots subnodes
	selectBlock	<BlockClosure [:selectedNode | ]>	called when an node is selected, put a callback to your code here
	selected	<Object>	currently selected node



"
Class {
	#name : #WATree,
	#superclass : #WACanvasWidget,
	#instVars : [
		'root',
		'selected',
		'expanded',
		'childrenBlock',
		'labelBlock',
		'canSelectBlock',
		'selectBlock'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #examples }
WATree class >> exampleClassBrowser [
	^ self new
		root: Collection;
		labelBlock: [ :class | class name ];
		childrenBlock: [ :class | class subclasses ];
		yourself
]

{ #category : #'instance creation' }
WATree class >> root: anObject [
	^ self new
		root: anObject;
		yourself
]

{ #category : #'instance creation' }
WATree class >> root: anObject path: anArray [
	^ (self root: anObject)
		expandAll: anArray;
		selected: anArray last;
		yourself
]

{ #category : #testing }
WATree >> canSelect: aNode [
	^ self selectBlock notNil and: [ self canSelectBlock isNil or: [ self canSelectBlock value: aNode ] ]
]

{ #category : #'accessing-configuration' }
WATree >> canSelectBlock [
	^ canSelectBlock
]

{ #category : #'accessing-configuration' }
WATree >> canSelectBlock: aBlock [
	canSelectBlock := aBlock
]

{ #category : #'accessing-configuration' }
WATree >> childrenBlock [
	^ childrenBlock
]

{ #category : #'accessing-configuration' }
WATree >> childrenBlock: aBlock [
	childrenBlock := aBlock
]

{ #category : #'accessing-nodes' }
WATree >> childrenOf: aNode [
	| children |
	children := self childrenBlock value: aNode.
	^ children ifNil: [ Array new ]
]

{ #category : #actions }
WATree >> collapse: aNode [
	expanded remove: aNode
]

{ #category : #actions }
WATree >> expand: aNode [
	expanded add: aNode
]

{ #category : #actions }
WATree >> expandAll: aCollection [
	expanded addAll: aCollection
]

{ #category : #testing }
WATree >> hasChildren: aNode [
	^ (self childrenOf: aNode) isEmpty not
]

{ #category : #initialization }
WATree >> initialize [
	super initialize.
	expanded := IdentitySet new.
	self selectBlock: [ :node | self answer: node ].
	self childrenBlock: [ :node | Array new ].
	self labelBlock: [ :node | node greaseString ]
]

{ #category : #testing }
WATree >> isExpanded: aNode [
	^ expanded includes: aNode
]

{ #category : #'accessing-configuration' }
WATree >> labelBlock [
	^ labelBlock
]

{ #category : #'accessing-configuration' }
WATree >> labelBlock: aBlock [
	labelBlock := aBlock
]

{ #category : #'accessing-nodes' }
WATree >> labelOf: aNode [
	^ self labelBlock value: aNode
]

{ #category : #rendering }
WATree >> renderContentOn: html [
	self renderTreeOn: html
]

{ #category : #'rendering-nodes' }
WATree >> renderNode: aNode on: html [
	html listItem: [
		self renderNodeButton: aNode on: html.
		self renderNodeLabel: aNode on: html.
		self renderNodeChildren: aNode on: html ]
]

{ #category : #'rendering-nodes' }
WATree >> renderNodeButton: aNode on: html [ 
	| isExpanded |
	html span
		class: 'button';
		with: 
			[ (self hasChildren: aNode) ifTrue: 
				[ isExpanded := self isExpanded: aNode.
				self 
					renderNodeButtonLink: aNode
					action: (GRDelayedSend 
							receiver: self
							selector: (isExpanded 
									ifTrue: [ #collapse: ]
									ifFalse: [ #expand: ])
							argument: aNode)
					text: (isExpanded 
							ifTrue: [ '-' ]
							ifFalse: [ '+' ])
					on: html ] ]
]

{ #category : #'rendering-nodes' }
WATree >> renderNodeButtonLink: aNode action: aBlock text: anObject on: html [
	html anchor callback: aBlock; with: anObject
]

{ #category : #'rendering-nodes' }
WATree >> renderNodeChildren: aNode on: html [
	| children |
	children := self childrenOf: aNode.
	children isEmpty ifFalse: [
		(self isExpanded: aNode) ifTrue: [
			html unorderedList: [
				children do: [ :each |
					self renderNode: each on: html ] ] ] ]
]

{ #category : #'rendering-nodes' }
WATree >> renderNodeLabel: aNode on: html [ 
	| label |
	html span
		class: 'label';
		class: (self selected == aNode 
				ifTrue: [ 'active' ]
				ifFalse: [ 'inactive' ]);
		with: 
			[ label := self labelOf: aNode.
			(self canSelect: aNode) 
				ifFalse: [ html render: label ]
				ifTrue: 
					[ self 
						renderNodeLabelLink: aNode
						action: (GRDelayedSend 
								receiver: self
								selector: #select:
								argument: aNode)
						text: label
						on: html ] ]
]

{ #category : #'rendering-nodes' }
WATree >> renderNodeLabelLink: aNode action: aBlock text: anObject on: html [
	html anchor callback: aBlock; with: anObject
]

{ #category : #rendering }
WATree >> renderTreeOn: html [
	html unorderedList: [ self renderNode: self root on: html ]
]

{ #category : #accessing }
WATree >> root [
	^ root
]

{ #category : #accessing }
WATree >> root: aNode [
	root := aNode
]

{ #category : #actions }
WATree >> select: aNode [ 
	(self canSelect: aNode) ifFalse: [ ^ self ].
	self selected: aNode.
	self selectBlock isNil ifFalse: [ self selectBlock value: aNode ]
]

{ #category : #'accessing-configuration' }
WATree >> selectBlock [
	^ selectBlock
]

{ #category : #'accessing-configuration' }
WATree >> selectBlock: aBlock [
	selectBlock := aBlock
]

{ #category : #accessing }
WATree >> selected [
	^ selected
]

{ #category : #accessing }
WATree >> selected: aNode [
	selected := aNode
]

{ #category : #hooks }
WATree >> states [
	^ Array with: expanded
]
