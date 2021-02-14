Extension { #name : #GRPackage }

{ #category : #'*seaside-gemstone-environment' }
GRPackage class >> seasideGemStoneEnvironment [
	^ self new
		name: 'Seaside-GemStone-Environment';
		addDependency: 'Seaside-Environment';
		url: #gemstoneUrl;
		yourself
]
