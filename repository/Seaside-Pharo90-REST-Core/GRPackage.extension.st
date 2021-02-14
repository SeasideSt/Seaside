Extension { #name : #GRPackage }

{ #category : #'*Seaside-Pharo90-REST-Core' }
GRPackage class >> seasidePharoRestCore [
	^ self new
		name: 'Seaside-Pharo90-REST-Core';
		description: 'Write RESTful web services using Seaside';
		addDependency: 'Seaside-REST-Core';
		url: #seasideUrl;
		yourself
]
