Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo-canvas' }
GRPackage class >> seasidePharoCanvas [
	^ self new
		name: 'Seaside-Pharo-Canvas';
		addDependency: 'Seaside-Canvas';
		addDependency: 'Seaside-Pharo-Core';
		url: #seasideUrl;
		yourself
]
