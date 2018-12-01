Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-welcome' }
GRPackage classSide >> seasideTestsWelcome [
	^ self new
		name: 'Seaside-Tests-Welcome';
		description: 'Unit tests for the welcome screen.';
		addDependency: 'Seaside-Welcome';
		url: #seasideUrl;
		yourself
]
