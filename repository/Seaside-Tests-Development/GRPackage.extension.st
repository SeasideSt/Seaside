Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-development' }
GRPackage classSide >> seasideTestsDevelopment [
	^ self new
		name: 'Seaside-Tests-Development';
		description: 'Unit tests for the package Seaside-Development.';
		addDependency: 'Seaside-Development';
		addDependency: 'Seaside-Tests-Tools-Web';
		url: #seasideUrl;
		yourself
]
