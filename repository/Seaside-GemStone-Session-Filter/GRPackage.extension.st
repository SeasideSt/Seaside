Extension { #name : #GRPackage }

{ #category : #'*seaside-gemstone-session' }
GRPackage class >> seasideGemStoneSession [
	^ self new
		name: 'Seaside-GemStone-Session';
		addDependency: 'Seaside-Session';
		url: #gemstoneUrl;
		yourself
]
