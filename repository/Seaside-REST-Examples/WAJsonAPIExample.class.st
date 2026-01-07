Class {
	#name : 'WAJsonAPIExample',
	#superclass : 'WARestfulHandler',
	#category : 'Seaside-REST-Examples',
	#package : 'Seaside-REST-Examples'
}

{ #category : 'registration' }
WAJsonAPIExample class >> register [

	WAAdmin register: self at: 'examples/jsonapi'
]

{ #category : 'json api' }
WAJsonAPIExample >> getClasses [

	<get>
	<path: '/classes/'>
	<produces: 'application/json'>

	^ WAJsonCanvas builder render: [ :json |
			json array: [ 
				Smalltalk allClasses do:[ :class |
					json object: [
						json 
							key: 'name' value: class name;
							key: 'instvars' value: [ json array: [ class instVarNames do: [ :iv | json string: iv ] ] ] ] ] ] ]
]

{ #category : 'json api' }
WAJsonAPIExample >> getClassesMatching: classNameSubstring [

	<get>
	<path: '/classes?substring={classNameSubstring}'>
	<produces: 'application/json'>

	^ WAJsonCanvas builder render: [ :json |
		json array: [
			(Smalltalk allClasses select: [ :class | (class name indexOfSubCollection: classNameSubstring startingAt: 0) ~= 0 ]) 
				do: [ :class |
					json object: [
						json
							key: 'name' value: class name;
							key: 'instvars' value: [ json array: [ class instVarNames do: [ :iv | json string: iv ] ] ] ] ] ] ]
]

{ #category : 'json api' }
WAJsonAPIExample >> getMethodsOf: className [

	<get>
	<path: '/class/{className}/methods'>
	<produces: 'application/json'>
	
	| theClass |
	theClass := Smalltalk at: className asSymbol ifAbsent: [ self respondNotFound ].

	^ WAJsonCanvas builder render: [ :json |
		json array: [
			theClass methodsDo: [ :method |
					json object: [
						json
							key: 'selector' value: method selector;
							key: 'source' value: (GRPlatform current sourceCodeStringOf: method) ] ] ] ]
]

{ #category : 'helpers' }
WAJsonAPIExample >> respondNotFound [
	
	self requestContext responseGenerator
		notFound;
		respond
]
