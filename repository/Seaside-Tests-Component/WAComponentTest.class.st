Class {
	#name : #WAComponentTest,
	#superclass : #TestCase,
	#instVars : [
		'log',
		'root',
		'decoration1',
		'decoration2',
		'child1',
		'child2',
		'child3',
		'child4'
	],
	#category : 'Seaside-Tests-Component-Tests'
}

{ #category : #private }
WAComponentTest >> assertLog: anArray [
	self
		assert: log asArray = anArray
		description: 'Expected ' , anArray printString , ', but got ' , log asArray printString.
	log := OrderedCollection new
]

{ #category : #private }
WAComponentTest >> assertRenders: aString [
	| guide |
	guide := self renderingGuide start: root.
	self assert: guide client renderContext document stream contents = aString
]

{ #category : #private }
WAComponentTest >> log: aString [
	log add: aString
]

{ #category : #accessing }
WAComponentTest >> renderContext [
	^ WARenderContext new
		actionUrl: WAUrl new;
		document: (WAHtmlDocument on: (WriteStream on: String new));
		yourself
]

{ #category : #accessing }
WAComponentTest >> renderingGuide [
	| context guide |
	context := self renderContext.
	guide := WARenderingGuide client: (WARenderVisitor context: context).
	context visitor: guide.
	^ guide
]

{ #category : #running }
WAComponentTest >> setUp [
	super setUp.
	log := OrderedCollection new.
	root := WAComponentStub new.
	decoration1 := WADecorationStub new.
	decoration2 := WADecorationStub new.
	child1 := WAComponentStub new.
	child2 := WAComponentStub new.
	child3 := WAComponentStub new.
	child4 := WAComponentStub new
]

{ #category : #tests }
WAComponentTest >> testActiveComponent [

	" single root component "
	self assert: root activeComponent = root.

	" add two children "
	root onChildren: [ Array with: child1 with: child2 ].
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child2.

	" add two decorations "
	root addDecoration: decoration1; addDecoration: decoration2.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child2.
	
	" delegate to another component "
	child2 show: child3.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child3.
	self assert: child3 activeComponent = child3.
	
	" delegate to yet another component "
	child3 show: child4.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child4.
	self assert: child3 activeComponent = child4.
	self assert: child4 activeComponent = child4
	
]

{ #category : #tests }
WAComponentTest >> testAddDecoration [
	self assert: (root addDecoration: decoration1) = decoration1.
	self assert: (root decorations size = 1).
	self assert: (root decorations first = decoration1).
	
	self assert: (root addDecoration: decoration2) = decoration2.
	self assert: (root decorations size = 2).
	self assert: (root decorations first = decoration2).
	self assert: (root decorations last = decoration1)
]

{ #category : #tests }
WAComponentTest >> testChildComponentShouldNotBeSelfError [
	child1 onRender: [ :html | html text: '1' ].
	child2 onRender: [ :html | html text: '2' ].
	root onChildren: [ Array with: child1 with: child2 ].

	"render so that we ensure component iterates over it's children"	
	self assertRenders: '12'.
	
	root onChildren: [ Array with: child1 with: root ].

	self
		should: [ self assertRenders: 'dont care only interested in the raised exception' ] 
		raise: WAChildComponentShouldNotBeSelfError
		description: 'Testing WAPresenter  >> #childrenDo: with #children returning an array including self'
]

{ #category : #tests }
WAComponentTest >> testDecorations [
	self assert: root decorations isEmpty.
	root show: child1.
	self assert: root decorations size = 1.
	root addDecoration: decoration1.
	self assert: root decorations size = 2

]

{ #category : #tests }
WAComponentTest >> testDelegations [
	self assert: root delegations isEmpty.
	root show: child1.
	self assert: root delegations size = 1.
	root addDecoration: decoration1.
	self assert: root delegations size = 1
]

{ #category : #tests }
WAComponentTest >> testHome [
	root show: child1.
	child1 show: child2.
	self assert: root activeComponent = child2.
	self assert: child1 activeComponent = child2.
	
	root home.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child2.
	self assert: child2 activeComponent = child2.
	
	child1 home.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child2.
	
	child2 home.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child2
]

{ #category : #tests }
WAComponentTest >> testInitialRequest [
	| request guide |
	request := WARequest new.

	root onInitialRequest: [ :each |
		self assert: each = request.
		self log: 'root' ].
	child1 onInitialRequest: [ :each |
		self assert: each = request.
		self log: 'child1' ].
	child2 onInitialRequest: [ :each |
		self assert: each = request.
		self log: 'child2' ].
	child3 onInitialRequest: [ :each |
		self assert: each = request.
		self log: 'child3' ].
	decoration1 onInitialRequest: [ :each |
		self assert: each = request.
		self log: 'decoration1' ].
	decoration2 onInitialRequest: [ :each |
		self assert: each = request.
		self log: 'decoration2' ].

	guide := WAAllPresenterGuide client: (WAInitialRequestVisitor request: request).

	" single root component "
	guide start: root.
	self assertLog: #('root').

	" add two children "
	root onChildren: [ Array with: child1 with: child2 ].
	guide start: root.
	self assertLog: #('root' 'child1' 'child2').

	" add two decorations "
	root addDecoration: decoration1; addDecoration: decoration2.
	guide start: root.
	self assertLog: #('decoration2' 'decoration1' 'root' 'child1' 'child2').
	
	
	" delegate to another component "
	child2 show: child3.
	guide start: root.
	self assertLog: #('decoration2' 'decoration1' 'root' 'child1' 'child3' 'child2')
]

{ #category : #tests }
WAComponentTest >> testRemoveDecoration [
	root addDecoration: decoration1; addDecoration: decoration2.
	self assert: (root removeDecoration: decoration2) = decoration2.
	self assert: (root decorations size = 1).
	self assert: (root decorations first = decoration1).
	
	root addDecoration: decoration2.
	self assert: (root removeDecoration: decoration1) = decoration1.
	self assert: (root decorations size = 1).
	self assert: (root decorations first = decoration2).
	
	self assert: (root removeDecoration: decoration1) isNil.
	self assert: (root decorations size = 1).
	self assert: (root decorations first = decoration2).

	self assert: (root removeDecoration: decoration2) = decoration2.
	self assert: (root decorations isEmpty).
		
	self assert: (root removeDecoration: decoration2) isNil
]

{ #category : #tests }
WAComponentTest >> testRemoveDelegation [
	self assert: root delegations isEmpty.
	root show: child1.
	root show: child2.
	self assert: root delegations size = 2.
	root removeDelegation.
	self assert: root delegations size = 1.
	root removeDelegation.
	self assert: root delegations isEmpty.
	root removeDelegation.
	self assert: root delegations isEmpty
]

{ #category : #'tests-rendering' }
WAComponentTest >> testRenderingChildren [
	root onChildren: [ Array with: child1 with: child2 ].
	child1 onRender: [ :html | html text: '1' ].
	child2 onRender: [ :html | html text: '2' ].
	self assertRenders: '12'.
	
	root onRender: [ :html | html text: 'a'; render: child1; text: 'b'; render: child2; text: 'c' ].
	self assertRenders: 'a1b2c'.
	
	root onChildren: [ Array with: child2 with: child1 ].
	self assertRenders: 'a1b2c'.

	root onRender: [ :html | html text: 'a'; render: child2; text: 'b'; render: child1; text: 'c' ].
	self assertRenders: 'a2b1c'
]

{ #category : #'tests-rendering' }
WAComponentTest >> testRenderingDecoration [
	root onRender: [ :html | html text: 'r' ].
	root addDecoration: decoration1.
	
	decoration1 onRender: [ :html :cc | html text: '1'. cc value ].
	self assertRenders: '1r'.
	
	decoration1 onRender: [ :html :cc | cc value. html text: '1' ].
	self assertRenders: 'r1'.
	
	decoration1 onRender: [ :html :cc | html text: '1' ].
	self assertRenders: '1'
]

{ #category : #'tests-rendering' }
WAComponentTest >> testRenderingDelegation [
	root onRender: [ :html | html text: 'r' ].
	child1 onRender: [ :html | html text: '1' ].
	child2 onRender: [ :html | html text: '2' ].
	child3 onRender: [ :html | html text: '3' ].
	
	root show: child1.
	self assertRenders: '1'.
	
	child1 show: child2.
	self assertRenders: '2'.
	
	child2 answer.
	self assertRenders: '1'.
	
	root show: child3.
	self assertRenders: '3'.
	
	root home.
	self assertRenders: 'r'
	
	
	
]

{ #category : #tests }
WAComponentTest >> testUpdateRoot [
	| htmlRoot guide |
	htmlRoot := WAHtmlRoot new.

	root onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'root' ].
	child1 onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'child1' ].
	child2 onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'child2' ].
	child3 onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'child3' ].
	decoration1 onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'decoration1' ].
	decoration2 onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'decoration2' ].

	guide := WAVisiblePresenterGuide client: (WAUpdateRootVisitor root: htmlRoot).

	" single root component "
	guide start: root.
	self assertLog: #('root').

	" add two children "
	root onChildren: [ Array with: child1 with: child2 ].
	guide start: root.
	self assertLog: #('root' 'child1' 'child2').

	" add two decorations "
	root addDecoration: decoration1; addDecoration: decoration2.
	guide start: root.
	self assertLog: #('decoration2' 'decoration1' 'root' 'child1' 'child2').
	
	" delegate to another component "
	child2 show: child3.
	guide start: root.
	self assertLog: #('decoration2' 'decoration1' 'root' 'child1' 'child3')
]

{ #category : #tests }
WAComponentTest >> testUpdateStates [
	| snapshot guide |
	snapshot := WASnapshot new.

	root onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'root' ].
	child1 onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'child1' ].
	child2 onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'child2' ].
	child3 onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'child3' ].
	decoration1 onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'decoration1' ].
	decoration2 onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'decoration2' ].

	guide := WAAllPresenterGuide client: (WAUpdateStatesVisitor snapshot: snapshot).

	" single root component "
	guide start: root.
	self assertLog: #('root').

	" add two children "
	root onChildren: [ Array with: child1 with: child2 ].
	guide start: root.
	self assertLog: #('root' 'child1' 'child2').

	" add two decorations "
	root addDecoration: decoration1; addDecoration: decoration2.
	guide start: root.
	self assertLog: #('decoration2' 'decoration1' 'root' 'child1' 'child2').
	
	" delegate to another component "
	child2 show: child3.
	guide start: root.
	self assertLog: #('decoration2' 'decoration1' 'root' 'child1' 'child3' 'child2')
]

{ #category : #tests }
WAComponentTest >> testUpdateUrl [
	| url guide |
	url := WAUrl new.

	root onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'root' ].
	child1 onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'child1' ].
	child2 onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'child2' ].
	child3 onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'child3' ].
	decoration1 onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'decoration1' ].
	decoration2 onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'decoration2' ].

	guide := WAVisiblePresenterGuide client: (WAUpdateUrlVisitor url: url).

	" single root component "
	guide start: root.
	self assertLog: #('root').

	" add two children "
	root onChildren: [ Array with: child1 with: child2 ].
	guide start: root.
	self assertLog: #('root' 'child1' 'child2').

	" add two decorations "
	root addDecoration: decoration1; addDecoration: decoration2.
	guide start: root.
	self assertLog: #('decoration2' 'decoration1' 'root' 'child1' 'child2').
	
	" delegate to another component "
	child2 show: child3.
	guide start: root.
	self assertLog: #('decoration2' 'decoration1' 'root' 'child1' 'child3')
]
