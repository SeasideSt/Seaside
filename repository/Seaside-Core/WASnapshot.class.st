"
I represent a memory snapshot of objects. Objects can be registered by sending the message #register:. All object snapshots are updated by sending #snapshot and restored by sending #restore. To have specific snpshot and restore actions for particular classes override #snapshotCopy and #restoreFromSnapshot: in your classes.
"
Class {
	#name : #WASnapshot,
	#superclass : #WAObject,
	#instVars : [
		'objects'
	],
	#category : 'Seaside-Core-Backtracking'
}

{ #category : #initialization }
WASnapshot >> initialize [
	super initialize.
	self reset
]

{ #category : #registry }
WASnapshot >> register: anObject [
	"Register anObject for backtracking."

	anObject isNil
		ifFalse: [ objects at: anObject put: anObject snapshotCopy ]
]

{ #category : #actions }
WASnapshot >> reset [
	"Clears the snapshot dictionary."

	objects := IdentityDictionary new
]

{ #category : #actions }
WASnapshot >> restore [
	"Restore all the backtracked states."

	objects keysAndValuesDo: [ :key :value | key restoreFromSnapshot: value ]
]

{ #category : #actions }
WASnapshot >> snapshot [
	"Snapshot all the states that have been registered for backtracking overriding existing snapshots."

	objects associationsDo: [ :assoc | assoc value: assoc key snapshotCopy ]
]
