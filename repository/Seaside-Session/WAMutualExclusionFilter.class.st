Class {
	#name : #WAMutualExclusionFilter,
	#superclass : #WARequestFilter,
	#instVars : [
		'mutex'
	],
	#category : 'Seaside-Session-Filter'
}

{ #category : #processing }
WAMutualExclusionFilter >> handleFiltered: aRequestContext [
	(self shouldTerminate: aRequestContext)
		ifTrue: [ self terminate: aRequestContext ]
		ifFalse: [ mutex critical: [ super handleFiltered: aRequestContext ] ]
]

{ #category : #initialization }
WAMutualExclusionFilter >> initialize [
	super initialize.
	mutex := WAMutex new
]

{ #category : #private }
WAMutualExclusionFilter >> shouldTerminate: aRequestContext [
	^ (aRequestContext request fields includesKey: 'terminate')
		and: [ aRequestContext application preferenceAt: #sessionAllowTermination ]
]

{ #category : #private }
WAMutualExclusionFilter >> terminate: aRequestContext [
	mutex terminateOwner.
	aRequestContext respond: [ :response |
		response
			contentType: WAMimeType textPlain;
			nextPutAll: 'Process terminated' ]
]
