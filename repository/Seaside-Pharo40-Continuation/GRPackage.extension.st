Extension { #name : #GRPackage }

{ #category : #'*Seaside-Pharo40-Continuation' }
GRPackage classSide >> seasidePharoContinuation [
	^ self new
		name: 'Seaside-Pharo40-Continuation';
		description: 'Pharo implementation of full and partial first-class continuations.';
		addDependency: 'Grease-Pharo-Core';
		url: #seasideUrl;
		yourself
]
