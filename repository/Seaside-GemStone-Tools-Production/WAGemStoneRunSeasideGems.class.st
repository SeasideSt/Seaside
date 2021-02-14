Class {
	#name : #WAGemStoneRunSeasideGems,
	#superclass : #Object,
	#instVars : [
		'name',
		'adaptorClass',
		'ports'
	],
	#classVars : [
		'Default'
	],
	#category : 'Seaside-GemStone-Tools-Production-Gems'
}

{ #category : #accessing }
WAGemStoneRunSeasideGems class >> default [

	Default == nil ifTrue: [ Default := self new ].
	^Default
]

{ #category : #accessing }
WAGemStoneRunSeasideGems class >> default: aWAGemStoneSeasideGems [

	Default := aWAGemStoneSeasideGems
]

{ #category : #control }
WAGemStoneRunSeasideGems class >> defaultPortString [

	| portString |
	portString := '"'.
	self default ports do: [:port | portString := portString, port asString, ' ' ].
	portString := portString, '"'.
	^portString
]

{ #category : #'running script' }
WAGemStoneRunSeasideGems class >> executeGemCommand: command [
  | commandLine |
  Transcript
    cr;
    show: '---' , command , ' Seaside gems' , ' (';
    show: TimeStamp now printString;
    show: ')'.
  commandLine := (GsFile _expandEnvVariable: 'GEMSTONE' isClient: false)
    , '/seaside/bin/runSeasideGems30 ' , command , ' ' , self default name , ' '
    , self defaultPortString.
  Transcript
    cr;
    show: (System performOnServer: commandLine) withSqueakLineEndings.
  Transcript
    cr;
    show: '---Finished Seaside gems ' , command , ' (';
    show: TimeStamp now printString;
    show: ')'
]

{ #category : #'running script' }
WAGemStoneRunSeasideGems class >> restartGems [
	"self restartGems"

	self executeGemCommand: 'restart'
]

{ #category : #control }
WAGemStoneRunSeasideGems class >> startGemServerOn: portInteger [
	"use this method to start adaptor in a separate gem.
	 use #startOn: if starting from development vm"

	| default |
	default := self default.
	GRPlatform current seasideLogServerStart: default name port: portInteger.
	"The method not expected to return"
	self default startOn: portInteger
]

{ #category : #'running script' }
WAGemStoneRunSeasideGems class >> startGems [
	"self startGems"

	self executeGemCommand: 'start'
]

{ #category : #'running script' }
WAGemStoneRunSeasideGems class >> stopGems [
	"self stopGems"

	self executeGemCommand: 'stop'
]

{ #category : #accessing }
WAGemStoneRunSeasideGems >> adaptorClass [

	adaptorClass == nil
		ifTrue: [ 
			Smalltalk at: #WAFastCGIAdaptor ifPresent: [:cl | ^cl ].
			Smalltalk at: #WAGsZincAdaptor ifPresent: [:cl | ^cl ].
			Smalltalk at: #WAGsSwazooAdaptor ifPresent: [:cl | ^cl ].
			Smalltalk at: #WASwazooAdaptor ifPresent: [:cl | ^cl ]].
	^adaptorClass
]

{ #category : #accessing }
WAGemStoneRunSeasideGems >> adaptorClass: anAdaptorClass [

	adaptorClass := anAdaptorClass
]

{ #category : #accessing }
WAGemStoneRunSeasideGems >> name [

	name == nil ifTrue: [ ^self adaptorClass name ].
	^name
]

{ #category : #accessing }
WAGemStoneRunSeasideGems >> name: aString [ 

	name := aString
]

{ #category : #accessing }
WAGemStoneRunSeasideGems >> ports [

	ports == nil ifTrue: [ ports := self adaptorClass defaultPortList ].
	^ports
]

{ #category : #accessing }
WAGemStoneRunSeasideGems >> ports: aCollection [ 

	ports := aCollection
]

{ #category : #control }
WAGemStoneRunSeasideGems >> start [

	self startOn: self ports first
]

{ #category : #control }
WAGemStoneRunSeasideGems >> startOn: port [

	self adaptorClass startOn: port
]

{ #category : #control }
WAGemStoneRunSeasideGems >> stop [

	self adaptorClass stop
]
