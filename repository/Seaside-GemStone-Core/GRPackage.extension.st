Extension { #name : #GRPackage }

{ #category : #'*seaside-gemstone-core' }
GRPackage classSide >> seasideGemStoneCore [
	^ self new
		name: 'Seaside-GemStone-Core';
		addDependency: 'Seaside-Core';
		url: #gemstoneUrl;
		yourself
]
