Extension { #name : #GRPackage }

{ #category : #'*seaside-gemstone-basic-development' }
GRPackage class >> seasideGemStoneBasicDevelopment [
	^ self new
		name: 'Seaside-GemStone-Basic-Development';
		addDependency: 'Seaside-Tools-Web';
		url: #gemstoneUrl;
		yourself
]
