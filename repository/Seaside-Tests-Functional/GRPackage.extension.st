Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-functional' }
GRPackage classSide >> seasideTestsFunctional [
	^ self new
		name: 'Seaside-Tests-Functional';
		description: 'Functional Seaside test suite.';
		addDependency: 'Seaside-Environment';
		addDependency: 'Seaside-Widgets';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself
]
