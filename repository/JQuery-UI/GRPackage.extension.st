Extension { #name : #GRPackage }

{ #category : #'*jquery-ui' }
GRPackage classSide >> jQueryUI [
	^ self new
		name: 'JQuery-UI';
		description: 'jQuery-UI integration for Seaside. Expression through code.';
		addDependency: 'JQuery-Core';
		url: #seasideUrl;
		yourself
]
