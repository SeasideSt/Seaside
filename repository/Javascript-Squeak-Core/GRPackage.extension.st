Extension { #name : #GRPackage }

{ #category : #'*Javascript-Squeak-Core' }
GRPackage class >> javascriptSqueakCore [
	^ self new
		name: 'Javascript-Squeak-Core';
		addDependency: 'Javascript-Core';
		addDependency: 'Seaside-Squeak-Core';
		url: #seasideUrl;
		yourself
]
