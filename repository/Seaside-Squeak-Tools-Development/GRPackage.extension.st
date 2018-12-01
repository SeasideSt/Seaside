Extension { #name : #GRPackage }

{ #category : #'*seaside-squeak-tools-development' }
GRPackage classSide >> seasideSqueakToolsDevelopment [
	^ self new
		name: 'Seaside-Squeak-Tools-Development';
		description: 'Squeak Tools to setup and configure server adaptor and dispatchers.';
		addDependency: 'Seaside-Tools-Core';
		url: #seasideUrl;
		yourself
]
