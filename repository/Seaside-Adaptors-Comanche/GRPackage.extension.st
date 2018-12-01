Extension { #name : #GRPackage }

{ #category : #'*seaside-adaptors-comanche' }
GRPackage classSide >> seasideAdaptorsComanche [
	^ self new
		name: 'Seaside-Adaptors-Comanche';
		description: 'Makes Seaside run on the Comanche HTTP server.';
		addDependency: 'Seaside-Pharo-Core';
		url: #seasideUrl;
		yourself
]
