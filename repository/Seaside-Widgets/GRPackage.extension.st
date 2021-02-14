Extension { #name : #GRPackage }

{ #category : #'*Seaside-Widgets' }
GRPackage class >> seasideWidgets [
	^ self new
		name: 'Seaside-Widgets';
		description: 'Various sample Decorations and Components that require Canvas.';
		addDependency: 'Seaside-Canvas';
		addDependency: 'Seaside-Component';
		url: #seasideUrl;
		yourself
]
