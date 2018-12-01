Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-flow' }
GRPackage classSide >> seasideTestsFlow [
	^ self new
		name: 'Seaside-Tests-Flow';
		description: 'Functional tests for Seaside-Flow.';
		addDependency: 'Seaside-Flow';
		addDependency: 'Seaside-Tests-Functional';
		url: #seasideUrl;
		yourself
]
