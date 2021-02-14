Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-renderloop' }
GRPackage class >> seasideTestsRenderLoop [
	^ self new
		name: 'Seaside-Tests-RenderLoop';
		description: 'Unit tests for the package Seaside-RenderLoop.';
		addDependency: 'Seaside-RenderLoop';
		addDependency: 'Seaside-Tests-Session';
		url: #seasideUrl;
		yourself
]
