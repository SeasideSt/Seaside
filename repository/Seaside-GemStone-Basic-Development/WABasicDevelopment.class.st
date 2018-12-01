Class {
	#name : #WABasicDevelopment,
	#superclass : #WAObject,
	#category : 'Seaside-GemStone-Basic-Development'
}

{ #category : #breakpoints }
WABasicDevelopment class >> breakPointLocations [
  ^ {{#'WAHtmlErrorHandler'.
  #'handleDefault:'.
  #'yourself'}.
  {#'WAEmailErrorHandler'.
  #'handleDefault:'.
  #'yourself'}.
  {#'WAResponseGenerator'.
  #'internalError:'.
  #'yourself'}.
  {#'WAFastCGIAdaptor'.
  #'internalServerMalfunction:'.
  #'yourself'}.
  {#'WAFastCGIAdaptor'.
  #'internalServerErrorMessage:'.
  #'yourself'}.
  {#'HTTPResponse'.
  #'notFound'.
  #'class'}.
  {#'WAGsSwazooAdaptor'.
  #'internalServerErrorMessage:'.
  #'yourself'}.
  {#'WAGsZincAdaptor'.
  #'internalServerErrorMessage:'.
  #'yourself'}}
]

{ #category : #breakpoints }
WABasicDevelopment class >> clearBreakPoints [

	self breakPointLocations do: [:ar |
		Smalltalk at: (ar at: 1) ifPresent: [:cl | 
			((cl perform: (ar at: 3)) compiledMethodAt: (ar at: 2)) clearBreakAtStepPoint: 1]]
]

{ #category : #initialization }
WABasicDevelopment class >> initialize [
	"self initialize"
	
	| wsDict |
	wsDict := UserGlobals 
		at: #SqueakWorkspace
		ifAbsent: [ UserGlobals at: #SqueakWorkspace put: StringKeyValueDictionary new].
	wsDict at: 'Seaside3.2' put: self workspaceContents.
]

{ #category : #'cache reaping' }
WABasicDevelopment class >> reapHandlerCache: aHandler dispatchers: dispatchers [
	| expired |
	
	expired := 0.
	(aHandler isApplication or: [ aHandler isSession ])
		ifTrue: [
			expired :=  aHandler cache reap.
			"aHandler sessionsDo: [:session | expired := expired + session continuations gemstoneReap ]"]
		ifFalse: [
			aHandler isDispatcher 
				ifTrue: [ dispatchers add: aHandler ]].
	^expired
]

{ #category : #'cache reaping' }
WABasicDevelopment class >> reapSeasideCache [

	| dps expired |
	expired := 0.
	dps := OrderedCollection with: WADispatcher default.
	[ dps isEmpty ] whileFalse: [ | dp |
		dp := dps removeFirst.
		dp isApplication
			ifTrue: [
				expired := expired + (self reapHandlerCache: dp dispatchers: dps) ]
			ifFalse: [ 
				dp handlers keysAndValuesDo: [:key :ep |
					expired := expired + (self reapHandlerCache: ep dispatchers: dps) ]]].
	^expired
]

{ #category : #breakpoints }
WABasicDevelopment class >> setBreakPoints [

	self breakPointLocations do: [:ar |
		Smalltalk at: (ar at: 1) ifPresent: [:cl | 
			((cl perform: (ar at: 3)) compiledMethodAt: (ar at: 2)) setBreakAtStepPoint: 1 ]]
]

{ #category : #private }
WABasicDevelopment class >> workspaceContents [

	^'"The default username/password for Seaside admin/seaside.

For more info about using GsDevKit and Seaside check:
https://github.com/GsDevKit and https://github.com/SeasideSt/Seaside"

"start FastCGI adaptor ... does not return. 
 Use #startGemServerOn: in standalone server gem"
WAFastCGIAdaptor startOn: 9001.
WAFastCGIAdaptor stop.

"start Zinc adaptor ... does not return. 
 Use #startGemServerOn: in standalone server gem"
WAGsZincAdaptor startOn: 8383.
WAGsZincAdaptor stop.

"start Swazoo adaptor ... does not return. 
 Use #startGemServerOn: in standalone server gem"
WAGsSwazooAdaptor startOn: 8383.
WAGsSwazooAdaptor stop.
SwazooServer initSingleton.

"Object log"
WAAdmin 
	register: WAObjectLog 
	asApplicationAt: WAObjectLog entryPointName
	user: ''admin'' password: ''tool''.
ObjectLogEntry objectLog.
ObjectLogEntry emptyLog.

"Set/clear breakpoints at usual suspects for errors"
WABasicDevelopment setBreakPoints.
WABasicDevelopment clearBreakPoints.

"short cuts"
WAEnvironment reloadApplications.			"reload Seaside applications"
WAAdmin defaultServerManager initialize.	"reset list of server adaptors"
WABasicDevelopment reapSeasideCache.	"reap expired sessions"
WADispatcher default.						"access root dispatcher"
						
"Specify FastCGI for runSeasideGems30"
WAGemStoneRunSeasideGems default
	name: ''FastCGI'';
	adaptorClass: WAFastCGIAdaptor;
	ports: #(9001 9002 9003).
WAGemStoneRunSeasideGems restartGems. "execute runSeasideGems30 script"
"Specify Zinc for runSeasideGems30"
WAGemStoneRunSeasideGems default
	name: ''Zinc'';
	adaptorClass: WAGsZincAdaptor;
	ports: #(8383).
WAGemStoneRunSeasideGems restartGems. "execute runSeasideGems30 script"
"Specify Swazoo for runSeasideGems30"
WAGemStoneRunSeasideGems default
	name: ''Swazoo'';
	adaptorClass: WAGsSwazooAdaptor;
	ports: #(8383).
WAGemStoneRunSeasideGems restartGems. "execute runSeasideGems30 script"
' withSqueakLineEndings
]
