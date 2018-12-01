Extension { #name : #GRPackage }

{ #category : #'*seaside-gemstone-basic-development' }
GRPackage classSide >> seasideGemStoneBasicDevelopment [
	^ self new
		name: 'Seaside-GemStone-Basic-Development';
		addDependency: 'Seaside-Tools-Web';
		url: #gemstoneUrl;
		yourself
]
