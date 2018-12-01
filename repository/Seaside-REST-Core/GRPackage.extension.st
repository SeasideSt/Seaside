Extension { #name : #GRPackage }

{ #category : #'*seaside-rest-core' }
GRPackage classSide >> seasideRestCore [
	^ self new
		name: 'Seaside-REST-Core';
		description: 'Write RESTful web services using Seaside';
		addDependency: 'Seaside-Core';
		url: #seasideUrl;
		yourself
]
