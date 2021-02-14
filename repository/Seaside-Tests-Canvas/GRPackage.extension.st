Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-canvas' }
GRPackage class >> seasideTestsCanvas [
	^ self new
		name: 'Seaside-Tests-Canvas';
		description: 'Unit tests for the package Seaside-Canvas.';
		addDependency: 'Seaside-Canvas';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself
]
