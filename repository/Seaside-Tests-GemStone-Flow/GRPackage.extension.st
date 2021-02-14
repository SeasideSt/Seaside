Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-gemstone-flow' }
GRPackage class >> seasideTestsGemStoneFlow [
	^ self new
		name: 'Seaside-Tests-GemStone-Flow';
		description: 'GemStone-specific extensions to Seaside-Tests-Flow';
		addDependency: 'Seaside-Tests-Flow';
		url: #gemstoneUrl;
		yourself
]
