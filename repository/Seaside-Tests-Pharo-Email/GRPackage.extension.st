Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-pharo-email' }
GRPackage classSide >> seasideTestsPharoEmail [
	^ self new
		name: 'Seaside-Tests-Pharo-Email';
		description: 'Test for the Pharo implementation of "Seaside-Email".';
		addDependency: 'Seaside-Email';
		addDependency: 'Seaside-Pharo-Email';
		addDependency: 'Grease-Tests-Pharo-Core';
		url: #seasideUrl;
		yourself
]
