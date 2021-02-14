Extension { #name : #GRPackage }

{ #category : #'*Seaside-Pharo20-REST-Core' }
GRPackage class >> seasidePharoRestCore [
	^ self new
		name: 'Seaside-Pharo20-REST-Core';
		description: 'Write RESTful web services using Seaside';
		addDependency: 'Seaside-REST-Core';
		url: #seasideUrl;
		yourself
]
