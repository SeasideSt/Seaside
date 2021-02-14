Class {
	#name : #WAServerAdaptorNode,
	#superclass : #WANode,
	#instVars : [
		'adaptor'
	],
	#category : 'Seaside-Tools-OmniBrowser'
}

{ #category : #'instance creation' }
WAServerAdaptorNode class >> on: aServerAdaptor [
	^ self basicNew initializeWithAdaptor: aServerAdaptor; yourself
]

{ #category : #accessing }
WAServerAdaptorNode >> adaptor [
	^ adaptor
]

{ #category : #testing }
WAServerAdaptorNode >> canChangeMode [
	^ adaptor respondsTo: #setDebugMode
]

{ #category : #testing }
WAServerAdaptorNode >> canChangeStreamUploads [
	^ adaptor respondsTo: #streamUploads
]

{ #category : #testing }
WAServerAdaptorNode >> canRemove [
	^ adaptor isStopped
]

{ #category : #testing }
WAServerAdaptorNode >> canStart [
	^ adaptor canStart
]

{ #category : #testing }
WAServerAdaptorNode >> canStop [
	^ adaptor canStop
]

{ #category : #public }
WAServerAdaptorNode >> definition [
	^ OBTextDefinition text: (String streamContents: [ :stream |
		stream 
			nextPutAll: 'Type: '; nextPutAll: adaptor class name; nextPut: Character cr;
			nextPutAll: 'Port: '; nextPutAll: adaptor port greaseString; nextPut: Character cr;
			nextPutAll: 'Encoding: '; nextPutAll: adaptor codec name; nextPut: Character cr.
		adaptor additionalStatusOn: stream.
		stream
			nextPutAll: adaptor statusString ])
]

{ #category : #initialization }
WAServerAdaptorNode >> initializeWithAdaptor: aServerAdaptor [
	adaptor := aServerAdaptor
]

{ #category : #updating }
WAServerAdaptorNode >> inspectAdaptor [
	adaptor inspect
]

{ #category : #testing }
WAServerAdaptorNode >> isRunning [
	^ adaptor isRunning
]

{ #category : #testing }
WAServerAdaptorNode >> isServerAdaptor [
	^ true
]

{ #category : #testing }
WAServerAdaptorNode >> isStopped [
	^ adaptor isStopped
]

{ #category : #testing }
WAServerAdaptorNode >> isStreamingUploads [
	^ adaptor streamUploads
]

{ #category : #public }
WAServerAdaptorNode >> name [
	^ String streamContents: [ :stream |
		stream
			nextPut: $[; print: adaptor port; nextPut: $];
			space;
			nextPutAll: adaptor class name.
		 adaptor class = GRNullCodec ifFalse: [
			stream space; nextPut: $(; nextPutAll:  adaptor codec name; nextPut: $) ] ]
]

{ #category : #updating }
WAServerAdaptorNode >> remove [
	self canRemove ifTrue: [ adaptor unregister ]
]

{ #category : #accessing }
WAServerAdaptorNode >> requestHandler [
	^ adaptor requestHandler asNode
]

{ #category : #accessing }
WAServerAdaptorNode >> requestHandlers [
	^ Array with: self requestHandler
]

{ #category : #updating }
WAServerAdaptorNode >> setDebugMode [
	adaptor setDebugMode
]

{ #category : #updating }
WAServerAdaptorNode >> setDeploymentMode [
	adaptor setDeploymentMode
]

{ #category : #updating }
WAServerAdaptorNode >> setVerboseMode [
	adaptor setVerboseMode
]

{ #category : #updating }
WAServerAdaptorNode >> start [
	self canStart ifTrue: [ adaptor start ]
]

{ #category : #updating }
WAServerAdaptorNode >> stop [
	self canStop ifTrue: [ adaptor stop ]
]
