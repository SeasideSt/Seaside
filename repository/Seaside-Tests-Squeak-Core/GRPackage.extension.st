Extension { #name : #GRPackage }

{ #category : #'*Seaside-Tests-Squeak-Core' }
GRPackage class >> seasideTestsSqueakCore [
	^ self new
		name: 'Seaside-Tests-Squeak-Core';
		addDependency: 'Seaside-Squeak-Core';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself
]
