"
SeasideLoadOrderTests provides a single class that loads the packages described on the LoadOrder Wiki (http://code.google.com/p/seaside/wiki/LoadOrder), and shows the errors and undefined along the way.
"
Class {
	#name : #SeasideLoadOrderTests,
	#superclass : #Object,
	#instVars : [
		'userName',
		'password',
		'komHttpServer',
		'baseTests',
		'baseUndeclared',
		'doTests',
		'seaside30',
		'versions',
		'currentVersions'
	],
	#category : 'LoadOrderTests'
}

{ #category : #initialization }
SeasideLoadOrderTests class >> initialize [

	(UIManager default confirm: 'Load Seaside 3.0?') ifTrue: [
		self new doLoad.
	].

]

{ #category : #packages }
SeasideLoadOrderTests >> adminToolsPackages [

	^OrderedCollection new
		add: seaside30 -> 'Seaside-Tools-OmniBrowser-lr.17.mcz';
		add: seaside30 -> 'Seaside-Pharo-Tools-OmniBrowser-lr.6.mcz';
		yourself.
]

{ #category : #private }
SeasideLoadOrderTests >> askForTesting [
	doTests := UIManager default confirm: 'Run tests as packages are loaded?'.
	doTests ifTrue: [
		baseTests := TestCase suite tests.
		baseUndeclared := Undeclared keys.
	].
]

{ #category : #'packages-basic' }
SeasideLoadOrderTests >> basicPackages [

	^OrderedCollection new
		add: self greasePackages;			"Platform"
		add: self corePackages;			"Core"
		add: self canvasPackages;			"Canvas"
		add: self sessionPackages;			"Session"
		add: self componentPackages;		"Component"
		add: self renderLoopPackages;		"RenderLoop"
		add: self toolsPackages;			"Tools"
		add: self widgetsPackages;			"Widgets"
		add: self environmentPackages;	"Environment"
		yourself.
]

{ #category : #repositories }
SeasideLoadOrderTests >> cacheRepositories [
	seaside30 := self seaside30.
	self cacheVersionsFor: seaside30.
	komHttpServer := self komHttpServer.
	self cacheVersionsFor: komHttpServer.
]

{ #category : #private }
SeasideLoadOrderTests >> cacheVersionsFor: aRepository [
	self versions at: aRepository put: aRepository allVersionNames
]

{ #category : #'packages-basic' }
SeasideLoadOrderTests >> canvasPackages [

	^Array 
		with: seaside30 -> 'Seaside-Canvas-pmm.100.mcz'
		with: seaside30 -> 'Seaside-Pharo-Canvas-lr.3.mcz'
		with: seaside30 -> 'Seaside-Tests-Canvas-lr.50.mcz'.

]

{ #category : #packages }
SeasideLoadOrderTests >> comanchePackages [

	^OrderedCollection new
		add: komHttpServer	-> 'DynamicBindings-lr.13.mcz';
		add: komHttpServer	-> 'KomServices-lr.20.mcz';
		add: komHttpServer	-> 'KomHttpServer-lr.52.mcz';
			
		add: seaside30		-> 'Seaside-Adaptors-Comanche-pmm.63.mcz';
		add: seaside30		-> 'Seaside-Tests-Adaptors-Comanche-lr.13.mcz';
		yourself.

]

{ #category : #packages }
SeasideLoadOrderTests >> cometPackages [

	^OrderedCollection new
		add: seaside30 -> 'Comet-Core-lr.51.mcz';
		add: seaside30 -> 'Comet-Pharo-Core-lr.6.mcz';
		add: seaside30 -> 'Comet-Tests-Core-lr.10.mcz';
		add: seaside30 -> 'Comet-Examples-lr.21.mcz';
		yourself.
]

{ #category : #'packages-basic' }
SeasideLoadOrderTests >> componentPackages [

	^Array 
		with: seaside30 -> 'Seaside-Component-pmm.85.mcz'
		with: seaside30 -> 'Seaside-Tests-Component-NickAger.31.mcz'.

]

{ #category : #utility }
SeasideLoadOrderTests >> condenceChanges [
"
	SeasideLoadOrderTests new condenseChanges.
"
	Smalltalk condenseChanges.
	
]

{ #category : #'packages-traditional' }
SeasideLoadOrderTests >> continuationPackages [

	^Array 
		with: seaside30 -> 'Seaside-Pharo-Continuation-lr.5.mcz'
		with: seaside30 -> 'Seaside-Tests-Pharo-Continuation-lr.7.mcz'.

]

{ #category : #'packages-basic' }
SeasideLoadOrderTests >> corePackages [

	^Array 
		with: seaside30 -> 'Seaside-Core-pmm.660.mcz'
		with: seaside30 -> 'Seaside-Pharo-Core-pmm.9.mcz'
		with: seaside30 -> 'Seaside-Tests-Core-pmm.198.mcz'
		with: seaside30 -> 'Seaside-Tests-UTF8-lr.9.mcz'
		with: seaside30 -> 'Seaside-Tests-Pharo-Core-pmm.14.mcz'.

]

{ #category : #accessing }
SeasideLoadOrderTests >> currentVersions [
	currentVersions ifNil: [currentVersions := MCWorkingCopy allManagers collect: [:ea |  ea ancestry ancestorString ]].
	^currentVersions
]

{ #category : #'packages-traditional' }
SeasideLoadOrderTests >> developmentPackages [

	^Array 
		with: seaside30 -> 'Seaside-Development-lr.139.mcz'
		with: seaside30 -> 'Seaside-Pharo-Development-lr.43.mcz'
		with: seaside30 -> 'Seaside-Tests-Development-lr.35.mcz'
		with: seaside30 -> 'Seaside-Tests-Pharo-Development-DaleHenrichs.13.mcz'.

]

{ #category : #'load and test' }
SeasideLoadOrderTests >> doLoad [
	self requestUserAndPassword.
	self askForTesting.
	self cacheRepositories.
	self groups do: [:aList | 
		self 
			loadPackages: aList;
			doTests;
			yourself.
	].

]

{ #category : #'load and test' }
SeasideLoadOrderTests >> doLoadNewest [
	self askForTesting.
	self cacheRepositories.
	self groups do: [:aList | 
		self 
			loadNewestPackages: aList;
			doTests;
			yourself.
	].

]

{ #category : #'load and test' }
SeasideLoadOrderTests >> doTests [

	| suite result |
	doTests ifFalse: [^self].
	suite := TestCase suite.
	baseTests do: [:oldTest | 
		| duplicate |
		duplicate := suite tests detect: [:newTest | newTest class == oldTest class and: [newTest selector == oldTest selector]].
		suite tests remove: duplicate.
	].
	result := suite run.
	Transcript cr; tab; show: result printString.
	result defects do: [:each | 
		Transcript cr; tab; tab; show: each printString.
	].

]

{ #category : #packages }
SeasideLoadOrderTests >> emailPackages [

	^OrderedCollection new
		add: seaside30 -> 'Seaside-Email-lr.15.mcz';
		add: seaside30 -> 'Seaside-Tests-Email-lr.9.mcz';
		add: seaside30 -> 'Seaside-Pharo-Email-lr.6.mcz';
		yourself.
]

{ #category : #'packages-basic' }
SeasideLoadOrderTests >> environmentPackages [

	^Array 
		with: seaside30 -> 'Seaside-Environment-pmm.71.mcz'
		with: seaside30 -> 'Seaside-Pharo-Environment-lr.6.mcz'
		with: seaside30 -> 'Seaside-Tests-Environment-pmm.24.mcz'.

]

{ #category : #'packages-traditional' }
SeasideLoadOrderTests >> examplePackages [

	^Array 
		with: seaside30 -> 'Seaside-Examples-lr.19.mcz'
		with: seaside30 -> 'Seaside-Tests-Examples-lr.9.mcz'.

]

{ #category : #private }
SeasideLoadOrderTests >> extractPackageName: fullPackageName [
	^(fullPackageName findTokens: '.') first copyUpToLast: $-
]

{ #category : #'packages-traditional' }
SeasideLoadOrderTests >> flowPackages [

	^Array 
		with: seaside30 -> 'Seaside-Flow-jf.22.mcz'
		with: seaside30 -> 'Seaside-Pharo-Flow-lr.5.mcz'
		with: seaside30 -> 'Seaside-Tests-Flow-jf.28.mcz'.

]

{ #category : #'packages-traditional' }
SeasideLoadOrderTests >> functionalTestPackages [

	^Array 
		with: seaside30 -> 'Seaside-Tests-Functional-pmm.124.mcz'
		with: seaside30 -> 'Seaside-Tests-Pharo-Functional-lr.12.mcz'.

]

{ #category : #'packages-basic' }
SeasideLoadOrderTests >> greasePackages [

	^Array 
		with: seaside30 -> 'Grease-Core-pmm.47.mcz'
		with: seaside30 -> 'Grease-Pharo-Core-lr.27.mcz'
		with: seaside30 -> 'Grease-Tests-Core-pmm.60.mcz'
		with: seaside30 -> 'Grease-Tests-Pharo-Core-pmm.8.mcz'.

]

{ #category : #packages }
SeasideLoadOrderTests >> groups [

	^OrderedCollection new
		addAll: self basicPackages;
		addAll: self traditionalPackages;
		add: self adminToolsPackages;
		add: self rssPackages;
		add: self javascriptPackages;
		add: self jQueryPackages;
		add: self prototypePackages;
		add: self scriptaculousPackages;
		add: self htmlPackages;
		add: self internetExplorerPackages;
		add: self emailPackages;
		add: self comanchePackages;
		add: self cometPackages;
		add: self slimePackages;
		yourself.
		
]

{ #category : #packages }
SeasideLoadOrderTests >> htmlPackages [

	^OrderedCollection new
		add: seaside30 -> 'Seaside-HTML5-lr.11.mcz';
		add: seaside30 -> 'Seaside-Tests-HTML5-pmm.17.mcz';
		yourself.
]

{ #category : #'initialize-release' }
SeasideLoadOrderTests >> initialize [

	super initialize.
	userName := ''.
	password := ''.


	

]

{ #category : #packages }
SeasideLoadOrderTests >> internetExplorerPackages [

	^OrderedCollection new
		add: seaside30 -> 'Seaside-InternetExplorer-pmm.7.mcz';
		add: seaside30 -> 'Seaside-Tests-InternetExplorer-lr.9.mcz';
		yourself.
]

{ #category : #private }
SeasideLoadOrderTests >> isPackageLoaded: aPackageName [
	^self currentVersions includes: aPackageName
]

{ #category : #packages }
SeasideLoadOrderTests >> jQueryPackages [

	^OrderedCollection new
		add: seaside30 -> 'JQuery-Core-lr.107.mcz';
		add: seaside30 -> 'JQuery-Tests-Core-lr.123.mcz';
		add: seaside30 -> 'JQuery-UI-lr.62.mcz';
		add: seaside30 -> 'JQuery-Tests-UI-lr.78.mcz';
		yourself.
]

{ #category : #packages }
SeasideLoadOrderTests >> javascriptPackages [
	^ OrderedCollection new
		add: seaside30 -> 'Javascript-Core-lr.88.mcz';
		add: seaside30 -> 'Javascript-Pharo-Core-DaleHenrichs.9.mcz';
		add: seaside30 -> 'Javascript-Tests-Core-lr.58.mcz';
		add: seaside30 -> 'Javascript-Tests-Pharo-Core-lr.1.mcz';
		yourself
]

{ #category : #repositories }
SeasideLoadOrderTests >> komHttpServer [

	^MCHttpRepository
		location: 'http://www.squeaksource.com/KomHttpServer'
		user: userName
		password: password.

]

{ #category : #private }
SeasideLoadOrderTests >> latestVersionForPackage: aName repository: repo [
	| sortedVersions |
	sortedVersions := self sortedVersionsForPackage: aName repository: repo.
	^sortedVersions isEmpty
		ifTrue: [nil]
		ifFalse: [sortedVersions last]
]

{ #category : #'load and test' }
SeasideLoadOrderTests >> loadNewestPackage: aString from: aRepository [
	| packageName |
	packageName := self latestVersionForPackage: (self extractPackageName: aString) repository: aRepository.
	packageName ifNotNil: 
		[(self isPackageLoaded: packageName) ifFalse: [
				Transcript cr.
				packageName := packageName , '.mcz'.
				self loadPackage: packageName from: aRepository]]
	
]

{ #category : #'load and test' }
SeasideLoadOrderTests >> loadNewestPackages: aList [

	aList do: [:assoc |
		self
			loadNewestPackage: assoc value 
			from: assoc key.
	].

]

{ #category : #'load and test' }
SeasideLoadOrderTests >> loadPackage: aString from: aRepository [

	| version repositoryGroup transcript stream |
	version := aRepository loadVersionFromFileNamed: aString.
	transcript := Transcript.
	stream := WriteStream on: String new.
	[
		Transcript := stream.
		version load.
	] ensure: [
		Transcript := transcript.
	].
	false ifTrue: [self reportToTranscript: stream contents].
	repositoryGroup := version workingCopy repositoryGroup.
	repositoryGroup addRepository: aRepository.
	Transcript cr; show: 'Loaded ' , aString.
	self showUndeclared.
	
]

{ #category : #'load and test' }
SeasideLoadOrderTests >> loadPackages: aList [

	Transcript cr.
	aList do: [:assoc |
		self
			loadPackage: assoc value 
			from: assoc key.
	].

]

{ #category : #packages }
SeasideLoadOrderTests >> prototypePackages [

	^OrderedCollection new
		add: seaside30 -> 'Prototype-Core-lr.22.mcz';
		add: seaside30 -> 'Prototype-Tests-Core-lr.11.mcz';
		yourself.
]

{ #category : #'packages-basic' }
SeasideLoadOrderTests >> renderLoopPackages [

	^Array 
		with: seaside30 -> 'Seaside-RenderLoop-lr.72.mcz'
		with: seaside30 -> 'Seaside-Tests-RenderLoop-lr.11.mcz'.

]

{ #category : #'load and test' }
SeasideLoadOrderTests >> reportToTranscript: aString [

	| list flag |
	list := aString subStrings: (Array with: $().
	list := list collect: [:each | each withBlanksTrimmed].
	list := list reject: [:each | each isEmpty].
	list := list reject: [:each | 
		16 < each size and: [ (each copyFrom: each size - 14 to: each size) = ' is Undeclared)'].
	].
	list isEmpty ifTrue: [^self].
	flag := true.
	1 to: list size - 1 by: 2 do: [:i | 
		flag := flag and: [(list at: i) = 'a MCClassDefinition'].
	].
	flag ifTrue: [^self].
	Transcript nextPutAll: aString.
	
]

{ #category : #private }
SeasideLoadOrderTests >> requestUserAndPassword [
	userName := UIManager default
		request: 'SqueakSource User Name (empty is fine)?'
		initialAnswer: ''.
	password := UIManager default
		request: 'SqueakSource Password (empty is fine)?'
		initialAnswer: ''.
	
]

{ #category : #packages }
SeasideLoadOrderTests >> rssPackages [

	^OrderedCollection new
		add: seaside30 -> 'RSS-Core-pmm.62.mcz';
		add: seaside30 -> 'RSS-Tests-Core-pmm.26.mcz';
		add: seaside30 -> 'RSS-Examples-lr.24.mcz';
		yourself.
]

{ #category : #packages }
SeasideLoadOrderTests >> scriptaculousPackages [

	^OrderedCollection new
		add: seaside30 -> 'Scriptaculous-Core-lr.96.mcz';
		add: seaside30 -> 'Scriptaculous-Tests-Core-lr.56.mcz';
		add: seaside30 -> 'Scriptaculous-Components-obi.105.mcz';
		add: seaside30 -> 'Scriptaculous-Tests-Components-lr.33.mcz';
		yourself.
]

{ #category : #repositories }
SeasideLoadOrderTests >> seaside30 [

	^MCHttpRepository
		location: 'http://www.squeaksource.com/Seaside30'
		user: ''
		password: ''.

]

{ #category : #'packages-basic' }
SeasideLoadOrderTests >> sessionPackages [

	^Array 
		with: seaside30 -> 'Seaside-Session-pmm.134.mcz'
		with: seaside30 -> 'Seaside-Tests-Session-lr.42.mcz'.

]

{ #category : #'load and test' }
SeasideLoadOrderTests >> showUndeclared [

	| newUndeclared |
	doTests ifFalse: [^self].
	newUndeclared := Undeclared keys.
	baseUndeclared do: [:each | newUndeclared remove: each].
	newUndeclared isEmpty ifTrue: [^self].
	Transcript cr; tab; show: 'Undeclared: ' , newUndeclared asSortedCollection asArray printString.
	
]

{ #category : #packages }
SeasideLoadOrderTests >> slimePackages [
	^ (Smalltalk hasClassNamed: #RBLintRule)
		ifFalse: [ OrderedCollection new ]
		ifTrue: [
			OrderedCollection new
				add: seaside30 -> 'Grease-Slime-jok.5.mcz';
				add: seaside30 -> 'Seaside-Slime-lr.78.mcz';
				add: seaside30 -> 'Grease-Tests-Slime-jok.5.mcz';
				add: seaside30 -> 'Seaside-Tests-Slime-lr.42.mcz';
				yourself ]
]

{ #category : #private }
SeasideLoadOrderTests >> sortedVersionsForPackage: aName repository: repo [ 
	| sortedVersions | 
	sortedVersions := ((versions at: repo ifAbsent: [#()]) select: [:versionName | | parts |
							parts := (aName occurrencesOf: $-) + 1.
							(versionName beginsWith: aName) and: [parts = (versionName occurrencesOf: $-) ] ])
								asSortedCollection: [:a :b | (a copyAfterLast: $.) asNumber <= (b copyAfterLast: $.) asNumber].
	sortedVersions isEmpty ifTrue: [self inform: 'No Version for ' , aName , ' found!'. ^#() ].
	^sortedVersions
]

{ #category : #'packages-basic' }
SeasideLoadOrderTests >> toolsPackages [

	^Array
		with: seaside30 -> 'Seaside-Tools-Core-jf.18.mcz'.

]

{ #category : #'packages-traditional' }
SeasideLoadOrderTests >> traditionalPackages [

	^OrderedCollection new
		add: self functionalTestPackages ;		"Functional Tests"	
		add: self continuationPackages;			"Continuations"
		add: self flowPackages;					"Flow"
		add: self webToolsPackages;			"WebTools"
		add: self developmentPackages;		"Development"
		add: self examplePackages;			"Examples"
		yourself.
]

{ #category : #accessing }
SeasideLoadOrderTests >> versions [
	versions ifNil: [versions := Dictionary new].
	^versions
]

{ #category : #'packages-traditional' }
SeasideLoadOrderTests >> webToolsPackages [

	^Array 
		with: seaside30 -> 'Seaside-Tools-Web-obi.92.mcz'
		with: seaside30 -> 'Seaside-Pharo-Tools-Web-pmm.22.mcz'
		with: seaside30 -> 'Seaside-Tests-Tools-Web-lr.15.mcz'.

]

{ #category : #'packages-basic' }
SeasideLoadOrderTests >> widgetsPackages [

	^Array
		with: seaside30 -> 'Seaside-Widgets-obi.18.mcz'.

]
