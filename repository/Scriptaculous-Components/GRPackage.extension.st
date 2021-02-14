Extension { #name : #GRPackage }

{ #category : #'*Scriptaculous-Components' }
GRPackage class >> scriptaculousComponents [
	^ self new
		name: 'Scriptaculous-Components';
		description: 'A collection of AJAX based widgets written on top of script.aculo.us and Prototype.';
		addDependency: 'Scriptaculous-Core';
		addDependency: 'Seaside-Flow'; "Flow is used to implement #lightbox:"
		addDependency: 'Seaside-Widgets';  "SUDatePicker subclasses WAMiniCalendar"
		addDependency: 'Seaside-Component'; "WAComponent is extended"
		url: #seasideUrl;
		yourself
]
