Class {
	#name : #WAGemStoneMutex,
	#superclass : #WAObject,
	#instVars : [
		'semaphore',
		'owner'
	],
	#category : 'Seaside-GemStone-Core-Utilities'
}

{ #category : #copying }
WAGemStoneMutex >> copy [
	^ self species new
]

{ #category : #'mutual exclusion' }
WAGemStoneMutex >> critical: aBlock [
	| process |
	process := Processor activeProcess.
	^ (self owner == process)
		ifTrue: [ aBlock value ]
		ifFalse: [
			semaphore critical: [
				self owner: process.
				aBlock ensure: [ self owner: nil ] ] ]
]

{ #category : #initialization }
WAGemStoneMutex >> initialize [
	super initialize.
	semaphore := GRPlatform current semaphoreClass forMutualExclusion.
	owner := TransientValue value: nil.
]

{ #category : #accessing }
WAGemStoneMutex >> owner [
	^ owner value
]

{ #category : #accessing }
WAGemStoneMutex >> owner: aProcessOrNil [

	owner ~~  nil ifTrue: [ owner value: aProcessOrNil ]
]

{ #category : #'mutual exclusion' }
WAGemStoneMutex >> terminateOwner [
	self owner isNil ifFalse: [ GRPlatform current terminateProcess: self owner ]
]
