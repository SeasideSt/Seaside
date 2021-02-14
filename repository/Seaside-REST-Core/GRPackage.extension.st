Extension { #name : #GRPackage }

{ #category : #'*seaside-rest-core' }
GRPackage class >> seasideRestCore [
	^ self new
		name: 'Seaside-REST-Core';
		description: 'Write RESTful web services using Seaside';
		addDependency: 'Seaside-Core';
		url: #seasideUrl;
		yourself
]
