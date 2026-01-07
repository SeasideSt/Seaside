"
I am a builder for building WARoute instances from a CompiledMethod.

Instance Variables:
	compiled	<CompiledMethod>
	method		<String>
	path		<String>
	produces	<WAWildcardMimeTypeMatch|WAMimeTypeMatch>
	consumes	<Collection<WAWildcardMimeTypeMatch|WAMimeTypeMatch>>

Class Instance Variables:
	configuration	<Collection>
"
Class {
	#name : 'WARouteBuilder',
	#superclass : 'WAObject',
	#instVars : [
		'compiled',
		'method',
		'path',
		'produces',
		'consumes'
	],
	#classInstVars : [
		'configuration'
	],
	#category : 'Seaside-REST-Core-Route',
	#package : 'Seaside-REST-Core',
	#tag : 'Route'
}

{ #category : 'public' }
WARouteBuilder class >> createRoutesFor: aClass [
	^ self createRoutesFrom: aClass to: aClass
]

{ #category : 'public' }
WARouteBuilder class >> createRoutesFrom: aClass to: aSuperClass [
	| current seen routes |
	current := aClass.
	seen := IdentitySet new.
	routes := OrderedCollection new.
	[ current notNil ] whileTrue: [ 
		current selectorsAndMethodsDo: [ :selector :method |
			(seen includes: selector) ifFalse: [
				| pragmas |
				pragmas := method pragmas
					select: [ :pragma | configuration includes: (GRPlatform current selectorOfPragma: pragma) ].
				pragmas isEmpty ifFalse: [
					routes add: (pragmas
						inject: (self on: method)
						into: [ :builder :pragma | builder perform: (GRPlatform current selectorOfPragma: pragma) withArguments: pragma arguments ])
							create ].
				seen add: selector ] ].
		current = aSuperClass
			ifTrue: [ ^ routes ].
		current := current superclass ].
	^ routes
]

{ #category : 'initialization' }
WARouteBuilder class >> initialize [
	configuration := IdentitySet new.
	(Pragma allNamed: #configuration in: self)
		do: [ :pragma | configuration add: pragma method selector ]
]

{ #category : 'instance creation' }
WARouteBuilder class >> on: aCompiledMethod [
	^ self basicNew initializeOn: aCompiledMethod
]

{ #category : 'configuration' }
WARouteBuilder >> consumes: aString [
	<configuration>
	
	consumes add: (WAMimeTypeMatch fromString: aString)
]

{ #category : 'configuration methods' }
WARouteBuilder >> copy [
	<configuration>
	
	self method: 'COPY'
]

{ #category : 'private' }
WARouteBuilder >> create [
	^ path isNil
		ifTrue: [ self createSimpleRoute ]
		ifFalse: [ self createComplexRoute ]
]

{ #category : 'private' }
WARouteBuilder >> createComplexRoute [
	^ WAComplexRoute
		method: method selector: compiled selector pattern: path
		arguments: (GRPlatform current argumentNamesOf: compiled)
		produces: produces
		consumes: (self createMimeTypeMatch: consumes)
]

{ #category : 'private' }
WARouteBuilder >> createMimeTypeMatch: aCollection [
	^ aCollection isEmpty
		ifTrue: [ WAWildcardMimeTypeMatch new ]
		ifFalse: [
			aCollection size = 1
				ifTrue: [ aCollection first ]
				ifFalse: [ WACompositeMimeTypeMatch matches: aCollection ] ]
]

{ #category : 'private' }
WARouteBuilder >> createSimpleRoute [
	^ WASimpleRoute
		method: method
		selector: compiled selector
		produces: produces
		consumes: (self createMimeTypeMatch: consumes)
]

{ #category : 'configuration methods' }
WARouteBuilder >> delete [
	<configuration>
	
	self method: 'DELETE'
]

{ #category : 'configuration methods' }
WARouteBuilder >> get [
	<configuration>
	
	self method: 'GET'
]

{ #category : 'initialization' }
WARouteBuilder >> initializeOn: aCompiledMethod [
	self initialize.
	compiled := aCompiledMethod.
	method := 'GET'.
	path := aCompiledMethod selector greaseString.
	consumes := OrderedCollection new.
	produces := WAWildcardMimeTypeMatch new
]

{ #category : 'configuration' }
WARouteBuilder >> method: aString [
	<configuration>
	
	method := aString asUppercase
]

{ #category : 'configuration methods' }
WARouteBuilder >> move [
	<configuration>
	
	self method: 'MOVE'
]

{ #category : 'configuration methods' }
WARouteBuilder >> options [
	<configuration>

	self method: 'OPTIONS'
]

{ #category : 'configuration methods' }
WARouteBuilder >> patch [
	<configuration>

	self method: 'PATCH'
]

{ #category : 'configuration' }
WARouteBuilder >> path: aString [
	<configuration>
	
	path := aString
]

{ #category : 'configuration methods' }
WARouteBuilder >> post [
	<configuration>
	
	self method: 'POST'
]

{ #category : 'configuration' }
WARouteBuilder >> produces: aString [
	<configuration>
	
	produces := WAMimeTypeMatch fromString: aString
]

{ #category : 'configuration methods' }
WARouteBuilder >> put [
	<configuration>
	
	self method: 'PUT'
]
