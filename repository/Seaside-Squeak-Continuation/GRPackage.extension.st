Extension { #name : #GRPackage }

{ #category : #'*Seaside-Squeak-Continuation' }
GRPackage class >> seasideSqueakContinuation [
	^ self new
		name: 'Seaside-Squeak-Continuation';
		description: 'Squeak implementation of full and partial first-class continuations.';
		addDependency: 'Grease-Pharo-Core';
		url: #seasideUrl;
		yourself
]
