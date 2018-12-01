Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-pharo20-core' }
GRPackage classSide >> seasideTestsPharo20Core [
	^ self new
		name: 'Seaside-Tests-Pharo20-Core';
		addDependency: 'Seaside-Pharo20-Core';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself
]
