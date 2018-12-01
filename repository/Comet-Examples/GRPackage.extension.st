Extension { #name : #GRPackage }

{ #category : #'*comet-examples' }
GRPackage classSide >> cometExamples [
	^ self new
		name: 'Comet-Examples';
		description: 'Examples for server push technology.';
		addDependency: 'JQuery-UI';
		addDependency: 'Comet-Core';
		url: #seasideUrl;
		yourself
]
