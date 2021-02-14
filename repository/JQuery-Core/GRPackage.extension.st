Extension { #name : #GRPackage }

{ #category : #'*jquery-core' }
GRPackage class >> jQueryCore [
	^ self new
		name: 'JQuery-Core';
		description: 'jQuery integration for Seaside. Designed to change the way you write Javascript.';
		addDependency: 'Javascript-Core';
		url: #seasideUrl;
		yourself
]
