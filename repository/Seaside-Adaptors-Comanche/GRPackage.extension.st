Extension { #name : #GRPackage }

{ #category : #'*seaside-adaptors-comanche' }
GRPackage class >> seasideAdaptorsComanche [
	^ self new
		name: 'Seaside-Adaptors-Comanche';
		description: 'Makes Seaside run on the Comanche HTTP server.';
		addDependency: 'Seaside-Pharo-Core';
		url: #seasideUrl;
		yourself
]
