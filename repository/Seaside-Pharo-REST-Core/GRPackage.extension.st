Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo-rest-core' }
GRPackage classSide >> seasidePharoRestCore [
	^ self new
		name: 'Seaside-Pharo-REST-Core';
		description: 'Write RESTful web services using Seaside';
		addDependency: 'Seaside-REST-Core';
		url: #seasideUrl;
		yourself
]
