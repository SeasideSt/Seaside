Extension { #name : #GRPackage }

{ #category : #'*Seaside-Flow' }
GRPackage class >> seasideFlow [
	^ self new
		name: 'Seaside-Flow';
		description: 'Define control flow as a continuous piece of code, with natural, linear control flow.';
		addDependency: 'Seaside-Core'; "Methods are added to WARequestContext"
		addDependency: 'Seaside-Component'; "Methods are added to WAComponent"
		addDependency: 'Seaside-RenderLoop'; "Methods are added to WASession that depend on RenderLoop"
		addDependency: 'Seaside-Tools-Core';
		url: #seasideUrl;
		yourself
]
