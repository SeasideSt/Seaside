Extension { #name : #GRPackage }

{ #category : #'*comet-pharo-core' }
GRPackage classSide >> cometPharoCore [
	^ self new
		name: 'Comet-Pharo-Core';
		addDependency: 'Comet-Core';
		url: #seasideUrl;
		yourself
]
