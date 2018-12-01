Extension { #name : #GRPackage }

{ #category : #'*seaside-widgets' }
GRPackage classSide >> seasideWidgets [
	^ self new
		name: 'Seaside-Widgets';
		description: 'Various sample Decorations and Components that require Canvas.';
		addDependency: 'Seaside-Canvas';
		addDependency: 'Seaside-Component';
		url: #seasideUrl;
		yourself
]
