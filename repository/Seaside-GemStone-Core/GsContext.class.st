Class {
	#name : #GsContext,
	#superclass : #Object,
	#instVars : [
		'continuation',
		'level',
		'method',
		'source',
		'mySelf',
		'receiver'
	],
	#category : 'Seaside-GemStone-Core'
}

{ #category : #'instance creation' }
GsContext class >> fromContinuation: aContinuation atLevel: anInteger [

^self new continuation: aContinuation level: anInteger
]

{ #category : #'instance creation' }
GsContext class >> fromLevel: anInteger [

^self new continuation: (GsProcess continuationFromLevel: anInteger)  level: 1
]

{ #category : #formatting }
GsContext >> asString [

	^self fullPrintString
]

{ #category : #initialization }
GsContext >> continuation: aContinuation level: anInteger [
  continuation := aContinuation.
  level := anInteger.	"these instance variables are populated for the WAWalkback use"
  method := (continuation _frameContentsAt: level) at: 1.
  source := method sourceString.
  receiver := (continuation _frameContentsAt: level) at: 10.
  mySelf := (continuation _frameContentsAt: level) at: 8
]

{ #category : #accessing }
GsContext >> fullPrintString [


^continuation _reportAt: level
]

{ #category : #formatting }
GsContext >> greaseString [

	^self fullPrintString
]

{ #category : #accessing }
GsContext >> method [

^method
]

{ #category : #accessing }
GsContext >> receiver [

^receiver
]

{ #category : #accessing }
GsContext >> sender [

continuation stackDepth == level ifTrue: [^nil].
^self class fromContinuation: continuation atLevel: level + 1
]

{ #category : #accessing }
GsContext >> tempAt: index [
  | ar |
  ar := continuation _frameContentsAt: level.
  ar size < (10 + index)
    ifTrue: [ ^ nil ].
  ^ ar at: 10 + index
]

{ #category : #accessing }
GsContext >> tempNames [
  ^ (continuation _frameContentsAt: level) at: 9
]
