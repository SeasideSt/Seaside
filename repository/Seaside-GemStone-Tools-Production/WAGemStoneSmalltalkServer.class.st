"
Holds a server that can run unattended in its own gem.  Each Name has to be unique.  Can have a single or multiple ports.  Each port will create a new gem that runs.  Must respond to #startOn: #stop, #port, #ports.

#startOn: should not exit or else the server process will stop.  
"
Class {
	#name : #WAGemStoneSmalltalkServer,
	#superclass : #Object,
	#instVars : [
		'name',
		'serverClass',
		'ports'
	],
	#category : 'Seaside-GemStone-Tools-Production-Gems'
}

{ #category : #'as yet unclassified' }
WAGemStoneSmalltalkServer class >> createServerOfClass: aServerClass withName: aName on: anArrayOfPortNumbers [
	^self new
		serverClass: aServerClass;
		name: aName;
		ports: anArrayOfPortNumbers;
		yourself.
]

{ #category : #control }
WAGemStoneSmalltalkServer >> isRunning [
	^self serverClass isRunning
]

{ #category : #accessing }
WAGemStoneSmalltalkServer >> name [

	name == nil ifTrue: [ ^self serverClass name ].
	^name
]

{ #category : #accessing }
WAGemStoneSmalltalkServer >> name: aString [ 

	name := aString
]

{ #category : #control }
WAGemStoneSmalltalkServer >> portString [
	| portString |
	portString := '"'.
	ports do: [:port | portString := portString, port asString, ' ' ].
	portString := portString, '"'.
	^portString
]

{ #category : #accessing }
WAGemStoneSmalltalkServer >> ports [

	ports == nil ifTrue: [ ports := self serverClass defaultPortList ].
	^ports
]

{ #category : #accessing }
WAGemStoneSmalltalkServer >> ports: aCollection [ 

	ports := aCollection
]

{ #category : #accessing }
WAGemStoneSmalltalkServer >> serverClass [
	^serverClass
]

{ #category : #accessing }
WAGemStoneSmalltalkServer >> serverClass: aServer [
	serverClass:= aServer
]

{ #category : #control }
WAGemStoneSmalltalkServer >> start [

	self startOn: self ports first
]

{ #category : #control }
WAGemStoneSmalltalkServer >> startOn: port [

	self serverClass startOn: port
]

{ #category : #control }
WAGemStoneSmalltalkServer >> stop [

	self serverClass stop
]
