"
I am the optimized implementation of a ring buffer on Pharo
"
Class {
	#name : 'ZnPharoRingBuffer',
	#superclass : 'ZnRingBuffer',
	#category : 'Seaside-Zinc-Pharo',
	#package : 'Seaside-Zinc-Pharo'
}

{ #category : 'accessing' }
ZnPharoRingBuffer >> at: anInteger [
	self checkBoundsFor: anInteger.
	
	^ buffer atWrap: anInteger + offset
]

{ #category : 'accessing' }
ZnPharoRingBuffer >> at: anInteger put: anObject [
	self checkBoundsFor: anInteger.
		
	buffer
		atWrap: anInteger + offset
		put: anObject
]
