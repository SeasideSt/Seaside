"
WAPharoServerAdapterSpecBrowser example
"
Class {
	#name : #WAPharoServerAdapterSpecBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'listModel',
		'textModel',
		'toolbarModel',
		'adaptor'
	],
	#category : 'Seaside-Pharo-Tools-Spec'
}

{ #category : #specs }
WAPharoServerAdapterSpecBrowser class >> defaultSpec [
	<spec>
	| delta |
	delta := 15.
	^ SpecLayout composed 
			add: #listModel origin: 0@0 corner: 1@0.5 offsetOrigin: 0@0 offsetCorner: 0@(delta negated);
			add: #toolbarModel origin: 0@0.5 corner: 1@0.5 offsetOrigin: 0@(delta negated) offsetCorner: 0@delta;
			add: #textModel origin: 0@0.5 corner: 1@1 offsetOrigin: 0@delta offsetCorner: 0@0;
			yourself
]

{ #category : #specs }
WAPharoServerAdapterSpecBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #ServerAdapterBrowser)
		order: 0.21;
		parent: #Tools;
		label: 'Seaside Control Panel';
		icon: (Smalltalk ui icons seasideAdaptorRunningIcon);
		action: [ WAPharoServerAdapterSpecBrowser open ]
]

{ #category : #example }
WAPharoServerAdapterSpecBrowser class >> open [
	"self open"
	WAPharoServerAdapterSpecBrowser new openWithSpec

]

{ #category : #specs }
WAPharoServerAdapterSpecBrowser class >> title [
	^'Seaside Control Panel'
]

{ #category : #'private - accessing' }
WAPharoServerAdapterSpecBrowser >> adapters: aList [
	self listModel items: aList
]

{ #category : #accessing }
WAPharoServerAdapterSpecBrowser >> adaptor [
	^ adaptor
]

{ #category : #'private - accessing' }
WAPharoServerAdapterSpecBrowser >> adaptorClasses [
	^ (WAServerAdaptor allSubclasses reject: [ :each | each isAbstract ])
		asSortedCollection: [ :a :b | a name < b name ]
]

{ #category : #accessing }
WAPharoServerAdapterSpecBrowser >> adaptorsMenu: aMenu [ 
	^ aMenu
		addGroup: [ :group | 
			group addItem: [ :item |				 
				item 
					name: 'Add adaptor...';					
					action: [ self addAdaptor ] ].
			group addItem: [ :item |
				item 
					name: 'Remove adaptor';
					enabled: [ self hasSelectedAdaptor ];	
					action: [ self removeAdaptor: self listModel selectedItem ] ] ];
		addGroup: [ :group | 
			group addItem: [ :item |
				item 
					name: 'Set adaptor encoding...';
					enabled: [ self hasSelectedAdaptor ];	
					action: [ self setEncodingFor: self listModel selectedItem ] ] ];
		addGroup: [ :group | 
			group addItem: [ :item |
				item 
					name: 'Clear configuration caches';
					action: [ self clearConfigurationCaches ] ].
			group addItem: [ :item |
				item 
					name: 'Clear sessions';
					action: [ self clearSessions ] ] ]
]

{ #category : #accessing }
WAPharoServerAdapterSpecBrowser >> adaptorsMenuMorph [
	| aMenu |
	aMenu := MenuModel new.
	aMenu	addGroup: [ :group | 
			group addItem: [ :item |				 
				item 
					name: 'Add adaptor...';					
					action: [ self addAdaptor ] ].
			group addItem: [ :item |
				item 
					name: 'Remove adaptor';
					enabled: [ self hasSelectedAdaptor ];	
					action: [ self removeAdaptor: self listModel selectedItem ] ] ];
		addGroup: [ :group | 
			group addItem: [ :item |
				item 
					name: 'Set adaptor encoding...';
					enabled: [ self hasSelectedAdaptor ];	
					action: [ self setEncodingFor: self listModel selectedItem ] ] ];
		addGroup: [ :group | 
			group addItem: [ :item |
				item 
					name: 'Clear configuration caches';
					action: [ self clearConfigurationCaches ] ].
			group addItem: [ :item |
				item 
					name: 'Clear sessions';
					action: [ self clearSessions ] ] ].
	^ aMenu buildWithSpecAsPopup
]

{ #category : #actions }
WAPharoServerAdapterSpecBrowser >> addAdaptor [
	| allAdaptors class port |
	allAdaptors := self adaptorClasses.
	class := UIManager default
		chooseFrom: (allAdaptors collect: [ :each | each name ])
		values: allAdaptors
		lines: #()
		title: 'Add Seaside Adaptor' translated.
	class ifNotNil:[
		port := UIManager default
			request: 'Enter a port number' 
			initialAnswer: class basicNew defaultPort greaseString.
		(port isNil or: [ port isEmpty or: [ port isAllDigits not ] ]) ifFalse:[
			adaptor := class port: port greaseInteger.
			self initializeAdaptors ] ]
]

{ #category : #actions }
WAPharoServerAdapterSpecBrowser >> clearConfigurationCaches [
	WAAdmin clearConfigurationCaches
]

{ #category : #actions }
WAPharoServerAdapterSpecBrowser >> clearSessions [
	WAAdmin clearSessions
]

{ #category : #'private - accessing' }
WAPharoServerAdapterSpecBrowser >> codecs [
	^ GRCodec allCodecs asSortedCollection: [ :a :b | a name < b name ]
]

{ #category : #'private - enablement' }
WAPharoServerAdapterSpecBrowser >> disableAllButtons [

	self toolbarModel startButton enabled: false.
	self toolbarModel stopButton enabled: false.
	self toolbarModel browseButton enabled: false
]

{ #category : #'private - enablement' }
WAPharoServerAdapterSpecBrowser >> enableBrowseButton [

	self toolbarModel browseButton enabled: true
]

{ #category : #'private - enablement' }
WAPharoServerAdapterSpecBrowser >> enableStartButton [

	self toolbarModel startButton enabled: true
]

{ #category : #'private - enablement' }
WAPharoServerAdapterSpecBrowser >> enableStopButton [

	self toolbarModel stopButton enabled: true
]

{ #category : #'private - testing' }
WAPharoServerAdapterSpecBrowser >> hasSelectedAdaptor [

	^ adaptor notNil
]

{ #category : #'private - accessing' }
WAPharoServerAdapterSpecBrowser >> iconForAdaptor: anAdaptor [

	^ anAdaptor isRunning 
		ifTrue: [ Smalltalk ui icons seasideAdaptorRunningIcon ] 
		ifFalse: [ Smalltalk ui icons seasideAdaptorStoppedIcon ]
]

{ #category : #initialization }
WAPharoServerAdapterSpecBrowser >> initializeAdaptors [
	self adapters: WAServerManager default adaptors
]

{ #category : #initialization }
WAPharoServerAdapterSpecBrowser >> initializePresenter [

	self initializeAdaptors.
	
	textModel aboutToStyle: false.
	
	listModel 
		whenSelectedItemChanged: [ :selection | adaptor := selection. self updateUIState ];
		whenListChanged: [ self updateUIState ];
		displayBlock: [ :item | (item class name,' ',item statusString) asStringMorph ];
		icons: [ :item | self iconForAdaptor: item ].
	(Smalltalk globals hasClassNamed: 'FastTableModel') ifFalse: [
		"only needed for NewListModel"
		listModel iconMaxSize: 16@16;
				menu: [ :aMenu | self adaptorsMenu: aMenu ]] ifTrue: [ 
		listModel menu: [ self adaptorsMenuMorph ]].

	self focusOrder
		add: listModel;
		add: toolbarModel;
		add: textModel.
	
	self disableAllButtons
]

{ #category : #initialization }
WAPharoServerAdapterSpecBrowser >> initializeWidgets [

	self instantiateModels:((Smalltalk globals hasClassNamed: 'FastTableModel')
		ifTrue: [ #(
			listModel FastTableModel
			textModel TextModel
			toolbarModel WAServerAdapterToolbar) ]
		ifFalse: [ #(
			listModel NewListModel
			textModel TextModel
			toolbarModel WAServerAdapterToolbar) ])
]

{ #category : #accessing }
WAPharoServerAdapterSpecBrowser >> listModel [
	^ listModel
]

{ #category : #actions }
WAPharoServerAdapterSpecBrowser >> removeAdaptor: anAdaptor [
	anAdaptor isStopped ifTrue: [ anAdaptor unregister ].
	self initializeAdaptors
]

{ #category : #actions }
WAPharoServerAdapterSpecBrowser >> setEncodingFor: anAdaptor [
	| codec |
	codec := UIManager default
		chooseFrom: (self codecs collect: [ :each | each name ]) 
		values: self codecs
		lines: #()
		title: 'Select encoding' translated.
	codec isNil
		ifTrue: [ ^ self ].
	anAdaptor codec: codec
]

{ #category : #actions }
WAPharoServerAdapterSpecBrowser >> startAdaptor [
	adaptor ifNotNil: [ adaptor start ].
	self updateUIState
]

{ #category : #actions }
WAPharoServerAdapterSpecBrowser >> stopAdaptor [
	adaptor ifNotNil: [ adaptor stop ].
	self updateUIState
]

{ #category : #accessing }
WAPharoServerAdapterSpecBrowser >> textModel [
	^ textModel
]

{ #category : #accessing }
WAPharoServerAdapterSpecBrowser >> toolbarModel [
	^ toolbarModel
]

{ #category : #private }
WAPharoServerAdapterSpecBrowser >> updateUIState [

	self disableAllButtons.
	"Update the list -- need to separately send the icon changed message or it does not get refreshed..."
	listModel updateList.
	listModel setSelectedItem: adaptor.
	listModel changed: #iconForItem:at:.
	
	adaptor isNil ifTrue: [
				textModel text: ''.
				textModel behavior: nil ]
	             ifFalse: [ 
				adaptor canStart
					ifTrue: [ self enableStartButton ].
				adaptor canStop
					ifTrue: [ self enableStopButton ].
				self enableBrowseButton.
				textModel text: (String streamContents: [ :stream |
			stream 
				nextPutAll: 'Type: '; nextPutAll: adaptor class name; nextPut: Character cr;
				nextPutAll: 'Port: '; nextPutAll: adaptor port greaseString; nextPut: Character cr;
				nextPutAll: 'Encoding: '; nextPutAll: adaptor codec name; nextPut: Character cr.
			adaptor additionalStatusOn: stream.
			stream
				nextPutAll: adaptor statusString ]) ]
]
