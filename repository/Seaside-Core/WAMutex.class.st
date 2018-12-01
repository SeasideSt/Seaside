"
WAMutex provides mutual exclusion properties.

Only one process at a time can execute code within its #critical: method. Other processes attempting to call #critical: will block until the first process leaves the critical section. The process that owns the mutex (the one currently in the critical section), however, may call #critical: repeatedly without fear of blocking.

The process currently inside the critical section can be terminated by calling #terminateOwner. This will result in the process being unwound and the critical section being freed.
"
Class {
	#name : #WAMutex,
	#superclass : #WAObject,
	#instVars : [
		'semaphore',
		'owner'
	],
	#category : 'Seaside-Core-Utilities'
}

{ #category : #copying }
WAMutex >> copy [
	^ self species new
]

{ #category : #'mutual exclusion' }
WAMutex >> critical: aBlock [
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
WAMutex >> initialize [
	super initialize.
	semaphore := GRPlatform current semaphoreClass forMutualExclusion.
	owner := GRPlatform current newTransientValueHolder
]

{ #category : #accessing }
WAMutex >> owner [
	^ owner contents
]

{ #category : #accessing }
WAMutex >> owner: aProcess [
	owner contents: aProcess
]

{ #category : #'mutual exclusion' }
WAMutex >> terminateOwner [
	| o |
	o := self owner.
	o isNil ifFalse: [ GRPlatform current terminateProcess: o ]
]
