Extension { #name : #GRPackage }

{ #category : #'*seaside-gemstone-tools-web' }
GRPackage class >> seasideGemStoneToolsWeb [
	^ self new
		name: 'Seaside-GemStone-Tools-Web';
		description: 'GemStone-specific web-based administration tools for Seaside.';
		addDependency: 'Seaside-Tools-Web';
		url: #gemstoneUrl;
		yourself
]
