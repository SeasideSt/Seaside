Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-gemstone-functional' }
GRPackage class >> seasideTestsGemStoneFunctional [
	^ self new
		name: 'Seaside-Tests-GemStone-Functional';
		description: 'GemStone specific functional Seaside test suite.';
		addDependency: 'Seaside-Tests-Functional';
		url: #gemstoneUrl;
		yourself
]
