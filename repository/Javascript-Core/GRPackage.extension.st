Extension { #name : #GRPackage }

{ #category : #'*javascript-core' }
GRPackage classSide >> javascriptCore [
	^ self new
		name: 'Javascript-Core';
		description: 'Javascript integration in Seaside. Provides a basic functionality to generate Javascript from Smalltalk.';
		addDependency: 'Seaside-Core';
		addDependency: 'Seaside-Canvas';
		url: #seasideUrl;
		yourself
]
