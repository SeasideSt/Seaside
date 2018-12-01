Extension { #name : #GRPackage }

{ #category : #'*javascript-gemstone-core' }
GRPackage classSide >> javascriptGemStoneCore [
	^ self new
		name: 'Javascript-GemStone-Core';
		addDependency: 'Javascript-Core';
		url: #gemstoneUrl;
		yourself
]
