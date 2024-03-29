Extension { #name : 'GRPackage' }

{ #category : '*seaside-tests-slime' }
GRPackage class >> seasideTestsSlime [
	^ self new
		name: 'Seaside-Tests-Slime';
		description: 'Unit tests for the package Seaside-Slime.';
		addDependency: 'Seaside-Pharo110-Slime';
		addDependency: 'Grease-Tests-Slime';
		addDependency: 'Seaside-Tests-Component';
		url: #seasideUrl;
		yourself
]
