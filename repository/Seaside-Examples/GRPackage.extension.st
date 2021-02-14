Extension { #name : #GRPackage }

{ #category : #'*Seaside-Examples' }
GRPackage class >> seasideExamples [
	^ self new
		name: 'Seaside-Examples';
		description: 'Simple example applications and components.';
		addDependency: 'Seaside-Component';
		addDependency: 'Seaside-Canvas';
		addDependency: 'Seaside-Tools-Core'; "for WAAdmin"
		addDependency: 'Seaside-Development'; "for WADebugErrorHandler"
		addDependency: 'JQuery-Core';
		url: #seasideUrl;
		yourself
]
