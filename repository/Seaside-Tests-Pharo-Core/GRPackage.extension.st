Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-pharo-core' }
GRPackage classSide >> seasideTestsPharoCore [
	^ self new
		name: 'Seaside-Tests-Pharo-Core';
		addDependency: 'Seaside-Pharo-Core';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself
]
