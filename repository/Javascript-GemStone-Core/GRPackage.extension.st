Extension { #name : #GRPackage }

{ #category : #'*javascript-gemstone-core' }
GRPackage class >> javascriptGemStoneCore [
	^ self new
		name: 'Javascript-GemStone-Core';
		addDependency: 'Javascript-Core';
		url: #gemstoneUrl;
		yourself
]
