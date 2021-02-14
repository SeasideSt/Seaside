Class {
	#name : #WAIPSessionTrackingStrategyTest,
	#superclass : #WAInvisibleSessionTrackingStrategyTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #private }
WAIPSessionTrackingStrategyTest >> createRequest [
	^ super createRequest
		setRemoteAddress: self remoteAddress;
		yourself
]

{ #category : #private }
WAIPSessionTrackingStrategyTest >> newStrategy [
	^ WAIPSessionTrackingStrategy new
]

{ #category : #private }
WAIPSessionTrackingStrategyTest >> remoteAddress [
	^ '17.154.81.95'
]

{ #category : #private }
WAIPSessionTrackingStrategyTest >> sessionId [
	^ self remoteAddress
]
