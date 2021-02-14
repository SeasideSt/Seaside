Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-gemstone-core' }
GRPackage class >> seasideTestsGemStoneCore [
	^ self new
		name: 'Seaside-Tests-GemStone-Core';
		addDependency: 'Seaside-Tests-Core';
		url: #gemstoneUrl;
		yourself
]
