Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-utf8' }
GRPackage classSide >> seasideTestsUtf8 [
	^ self new
		name: 'Seaside-Tests-UTF8';
		description: 'Unit tests for UTF8 support.';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself
]
