Extension { #name : #GRPackage }

{ #category : #'*Seaside-Pharo-Continuation' }
GRPackage class >> seasidePharoContinuation [
	^ self new
		name: 'Seaside-Pharo-Continuation';
		description: 'Pharo implementation of full and partial first-class continuations.';
		addDependency: 'Grease-Pharo-Core';
		url: #seasideUrl;
		yourself
]
