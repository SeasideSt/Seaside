Extension { #name : #WASessionContinuation }

{ #category : #'*seaside-renderloop' }
WASessionContinuation class >> isRenderLoopContinuation [
	^ false
]

{ #category : #'*seaside-renderloop' }
WASessionContinuation >> isRenderLoopContinuation [
	^ self class isRenderLoopContinuation
]
