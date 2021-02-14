Extension { #name : #GRPackage }

{ #category : #'*seaside-internetexplorer' }
GRPackage class >> seasideInternetExplorer [
	^ self new
		name: 'Seaside-InternetExplorer';
		description: 'Support for proprietary Internet Explorer functionality.';
		addDependency: 'Seaside-Core';
		url: #seasideUrl;
		yourself
]
