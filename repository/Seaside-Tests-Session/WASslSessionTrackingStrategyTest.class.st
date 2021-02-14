Class {
	#name : #WASslSessionTrackingStrategyTest,
	#superclass : #WAInvisibleSessionTrackingStrategyTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #private }
WASslSessionTrackingStrategyTest >> createRequest [
	^ super createRequest
		setSslSessionId: self sslSessionId;
		yourself
]

{ #category : #private }
WASslSessionTrackingStrategyTest >> newStrategy [
	^ WASslSessionTrackingStrategy new
]

{ #category : #private }
WASslSessionTrackingStrategyTest >> sessionId [
	^ self sslSessionId
]

{ #category : #private }
WASslSessionTrackingStrategyTest >> sslSessionId [
	^ 'F42BAA17C89C707060E6BF5D251CC7E8832117056C1A8B0883387CA0EDDB52CF'
]
