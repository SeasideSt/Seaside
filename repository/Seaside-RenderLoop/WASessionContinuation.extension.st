Extension { #name : #WASessionContinuation }

{ #category : #'*seaside-renderloop' }
WASessionContinuation classSide >> isRenderLoopContinuation [
	^ false
]

{ #category : #'*seaside-renderloop' }
WASessionContinuation >> isRenderLoopContinuation [
	^ self class isRenderLoopContinuation
]
