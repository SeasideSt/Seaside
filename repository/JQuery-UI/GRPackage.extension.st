Extension { #name : #GRPackage }

{ #category : #'*JQuery-UI' }
GRPackage class >> jQueryUI [
	^ self new
		name: 'JQuery-UI';
		description: 'jQuery-UI integration for Seaside. Expression through code.';
		addDependency: 'JQuery-Core';
		url: #seasideUrl;
		yourself
]
