Extension { #name : #GRPackage }

{ #category : #'*Seaside-Tests-Pharo40-Core' }
GRPackage classSide >> seasideTestsPharo40Core [
	^ self new
		name: 'Seaside-Tests-Pharo40-Core';
		addDependency: 'Seaside-Pharo20-Core';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself
]
