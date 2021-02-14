Extension { #name : #GRPackage }

{ #category : #'*comet-core' }
GRPackage class >> cometCore [
	^ self new
		name: 'Comet-Core';
		description: 'Server push, stream events from the server to client.';
		addDependency: 'Javascript-Core';
		addDependency: 'Seaside-Canvas';
		url: #seasideUrl;
		yourself
]
