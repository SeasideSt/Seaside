Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo-tools-spec' }
GRPackage class >> seasidePharoToolsSpec [
	^ self new
		name: 'Seaside-Pharo-Tools-Spec';
		description: 'Spec based server adapter browser for Pharo';
		addDependency: 'Seaside-Tools-Core';
		url: #seasideUrl;
		yourself
]
