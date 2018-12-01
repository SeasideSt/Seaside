Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo-tools-omnibrowser' }
GRPackage classSide >> seasidePharoToolsOmniBrowser [
	^ self new
		name: 'Seaside-Pharo-Tools-OmniBrowser';
		addDependency: 'Seaside-Tools-OmniBrowser';
		url: #seasideUrl;
		yourself
]
