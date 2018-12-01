Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo-security' }
GRPackage classSide >> seasidePharoSecurity [
	^ self new
		name: 'Seaside-Pharo-Security';
		addDependency: 'Seaside-Security';
		url: #seasideUrl;
		yourself
]
