Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-pharo-continuation' }
GRPackage class >> seasideTestsPharoContinuation [
	^ self new
		name: 'Seaside-Tests-Pharo-Continuation';
		description: 'Tests of Pharo continuation implementation.';
		addDependency: 'Seaside-Pharo-Continuation';
		addDependency: 'Grease-Tests-Core';
		url: #seasideUrl;
		yourself
]
