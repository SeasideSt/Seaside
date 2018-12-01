Extension { #name : #GRPackage }

{ #category : #'*javascript-pharo-core' }
GRPackage classSide >> javascriptPharoCore [
	^ self new
		name: 'Javascript-Pharo-Core';
		addDependency: 'Javascript-Core';
		addDependency: 'Seaside-Pharo-Core';
		url: #seasideUrl;
		yourself
]
