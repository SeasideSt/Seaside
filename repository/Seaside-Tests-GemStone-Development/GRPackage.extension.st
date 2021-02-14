Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-gemstone-development' }
GRPackage class >> seasideTestsGemStoneDevelopment [
	^ self new
		name: 'Seaside-Tests-GemStone-Development';
		addDependency: 'Seaside-Tests-Development';
		url: #gemstoneUrl;
		yourself
]
