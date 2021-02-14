Extension { #name : #GRPackage }

{ #category : #'*javascript-tests-pharo-core' }
GRPackage class >> javascriptTestsPharoCore [
	^ self new
		name: 'Javascript-Tests-Pharo-Core';
		description: 'Unit tests for the Javascript-Core package.';
		addDependency: 'Javascript-Tests-Core';
		addDependency: 'Javascript-Pharo-Core';
		url: #seasideUrl;
		yourself
]
