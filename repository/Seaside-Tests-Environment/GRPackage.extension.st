Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-environment' }
GRPackage classSide >> seasideTestsEnvironment [
	^ self new
		name: 'Seaside-Tests-Environment';
		description: 'Unit tests for the package Seaside-Environment.';
		addDependency: 'Seaside-Environment';
		addDependency: 'Seaside-Tests-Component';
		addDependency: 'Seaside-Tests-RenderLoop';
		addDependency: 'Seaside-Tests-Session';
		addDependency: 'Seaside-Tests-Canvas';
		url: #seasideUrl;
		yourself
]
