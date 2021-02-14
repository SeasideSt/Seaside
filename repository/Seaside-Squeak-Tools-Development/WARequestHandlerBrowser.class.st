"
I am the Seaside Request Handler Browser, a user interface to Seaside's 
request handler tree and configuration for each handler.

Start me with

	WARequestHandlerBrowser open

"
Class {
	#name : #WARequestHandlerBrowser,
	#superclass : #WAControlTool,
	#instVars : [
		'dispatcher',
		'handler',
		'attribute'
	],
	#category : 'Seaside-Squeak-Tools-Development'
}

{ #category : #'instance creation' }
WARequestHandlerBrowser class >> newDefault [

	^ self new
		dispatcher: WAAdmin defaultDispatcher;
		yourself

]

{ #category : #configuration }
WARequestHandlerBrowser class >> title [

	^ 'Request Handler Browser'
]

{ #category : #actions }
WARequestHandlerBrowser >> addHandler: type inDispatcher: aWADispatcher [

	(UIManager default request: 'Entry point name:') ifNotNil: [:name |
		name ifNotEmpty: [ | newHandler |
			newHandler := WAAdmin register: type at: name in: aWADispatcher.
			newHandler isApplication ifTrue: [
				WAAdmin configureNewApplication: newHandler].
			self changed: #rootHandlers.
			self handler: newHandler]].

]

{ #category : #accessing }
WARequestHandlerBrowser >> attribute [

	^ attribute
]

{ #category : #accessing }
WARequestHandlerBrowser >> attribute: anObject [

	attribute := anObject.
	self changed: #attribute.
]

{ #category : #actions }
WARequestHandlerBrowser >> attributeClearValue [

	self attribute ifNotNil: [:a | 
		self configuration removeExpressionAt: a key.
		self changed: #attribute.
		self changed: #groupedAttributes.
		self changed: #expandRootsRequested].
]

{ #category : #'configuration - attributes' }
WARequestHandlerBrowser >> attributeMenu: aMenu [

	self attribute ifNotNil: [:a |
		aMenu addList: #(
			('Clear value' attributeClearValue 'Clear the attributes value'))].
	^aMenu
]

{ #category : #building }
WARequestHandlerBrowser >> buildConfigurationPaneWith: builder [

	^  builder pluggableTreeSpec new
		model: self ;
		roots: #groupedAttributes ;
		hasChildren: #configurationIsGroup: ;
		getChildren: #configurationChildrenOf: ;
		label: #configurationLabelOf: ;
		icon: #configurationIconOf: ;
		setSelected: #attribute: ;
		getSelected: #attribute ;
		menu: #attributeMenu: ;
		columns: {
			[:listMorph | (listMorph filteredItems collect: [:item |
				item preferredWidthOfColumn: 1]) max].
			nil "take all the space"};
		yourself
]

{ #category : #building }
WARequestHandlerBrowser >> buildDispatcherTreeWith: builder [

	^  builder pluggableTreeSpec new
		model: self ;
		roots: #rootHandlers ;
		hasChildren: #isDispatcher: ;
		getChildren: #handlersOfDispatcher: ;
		setSelected: #handler: ;
		getSelected: #handler ;
		label: #handlerNameOf: ;
		menu: #handlerMenu: ;
		autoDeselect: false.

]

{ #category : #building }
WARequestHandlerBrowser >> buildWith: builder [
	| windowSpec tool |
	windowSpec := self buildWindowWith: builder specs: {
		(0 @ 0 corner: 0.25 @ 1) -> [self buildDispatcherTreeWith: builder].
		(0.25 @ 0 corner: 1 @ 1) -> [self buildConfigurationPaneWith: builder].
"		(0.0 @ 0.0 corner: 1.0 @ 0.5) -> [self buildAdaptorsListWith: builder].
		(0.0 @ 0.5 corner: 1.0 @ 1.0) -> [self buildInformationPaneWith: builder].
"	}.
	tool := builder build: windowSpec.
	self changed: #expandRootsRequested.
	^ tool

]

{ #category : #accessing }
WARequestHandlerBrowser >> configuration [

	^ self handler ifNotNil: [:h | h configuration]
]

{ #category : #'configuration - attributes' }
WARequestHandlerBrowser >> configurationChildrenOf: anAssociationOrList [

	^ anAssociationOrList value
]

{ #category : #'configuration - attributes' }
WARequestHandlerBrowser >> configurationIconNameFor: aWAAtrribute [

	(self configuration hasExpressionAt: aWAAtrribute key)
		ifTrue: [^ #arrowUp].
	^ #blank

]

{ #category : #'configuration - attributes' }
WARequestHandlerBrowser >> configurationIconOf: aConfiguration [

	(self configurationIsGroup: aConfiguration) ifTrue: [^ nil].
	
	^ ToolIcons iconNamed: (self configurationIconNameFor: aConfiguration)

]

{ #category : #'configuration - attributes' }
WARequestHandlerBrowser >> configurationIsGroup: anAssociationOrList [

	" Baaaah "
	^ anAssociationOrList isKindOf: Association
	
]

{ #category : #'configuration - attributes' }
WARequestHandlerBrowser >> configurationLabelOf: aWAAttribute [

	^ (self configurationIsGroup: aWAAttribute)
		ifTrue: [(self labelForSelector: aWAAttribute key) asText allBold]
		ifFalse: [
			(self configuration at: aWAAttribute key)
				ifNil: [(aWAAttribute label, String tab, '(unset)') asText addAttribute: TextColor gray]
				ifNotNil: [:val |
					aWAAttribute label, String tab, (aWAAttribute stringForValue: val)]]
]

{ #category : #accessing }
WARequestHandlerBrowser >> dispatcher [

	^ dispatcher
]

{ #category : #accessing }
WARequestHandlerBrowser >> dispatcher: anObject [

	dispatcher := anObject
]

{ #category : #accessing }
WARequestHandlerBrowser >> groupedAttributes [
	| groups attributes  |
	groups := Dictionary new.
	attributes := OrderedCollection new.
	^ self configuration 
		ifNil: [#()]
		ifNotNil: [:c|
			c allAttributes do: [ :each |
				(groups
					at: each group
					ifAbsentPut: [ SortedCollection sortBlock: [ :a :b | a key <= b key ] ])
						add: each ].
			groups associations sorted]
]

{ #category : #accessing }
WARequestHandlerBrowser >> handler [

	^ handler
]

{ #category : #accessing }
WARequestHandlerBrowser >> handler: anObject [

	handler := anObject.
	self changed: #handler.
	self changed: #groupedAttributes.
	self changed: #expandRootsRequested.

]

{ #category : #handlers }
WARequestHandlerBrowser >> handlerMenu: aMenu [

	self handler ifNotNil: [:h |
		h isDispatcher ifTrue: [self handlerMenu: aMenu addAddHandlerMenuFor: h].
		h ~= self dispatcher ifTrue: [
			aMenu addList: #(-
				('Remove' handlerRemove 'Remove the handler from the dispatcher'))]].
	^aMenu
]

{ #category : #handlers }
WARequestHandlerBrowser >> handlerMenu: aMenu addAddHandlerMenuFor: h [
	"sorry for that name. It fits, tho"
	WARequestHandler concreteSubclasses do: [ :each | 
		aMenu
			add: 'Add ', each description
			target: self
			selector: #addHandler:inDispatcher:
			argumentList: {each . h}].
]

{ #category : #handlers }
WARequestHandlerBrowser >> handlerNameOf: aWAApplication [ 
	
	^ aWAApplication isRoot
		ifTrue: ['/' asText allBold]
		ifFalse: [aWAApplication name]
]

{ #category : #actions }
WARequestHandlerBrowser >> handlerRemove [

	self handler ifNotNil: [:h |
		h ~= self dispatcher ifTrue: [
			h parent unregister: h.
			self handler: nil.
			self changed: #rootHandlers]].
 

]

{ #category : #handlers }
WARequestHandlerBrowser >> handlersOfDispatcher: aWADispatcher [

	^ aWADispatcher isDispatcher
		ifTrue: [ | dict |
			dict := Dictionary new.
			aWADispatcher handlers keysAndValuesDo: [:key :value |
				dict at: key put: value].
			dict]
		ifFalse: [#()]
]

{ #category : #handlers }
WARequestHandlerBrowser >> isDispatcher: aWARequestHandler [

	^ aWARequestHandler isDispatcher

]

{ #category : #accessing }
WARequestHandlerBrowser >> rootHandlers [

	^ { self dispatcher }
]
