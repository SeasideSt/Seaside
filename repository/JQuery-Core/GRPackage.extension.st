Extension { #name : #GRPackage }

{ #category : #'*jquery-core' }
GRPackage classSide >> jQueryCore [
	^ self new
		name: 'JQuery-Core';
		description: 'jQuery integration for Seaside. Designed to change the way you write Javascript.';
		addDependency: 'Javascript-Core';
		url: #seasideUrl;
		yourself
]
