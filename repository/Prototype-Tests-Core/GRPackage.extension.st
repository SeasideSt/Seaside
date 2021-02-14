Extension { #name : #GRPackage }

{ #category : #'*prototype-tests-core' }
GRPackage class >> prototypeTestsCore [
	^ self new
		name: 'Prototype-Tests-Core';
		description: 'Functional and unit tests for the Prototype-Core package.';
		addDependency: 'Prototype-Core';
		addDependency: 'Javascript-Tests-Core';
		addDependency: 'Seaside-Tests-Functional';
		url: #seasideUrl;
		yourself
]
