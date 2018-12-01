Extension { #name : #GRPackage }

{ #category : #'*seaside-squeak-tools-omnibrowser' }
GRPackage classSide >> seasideSqueakToolsOmniBrowser [
	^ self new
		name: 'Seaside-Squeak-Tools-OmniBrowser';
		description: 'Support code to work with the OmniBrowser in Squeak.';
		addDependency: 'Seaside-Tools-OmniBrowser';
		url: #seasideUrl;
		yourself
]
