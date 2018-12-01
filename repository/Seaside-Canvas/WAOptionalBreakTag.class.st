Class {
	#name : #WAOptionalBreakTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #testing }
WAOptionalBreakTag >> isClosed [
	^ true
]

{ #category : #accessing }
WAOptionalBreakTag >> tag [
	^ 'wbr'
]
