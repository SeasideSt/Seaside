Class {
	#name : #WANode,
	#superclass : #OBNode,
	#category : 'Seaside-Tools-OmniBrowser'
}

{ #category : #testing }
WANode >> isAttribute [
	^ false
]

{ #category : #testing }
WANode >> isHandler [
	^ false
]

{ #category : #testing }
WANode >> isServerAdaptor [
	^ false
]
