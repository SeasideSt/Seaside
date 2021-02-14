Extension { #name : #GRPackage }

{ #category : #'*seaside-tools-omnibrowser' }
GRPackage class >> seasideToolsOmniBrowser [
	^ self new
		name: 'Seaside-Tools-OmniBrowser';
		description: 'OmniBrowser based tools to setup and configure server adaptor and dispatchers.';
		addDependency: 'Seaside-Tools-Core';
		url: #seasideUrl;
		yourself
]
