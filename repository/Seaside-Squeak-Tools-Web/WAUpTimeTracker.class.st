"
WAUpTimeTracker is used to track the TimeStamp when the image last booted.

Access the TimeStamp when the image booted as follows:

	WAUpTimeTracker imageBootTime.

Access the Duration how long ago the image booted as follows:

	WAUpTimeTracker imageUpTime.

At system startup the imageBootTime is (re)set automatically.

This is a work around for Time millisecondClockValue wrapping around.
"
Class {
	#name : #WAUpTimeTracker,
	#superclass : #WAObject,
	#instVars : [
		'imageBootTime'
	],
	#classVars : [
		'Default'
	],
	#category : 'Seaside-Squeak-Tools-Web'
}

{ #category : #accessing }
WAUpTimeTracker class >> default [
	^ Default ifNil: [ Default := self new ]  
]

{ #category : #accessing }
WAUpTimeTracker class >> imageBootTime [
	^ self default imageBootTime 
]

{ #category : #accessing }
WAUpTimeTracker class >> imageUpTime [
	^ self default imageUpTime 
]

{ #category : #initialization }
WAUpTimeTracker class >> initialize [ 
	GRPlatform current addToStartUpList: self
]

{ #category : #initialization }
WAUpTimeTracker class >> startUp: resuming [
	resuming ifFalse: [
		"don't reset in case of just saving the image"
		^ self ].
	self default reset
]

{ #category : #initialization }
WAUpTimeTracker class >> unload [ 
	GRPlatform current removeFromShutDownList: self
]

{ #category : #accessing }
WAUpTimeTracker >> imageBootTime [
	^ imageBootTime 
]

{ #category : #accessing }
WAUpTimeTracker >> imageUpTime [
	^ DateAndTime now - self imageBootTime
]

{ #category : #initialization }
WAUpTimeTracker >> initialize [
	super initialize.
	self reset
]

{ #category : #accessing }
WAUpTimeTracker >> reset [
	imageBootTime := DateAndTime now
]
