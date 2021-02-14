Extension { #name : #GRPackage }

{ #category : #'*seaside-welcome' }
GRPackage class >> seasideWelcome [
	^ self new
		name: 'Seaside-Welcome';
		description: 'A welcome screen for new users.';
		addDependency: 'Seaside-Environment';
		addDependency: 'Seaside-Tools-Web';
		addDependency: 'Seaside-Widgets';
		addDependency: 'Seaside-Examples';
		addDependency: 'Seaside-Development';
		addDependency: 'JQuery-Core';
		addDependency: 'JQuery-UI';
		addDependency: 'Seaside-Flow'; "For #call: - Ideally to be removed"
		addDependency: 'Seaside-Tests-Flow'; "For WAFlowConvenienceFunctionalTest - Ideally to be removed"
		url: #seasideUrl;
		yourself
]
