Extension { #name : #GRPackage }

{ #category : #'*seaside-gemstone-development' }
GRPackage classSide >> seasideGemStoneDevelopment [
	^ self new
		name: 'Seaside-GemStone-Development';
		addDependency: 'Seaside-Development';
		addDependency: 'Seaside-GemStone-Basic-Development';
		url: #gemstoneUrl;
		yourself
]
