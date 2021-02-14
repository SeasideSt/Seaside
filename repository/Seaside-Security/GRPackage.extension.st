Extension { #name : #GRPackage }

{ #category : #'*seaside-security' }
GRPackage class >> seasideSecurity [
	^ self new
		name: 'Seaside-Security';
		addDependency: 'Seaside-Core';
		url: #seasideUrl;
		yourself
]
