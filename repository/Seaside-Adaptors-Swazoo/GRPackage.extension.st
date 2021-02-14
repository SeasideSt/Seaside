Extension { #name : #GRPackage }

{ #category : #'*seaside-adaptors-swazoo' }
GRPackage class >> seasideAdaptorsSwazoo [
	^ self new
		name: 'Seaside-Adaptors-Swazoo';
		description: 'Makes Seaside run on the Swazoo Web server.';
		addDependency: 'Seaside-Core';
		addDependency: 'Seaside-Swazoo';
		url: #seasideUrl;
		yourself
]
