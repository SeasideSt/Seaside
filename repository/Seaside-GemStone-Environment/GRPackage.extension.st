Extension { #name : #GRPackage }

{ #category : #'*seaside-gemstone-environment' }
GRPackage classSide >> seasideGemStoneEnvironment [
	^ self new
		name: 'Seaside-GemStone-Environment';
		addDependency: 'Seaside-Environment';
		url: #gemstoneUrl;
		yourself
]
