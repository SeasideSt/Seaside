Class {
	#name : 'WACORSResourceExample',
	#superclass : 'WARestfulHandler',
	#instVars : [
		'sampleData'
	],
	#classVars : [
		'CorsAdaptor',
		'OriginAdaptor'
	],
	#category : 'Seaside-Tests-Functional',
	#package : 'Seaside-Tests-Functional'
}

{ #category : 'accessing' }
WACORSResourceExample class >> concreteAdaptorClass [

	^ WAServerAdaptor withAllSubclasses detect: [ :one | one isAbstract not and:[ one name ~= 'WATestServerAdaptor' ] ]
]

{ #category : 'setup' }
WACORSResourceExample class >> corsAdaptor [

	^ CorsAdaptor
]

{ #category : 'accessing' }
WACORSResourceExample class >> corsAdaptorPort [

	^ 8888
]

{ #category : 'initialization' }
WACORSResourceExample class >> initialize [

	<script>
	self register
]

{ #category : 'accessing' }
WACORSResourceExample class >> originAdaptorPort [

	^ 8080
]

{ #category : 'setup' }
WACORSResourceExample class >> register [

	<script>
	WAAdmin register: self at: self resourceUrl
]

{ #category : 'setup' }
WACORSResourceExample class >> registerCorsAdaptor [
  (Smalltalk at: #'GemServer' ifAbsent: [ nil ])
    ifNil: [ self registerCorsAdaptorRegular ]
    ifNotNil: [ self registerCorsAdaptorInGemStone ]
]

{ #category : 'setup' }
WACORSResourceExample class >> registerCorsAdaptorInGemStone [
  | gemserver |
  gemserver := (Smalltalk at: #'GemServer') gemServerNamed: 'Seaside'.
  (gemserver ports includes: self corsAdaptorPort)
    ifFalse: [ 
      gemserver ports: gemserver ports , {(self corsAdaptorPort)}.
      gemserver restartGems.
      (gemserver waitForStartGems: 20)
        ifFalse: [ 
          Transcript
            cr;
            show: 'Failed to start gemserver'.
          self assert: false ].
      (Delay forSeconds: 3) wait ]
]

{ #category : 'setup' }
WACORSResourceExample class >> registerCorsAdaptorRegular [

	CorsAdaptor := WAAdmin serverAdaptors
		               detect: [ :adaptor | adaptor class == self concreteAdaptorClass and: [ adaptor port = self corsAdaptorPort ] ]
		               ifNone: [ self concreteAdaptorClass port: self corsAdaptorPort ].
	CorsAdaptor start
]

{ #category : 'setup' }
WACORSResourceExample class >> resourceUrl [

	^ 'tests/corsData'
]

{ #category : 'setup' }
WACORSResourceExample class >> startAdaptors [

	<script>
	WAServerManager default adaptors
		ifEmpty: [ 
			OriginAdaptor := (self concreteAdaptorClass port:
				                  self originAdaptorPort) start.
			self registerCorsAdaptor ]
		ifNotEmpty: [ :adaptors | 
			OriginAdaptor := adaptors
				                 detect: [ :one | one port = self originAdaptorPort ]
				                 ifNone: [ self concreteAdaptorClass port: self originAdaptorPort ].
			OriginAdaptor start.
			CorsAdaptor := adaptors
				               detect: [ :one | one port = self corsAdaptorPort ]
				               ifNone: [ self concreteAdaptorClass port: self corsAdaptorPort ].
			CorsAdaptor start ]
]

{ #category : 'setup' }
WACORSResourceExample class >> unregister [
  <script>
  WAAdmin unregister: self resourceUrl
]

{ #category : 'setup' }
WACORSResourceExample class >> unregisterCorsAdaptor [
  (Smalltalk at: #'GemServer' ifAbsent:[ nil ])
    ifNil: [ self unregisterCorsAdaptorRegular ]
    ifNotNil: [ self unregisterCorsAdaptorInGemStone ]
]

{ #category : 'setup' }
WACORSResourceExample class >> unregisterCorsAdaptorInGemStone [
  | gemserver |
  gemserver := (Smalltalk at: #'GemServer') gemServerNamed: 'Seaside'.
  (gemserver ports includes: self corsAdaptorPort)
    ifTrue: [ 
      gemserver stopGems.
		(Delay forSeconds: 3) wait.
      gemserver ports: (gemserver ports copyWithout: self corsAdaptorPort).
      gemserver startGems.
      (gemserver waitForStartGems: 20)
        ifFalse: [ 
          Transcript
            cr;
            show: 'Failed to start gemserver'.
          self assert: false ].
      (Delay forSeconds: 3) wait ]
]

{ #category : 'setup' }
WACORSResourceExample class >> unregisterCorsAdaptorRegular [
	CorsAdaptor ifNotNil:[ CorsAdaptor stop; unregister ].
	CorsAdaptor := nil
]

{ #category : 'routes' }
WACORSResourceExample >> deleteEntry [

	<method: 'DELETE'>
	<path: 'entries'>
	<produces: 'application/json'>
	
	^ self sampleData removeFirst asJson
]

{ #category : 'routes' }
WACORSResourceExample >> getEntries [

	<method: 'GET'>
	<path: 'entries'>
	<produces: 'application/json'>

	^ self sampleData asJson
]

{ #category : 'initialization' }
WACORSResourceExample >> initialize [ 

	super initialize.
	self addFilterFirst: WACORSFilter new.
]

{ #category : 'private' }
WACORSResourceExample >> initializeSampleData [

	^ sampleData := ((1 to: 10) collect: [ :index | 
		                 Dictionary new
			                 at: 'id' put: index;
			                 at: 'title'
			                 put: ('Item <1p>' expandMacrosWith: 2);
			                 yourself ]) asOrderedCollection
]

{ #category : 'private' }
WACORSResourceExample >> sampleData [

	sampleData ifNil: [ self initializeSampleData ].
	^ sampleData
]
