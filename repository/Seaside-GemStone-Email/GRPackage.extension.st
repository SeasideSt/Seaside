Extension { #name : #GRPackage }

{ #category : #'*seaside-gemstone-email' }
GRPackage classSide >> seasideGemStoneEmail [
	^ self new
		name: 'Seaside-GemStone-Email';
		description: 'GemStone implementation classes for the package "Seaside-Email".';
		addDependency: 'Seaside-Email';
		url: #gemstoneUrl;
		yourself
]
