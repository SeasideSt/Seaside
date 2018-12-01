Extension { #name : #GRPackage }

{ #category : #'*seaside-security' }
GRPackage classSide >> seasideSecurity [
	^ self new
		name: 'Seaside-Security';
		addDependency: 'Seaside-Core';
		url: #seasideUrl;
		yourself
]
