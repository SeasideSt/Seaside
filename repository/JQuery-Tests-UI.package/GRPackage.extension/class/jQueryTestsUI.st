*jquery-tests-ui
jQueryTestsUI
	^ self new
		name: 'JQuery-Tests-UI';
		description: 'Functional and unit tests for the JQuery-UI package.';
		addDependency: 'JQuery-UI';
		addDependency: 'JQuery-Tests-Core';
		url: #seasideUrl;
		yourself