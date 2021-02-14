Class {
	#name : #WASessionTrackingStrategyTest,
	#superclass : #WAHandlerTrackingStrategyTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #testing }
WASessionTrackingStrategyTest class >> isAbstract [
	^ self name = #WASessionTrackingStrategyTest
]

{ #category : #private }
WASessionTrackingStrategyTest >> assertNotFound: aRequestContext [
	self assert: aRequestContext response status = WAResponse statusFound.
	self assert: (aRequestContext response headerAt: 'Location') greaseString = '/catspajamassc2'
]

{ #category : #private }
WASessionTrackingStrategyTest >> assertOk: aRequestContext [
	self assert: aRequestContext response status = WAResponse statusOk
]

{ #category : #configuration }
WASessionTrackingStrategyTest >> createHandlers [
	^ Array with: self newApplication
]

{ #category : #private }
WASessionTrackingStrategyTest >> newApplication [
	^ WARedirectingApplication new
		cache: WAUnidirectionalCache new;
		yourself
]

{ #category : #private }
WASessionTrackingStrategyTest >> newSession [
	^ WASession new
]
