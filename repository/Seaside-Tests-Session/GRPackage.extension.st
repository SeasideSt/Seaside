Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-session' }
GRPackage classSide >> seasideTestsSession [
	^ self new
		name: 'Seaside-Tests-Session';
		description: 'Unit tests for the package Seaside-Session.';
		addDependency: 'Seaside-Session';
		addDependency: 'Seaside-Tests-Core';
		addDependency: 'Seaside-Tests-Canvas';
		url: #seasideUrl;
		yourself
]
