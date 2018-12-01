Class {
	#name : #WARouteVictimMock,
	#superclass : #Object,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #accessing }
WARouteVictimMock >> first: anObject [
	^ Array with: anObject
]

{ #category : #accessing }
WARouteVictimMock >> first: anFirstObject second: aSecondObject [
	^ Array with: anFirstObject with: aSecondObject
]

{ #category : #accessing }
WARouteVictimMock >> first: anFirstObject second: aSecondObject third: aThirdObject [
	^ Array with: anFirstObject with: aSecondObject with: aThirdObject
]

{ #category : #accessing }
WARouteVictimMock >> nothing [
	^ Array new
]
