Extension { #name : #GRPackage }

{ #category : #'*seaside-session' }
GRPackage classSide >> seasideSession [
	^ self new
		name: 'Seaside-Session';
		description: 'Support for stateful and secure session handling.';
		addDependency: 'Seaside-Core';
		url: #seasideUrl;
		yourself
]
