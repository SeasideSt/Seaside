"
I am the Seaside Contorl Panel, a user interface to Seaside's request handler configuration.

Start me with

	WAControlPanel open

"
Class {
	#name : #WAControlPanel,
	#superclass : #WAControlTool,
	#instVars : [
		'manager',
		'adaptorsListIndex'
	],
	#category : 'Seaside-Squeak-Tools-Development'
}

{ #category : #'class initialization' }
WAControlPanel class >> initialize [
	TheWorldMenu registerOpenCommand: (Array
		with: 'Seaside Control Panel'
		with: (Array with: self with: #open)
		with: 'The Seaside Contorl Panel can be used to manage adaptors and request handlers')
]

{ #category : #'instance creation' }
WAControlPanel class >> newDefault [

	^ self onServerManager: WAAdmin defaultServerManager

]

{ #category : #'instance creation' }
WAControlPanel class >> onServerManager: aWAServerManager [

	^ self new
		manager: aWAServerManager;
		yourself
]

{ #category : #'instance creation' }
WAControlPanel class >> openDefault [

	^ (self onServerManager: WAAdmin defaultServerManager) open

]

{ #category : #configuration }
WAControlPanel class >> title [
	^ 'Seaside Control Panel'
]

{ #category : #'class initialization' }
WAControlPanel class >> unload [
	TheWorldMenu unregisterOpenCommandWithReceiver: self
]

{ #category : #accessing }
WAControlPanel >> adaptorAt: anIndex [

	^ self adaptors at: anIndex

]

{ #category : #accessing }
WAControlPanel >> adaptorAt: anIndex ifAbsent: aBlock [

	^ self adaptors at: anIndex ifAbsent: aBlock
]

{ #category : #'user interface' }
WAControlPanel >> adaptorClassFromUser [
	| allAdaptors |
	allAdaptors := self adaptorClasses.
	^ UIManager default
		chooseFrom: (allAdaptors collect: [:e | e name])
		values: allAdaptors
		lines: #()
		title: 'Add Seaside Adaptor' translated.
]

{ #category : #accessing }
WAControlPanel >> adaptorClasses [
	^ (WAServerAdaptor allSubclasses reject: [:each | each isAbstract])
		sorted: [:a :b | a name < b name]
]

{ #category : #testing }
WAControlPanel >> adaptorIsRunning [

	^ self selectedAdaptor
		ifNil: [false]
		ifNotNil: [:adaptor | adaptor isRunning]
	
]

{ #category : #testing }
WAControlPanel >> adaptorIsStopped [

	^ self selectedAdaptor
		ifNil: [false]
		ifNotNil: [:adaptor | adaptor isStopped]
	
]

{ #category : #accessing }
WAControlPanel >> adaptors [

	^ self manager adaptors asSortedCollection: [ :a :b | a port < b port]
]

{ #category : #accessing }
WAControlPanel >> adaptorsList [

	^  self adaptors collect: [ :each | self listNameFor: each ]
]

{ #category : #accessing }
WAControlPanel >> adaptorsListIndex [

	^ adaptorsListIndex ifNil: [0]
]

{ #category : #accessing }
WAControlPanel >> adaptorsListIndex: anObject [

	self updateAfter: [adaptorsListIndex := anObject].

]

{ #category : #menus }
WAControlPanel >> adaptorsMenu: aMenu [
	(Pragma allNamed: #menuItem:enabled:priority:help: in: self class sortedByArgument: 3)
		inject: 0 into: [:prio :p |
			(p argumentAt: 3) - prio >= 100 ifTrue: [aMenu addList: #(-)].
			 "= true because it can also be a symbol"
			((p argumentAt: 2) = true or: [self perform: (p argumentAt: 2)])
				ifTrue: [ | label |
					label := (p argumentAt: 1) isSymbol
						ifTrue: [self perform: (p argumentAt: 1)]
						ifFalse: [p argumentAt: 1].
					aMenu add: label help: (p argumentAt: 4) action: (p selector)].
			p argumentAt: 3].
	^ aMenu

]

{ #category : #actions }
WAControlPanel >> addAdaptor [
	<menuItem: 'Add adaptor...' enabled: true priority: 300 help: 'Add an adaptor to listen on a port'>
	self adaptorClassFromUser ifNotNil: [:cls |
		(self portFromUserFor: cls basicNew) ifNotNil: [:port |
			self updateAfter: [
				| adaptor |
				adaptor := cls port: port greaseInteger.
				(self codecFromUserFor: adaptor) ifNotNil: [:codec |
					adaptor codec: codec]]]]
]

{ #category : #actions }
WAControlPanel >> browseRequestHandler [
	<button: 'Browse' enabled: true help: 'Browse the request handler'>
	<menuItem: 'Browse' enabled: #hasSelectedAdaptor priority: 200 help: 'Browse the request handler of this adaptor'>
	self selectedAdaptor
		ifNil: [WARequestHandlerBrowser open]
		ifNotNil: [:a | 
			WARequestHandlerBrowser new
				dispatcher: a requestHandler;
				open].
]

{ #category : #building }
WAControlPanel >> buildAdaptorsListWith: builder [

	^ builder pluggableListSpec new
		model: self;
		list: #adaptorsList; 
		getIndex: #adaptorsListIndex; 
		setIndex: #adaptorsListIndex:;
		icon: #iconForIndex:;
		menu: #adaptorsMenu:; 
"		keyPress: #adaptorsListKey:from:;

"
		yourself
]

{ #category : #building }
WAControlPanel >> buildInformationPaneWith: builder [ 
	
	^ self buildPanelWith: builder specs: {
		(LayoutFrame
			fractions: (0.0 @ 0.0 corner: 1.0 @ 0.0)
			offsets: (0 @ 0 corner: 0 @ self buttonHeight)) -> [self buildButtonsWith: builder].
		(LayoutFrame
			fractions: (0.0 @ 0.0 corner: 1.0 @ 1.0)
			offsets: (0 @ self buttonHeight corner: 0 @ 0)) -> [self buildInformationTextWith: builder]
	}.

]

{ #category : #building }
WAControlPanel >> buildInformationTextWith: builder [ 

	^ builder pluggableTextSpec new
		model: self;
		readOnly: true;
		indicateUnacceptedChanges: false;
		softLineWrap: false;
		getText: #information; 
		yourself
]

{ #category : #building }
WAControlPanel >> buildWith: builder [
	| windowSpec |
	windowSpec := self buildWindowWith: builder specs: {
		(0.0 @ 0.0 corner: 1.0 @ 0.5) -> [self buildAdaptorsListWith: builder].
		(0.0 @ 0.5 corner: 1.0 @ 1.0)-> [self buildInformationPaneWith: builder].
	}.
	^ builder build: windowSpec
]

{ #category : #'user interface' }
WAControlPanel >> buttonHeight [
	^ Preferences standardButtonFont height * 3
]

{ #category : #actions }
WAControlPanel >> clearConfigurationCaches [
	<menuItem: 'Clear configuration caches' enabled: true priority: 700 help: 'Clear Seaside''s cached configuration information and rebuild'>
	WAAdmin clearConfigurationCaches
]

{ #category : #actions }
WAControlPanel >> clearSessions [
	<menuItem: 'Clear sessions' enabled: true priority: 700 help: 'Clear all Seaside sessions'>
	WAAdmin clearSessions
]

{ #category : #'user interface' }
WAControlPanel >> codecFromUserFor: anAdaptor [
	| allCodecs default |
	allCodecs := self codecs.
	default := anAdaptor defaultCodec.
	
	^ UIManager default
		chooseFrom: ((allCodecs collect: [:e | e name]) copyWithFirst: (default name, ' (default) '))
		values: (allCodecs copyWithFirst: default)
		lines: #(1)
		title: 'Select Codec (optional)' translated.
]

{ #category : #accessing }
WAControlPanel >> codecs [
	^ GRCodec allCodecs sorted: [:a :b | a name < b name]
]

{ #category : #testing }
WAControlPanel >> hasSelectedAdaptor [

	^ self selectedAdaptor notNil
	
]

{ #category : #building }
WAControlPanel >> iconForIndex: anIndex [

	| adaptor |
	adaptor := self adaptorAt: anIndex ifAbsent: [^ nil].
	adaptor isRunning ifTrue: [^self class seasideAdaptorRunningIcon].
	adaptor isStopped ifTrue: [^self class seasideAdaptorStoppedIcon].
	^ MenuIcons blankIconOfWidth: 12
]

{ #category : #accessing }
WAControlPanel >> information [
	^ self selectedAdaptor ifNotNil: [:adaptor | self informationForAdaptor: adaptor] ifNil: ['']
]

{ #category : #accessing }
WAControlPanel >> informationForAdaptor: aWAServerAdaptor [

	^ String streamContents: [ :stream |
		stream 
			nextPutAll: 'Type: '; nextPutAll: aWAServerAdaptor class name; nextPut: Character cr;
			nextPutAll: 'Port: '; nextPutAll: aWAServerAdaptor port greaseString; nextPut: Character cr;
			nextPutAll: 'Encoding: '; nextPutAll: aWAServerAdaptor codec name; nextPut: Character cr.
		aWAServerAdaptor additionalStatusOn: stream.
		stream
			nextPutAll: aWAServerAdaptor statusString ]
]

{ #category : #actions }
WAControlPanel >> inspectAdaptor [
	<menuItem: 'Inspect adaptor' enabled: #hasSelectedAdaptor priority: 500 help: 'Inspect the current adatpor'>
	self selectedAdaptor
		ifNotNil: [:a | a inspect].
]

{ #category : #accessing }
WAControlPanel >> listNameFor: adaptor [

	^ String streamContents: [ :stream |
		stream
			nextPut: $[; print: adaptor port; nextPut: $];
			space;
			nextPutAll: adaptor class name.
		 adaptor class = GRNullCodec ifFalse: [
			stream space; nextPut: $(; nextPutAll:  adaptor codec name; nextPut: $) ] ]
]

{ #category : #accessing }
WAControlPanel >> manager [

	^ manager
]

{ #category : #accessing }
WAControlPanel >> manager: anObject [

	manager := anObject
]

{ #category : #'user interface' }
WAControlPanel >> portFromUserFor: adaptor [

	^ (UIManager default
		request: 'Enter a port number' 
		initialAnswer: adaptor defaultPort greaseString)
		ifNotNil: [:answer | 
			(answer notEmpty and: [answer isAllDigits])
				ifTrue: [answer greaseInteger]]
]

{ #category : #actions }
WAControlPanel >> removeAdaptor: aWAServerAdaptor [

	aWAServerAdaptor isRunning ifFalse: [
		aWAServerAdaptor unregister].
]

{ #category : #actions }
WAControlPanel >> removeSelectedAdaptor [
	<menuItem: 'Remove' enabled: #hasSelectedAdaptor priority: 300 help: 'Remove the current adaptor'>
	self selectedAdaptor ifNotNil: [:adaptor |
		self updateAfter: [self removeAdaptor: adaptor]].
]

{ #category : #accessing }
WAControlPanel >> selectedAdaptor [
	^ self adaptorAt: self adaptorsListIndex ifAbsent: [nil]
]

{ #category : #actions }
WAControlPanel >> setEncodingFor: anAdaptor [
	| codec |
	codec := UIManager default
		chooseFrom: (self codecs collect: [ :each | each name]) 
		values: self codecs
		lines: #()
		title: 'Select encoding' translated.
	codec ifNotNil: [anAdaptor codec: codec].
]

{ #category : #actions }
WAControlPanel >> setEncodingForSelectedAdaptor [
	<menuItem: 'Set adapor encoding...' enabled: #hasSelectedAdaptor priority: 500 help: 'Change the encoder for the current adaptor'>
	self selectedAdaptor ifNotNil: [:adaptor |
		self updateAfter: [self setEncodingFor: adaptor]].
]

{ #category : #actions }
WAControlPanel >> setPortFor: anAdaptor [
	
	(self portFromUserFor: anAdaptor) ifNotNil: [:port |
		anAdaptor port: port]
]

{ #category : #actions }
WAControlPanel >> setPortForSelectedAdaptor [
	<menuItem: 'Set adapor port...' enabled: #adaptorIsStopped priority: 500 help: 'Change the port for the current adaptor'>
	self selectedAdaptor ifNotNil: [:adaptor |
		self updateAfter: [self setPortFor: adaptor]].
]

{ #category : #actions }
WAControlPanel >> startAdaptor [
	<button: 'Start' enabled: #adaptorIsStopped help: 'Start the current adaptor to listen for requests'>
	<menuItem: 'Start adaptor' enabled: #adaptorIsStopped priority: 500 help: 'Start the current adaptor to listen for requests'>
	self selectedAdaptor ifNotNil: [:adaptor |
		self updateAfter: [adaptor start]].
]

{ #category : #menus }
WAControlPanel >> step [
	"Polling because WAServerManager cannot be depended on"
	self changed: #adaptorsList.

]

{ #category : #testing }
WAControlPanel >> stepTime [

	^ 1000

]

{ #category : #actions }
WAControlPanel >> stopAdaptor [
	<button: 'Stop' enabled: #adaptorIsRunning help: 'Stop the current adaptor'>
	<menuItem: 'Stop adaptor' enabled: #adaptorIsRunning priority: 500 help: 'Stop the current adaptor'>
	self selectedAdaptor ifNotNil: [:adaptor |
		self updateAfter: [adaptor stop]].
]

{ #category : #'user interface' }
WAControlPanel >> updateAfter: aBlock [
	" small helper "
	| res |
	res := aBlock value.
	self changed: #adaptorsList.
	self changed: #information.
	^ res
]

{ #category : #testing }
WAControlPanel >> wantsSteps [
	^ true
]
