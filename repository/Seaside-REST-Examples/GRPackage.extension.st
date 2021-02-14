Extension { #name : #GRPackage }

{ #category : #'*seaside-rest-examples' }
GRPackage class >> seasideRestExamples [
	^ self new
		name: 'Seaside-REST-Examples';
		description: 'Examples on how to use Seaside-REST-Core';
		addDependency: 'Seaside-REST-Core';
		addDependency: 'Seaside-Canvas';
		addDependency: 'Seaside-RenderLoop';
		url: #seasideUrl;
		yourself
]
