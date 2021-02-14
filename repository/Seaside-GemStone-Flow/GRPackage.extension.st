Extension { #name : #GRPackage }

{ #category : #'*seaside-gemstone-flow' }
GRPackage class >> seasideGemStoneFlow [
	^ self new
		name: 'Seaside-GemStone-Flow';
		addDependency: 'Seaside-Flow';
		addDependency: 'Grease-GemStone-Core';
		addDependency: 'Seaside-GemStone-Continuation';
		url: #gemstoneUrl;
		yourself
]
