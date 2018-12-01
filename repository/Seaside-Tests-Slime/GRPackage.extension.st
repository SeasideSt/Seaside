Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-slime' }
GRPackage classSide >> seasideTestsSlime [
	^ self new
		name: 'Seaside-Tests-Slime';
		description: 'Unit tests for the package Seaside-Slime.';
		addDependency: 'Seaside-Slime';
		addDependency: 'Grease-Tests-Slime';
		addDependency: 'Seaside-Tests-Component';
		url: #seasideUrl;
		yourself
]
