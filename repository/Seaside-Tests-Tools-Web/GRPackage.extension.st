Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-tools-web' }
GRPackage class >> seasideTestsToolsWeb [
	^ self new
		name: 'Seaside-Tests-Tools-Web';
		description: 'Unit tests for the package Seaside-Tools-Web.';
		addDependency: 'Seaside-Tools-Web';
		addDependency: 'Seaside-Tests-Environment';
		url: #seasideUrl;
		yourself
]
