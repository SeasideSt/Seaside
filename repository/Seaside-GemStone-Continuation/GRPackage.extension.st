Extension { #name : #GRPackage }

{ #category : #'*seaside-gemstone-continuation' }
GRPackage classSide >> seasideGemStoneContinuation [
	^ self new
		name: 'Seaside-GemStone-Continuation';
		description: 'GemStone implementation of full and partial first-class continuations';
		addDependency: 'Grease-GemStone-Core';
		url: #gemstoneUrl;
		yourself
]
