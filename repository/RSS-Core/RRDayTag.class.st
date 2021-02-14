Class {
	#name : #RRDayTag,
	#superclass : #WATagBrush,
	#category : 'RSS-Core-Tags'
}

{ #category : #attributes }
RRDayTag >> friday [
	^ self with: 'Friday'
]

{ #category : #attributes }
RRDayTag >> monday [
	^ self with: 'Monday'
]

{ #category : #attributes }
RRDayTag >> saturday [
	^ self with: 'Saturday'
]

{ #category : #attributes }
RRDayTag >> sunday [
	^ self with: 'Sunday'
]

{ #category : #accessing }
RRDayTag >> tag [
	^ 'day'
]

{ #category : #attributes }
RRDayTag >> thursday [
	^ self with: 'Thursday'
]

{ #category : #attributes }
RRDayTag >> tuesday [
	^ self with: 'Tuesday'
]

{ #category : #attributes }
RRDayTag >> wednesday [
	^ self with: 'Wednesday'
]
