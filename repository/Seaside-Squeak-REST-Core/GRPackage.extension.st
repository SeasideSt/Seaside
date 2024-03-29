Extension { #name : 'GRPackage' }

{ #category : '*seaside-squeak-rest-core' }
GRPackage class >> seasideSqueakRestCore [
	^ self new
		name: 'Seaside-Squeak-REST-Core';
		description: 'Write RESTful web services using Seaside';
		addDependency: 'Seaside-REST-Core';
		url: #seasideUrl;
		yourself
]
