Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-adaptors-comanche' }
GRPackage class >> seasideTestsAdaptorsComanche [
	^ self new
		name: 'Seaside-Tests-Adaptors-Comanche';
		description: 'Unit tests for the package Seaside-Adaptors-Comanche.';
		addDependency: 'Seaside-Adaptors-Comanche';
		addDependency: 'Seaside-Tests-Pharo-Core';
		url: #seasideUrl;
		yourself
]
