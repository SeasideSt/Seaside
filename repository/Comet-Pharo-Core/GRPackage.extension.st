Extension { #name : #GRPackage }

{ #category : #'*comet-pharo-core' }
GRPackage class >> cometPharoCore [
	^ self new
		name: 'Comet-Pharo-Core';
		addDependency: 'Comet-Core';
		url: #seasideUrl;
		yourself
]
