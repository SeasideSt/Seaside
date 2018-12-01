"
Using this you should be able to start a server in its own Gem
"
Class {
	#name : #WAGemStoneRunSmalltalkServer,
	#superclass : #Object,
	#instVars : [
		'servers'
	],
	#classVars : [
		'Singleton'
	],
	#category : 'Seaside-GemStone-Tools-Production-Gems'
}

{ #category : #control }
WAGemStoneRunSmalltalkServer class >> addServer: aServer [
	self singleton addServer: aServer.
]

{ #category : #control }
WAGemStoneRunSmalltalkServer class >> addServerOfClass: aServerClass withName: aUniqueName on: anArrayOfPortNumbers [

	self addServer: (WAGemStoneSmalltalkServer createServerOfClass: aServerClass withName: aUniqueName on: anArrayOfPortNumbers).
]

{ #category : #'running script' }
WAGemStoneRunSmalltalkServer class >> executeGemCommand: command for: server [

	| commandLine |
	Transcript cr; show: '---', command, ' Seaside gems', ' ('; show: TimeStamp now printString; show: ')'.
	commandLine := 
		(GsFile _expandEnvVariable: 'GEMSTONE' isClient: false), 
		'/seaside/bin/runSmalltalkServer ', 
		command, 
		' ', 
		server name,
		' ', 
		server portString.
	Transcript cr; show: (System performOnServer: commandLine) withSqueakLineEndings.
	Transcript cr; show: '---Finished Seaside gems ', command, ' ('; show: TimeStamp now printString; show: ')'.
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer class >> initSingleton [
	Singleton := super new
]

{ #category : #control }
WAGemStoneRunSmalltalkServer class >> new [
	^self shouldNotImplement
]

{ #category : #control }
WAGemStoneRunSmalltalkServer class >> removeServer: aName [
	self singleton removeServer: aName.
]

{ #category : #control }
WAGemStoneRunSmalltalkServer class >> removeServerNamed: aName [
	self singleton removeServer: aName.
]

{ #category : #'running script' }
WAGemStoneRunSmalltalkServer class >> restartGems: server [
	"self restartGems"

	self executeGemCommand: 'restart' for: server
]

{ #category : #'running script' }
WAGemStoneRunSmalltalkServer class >> restartGemsNamed: aName [
	
self restartGems: (self serverNamed: aName)
]

{ #category : #control }
WAGemStoneRunSmalltalkServer class >> serverNamed: aString [
	^self singleton serverNamed: aString
]

{ #category : #control }
WAGemStoneRunSmalltalkServer class >> serverNames [
	^self singleton names asSortedCollection
]

{ #category : #control }
WAGemStoneRunSmalltalkServer class >> serversOnPort: aPortNumber [
	^self singleton serversOnPort: aPortNumber
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer class >> singleton [
	Singleton isNil ifTrue: [self initSingleton].
	^Singleton
]

{ #category : #control }
WAGemStoneRunSmalltalkServer class >> startGemServer: serverName On: portInteger [
	"use this method to start adaptor in a separate gem.
	 use #startOn: if starting from development vm"

	GRPlatform current seasideLogServerStart: serverName port: portInteger.
	"The method not expected to return"
	self startServer: serverName On: portInteger
]

{ #category : #'running script' }
WAGemStoneRunSmalltalkServer class >> startGems: server [
	"self startGems"

	self executeGemCommand: 'start' for: server
]

{ #category : #control }
WAGemStoneRunSmalltalkServer class >> startServer: serverName On: portInteger [
(self serverNamed: serverName) startOn: portInteger
]

{ #category : #'running script' }
WAGemStoneRunSmalltalkServer class >> statusGems: server [
  self executeGemCommand: 'status' for: server
]

{ #category : #'running script' }
WAGemStoneRunSmalltalkServer class >> stopAllGems [
	self singleton servers do: [:each | self stopGems: each].
]

{ #category : #'running script' }
WAGemStoneRunSmalltalkServer class >> stopGemOnPort: aPortNumber [


(self serversOnPort: aPortNumber) do: [:each | self stopGems:each]
]

{ #category : #'running script' }
WAGemStoneRunSmalltalkServer class >> stopGems: server [
	"self stopGems"

	self executeGemCommand: 'stop' for: server
]

{ #category : #'running script' }
WAGemStoneRunSmalltalkServer class >> stopGemsNamed: aName [
	
	self stopGems:(self serverNamed: aName).
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer >> addServer: aServer [
	(self serverNamed: aServer name) notNil 
		ifTrue: [^Error error: 'Server with that name already exists!'].

	self servers add: aServer
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer >> initialize [
	servers:=Set new.
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer >> names [

	^self servers collect:[:each | each name].
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer >> ports [

	^self servers collect:[:each | each port].
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer >> removeServer: aName [
|server|
server :=self serverNamed:aName.
server ==nil ifFalse:[	servers remove: server]
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer >> serverClasses [

	^self servers collect:[:each | each serverClass].
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer >> serverNamed: aString [
	^self servers detect:[:each | each name = aString] ifNone:[nil]
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer >> servers [
	^servers
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer >> serversOfClass: aClassName [
	^servers select: [:each | each serverClass name = aClassName]
]

{ #category : #accessing }
WAGemStoneRunSmalltalkServer >> serversOnPort: aPort [
	^servers detect: [:each | each ports includes: aPort] ifNone:[nil]
]
