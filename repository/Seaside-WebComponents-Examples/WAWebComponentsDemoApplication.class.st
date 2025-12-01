"
I demonstrate how Seaside Components can be used as Web Components.

Normally I would not be a Seaside application but instead use a different technolog.
"
Class {
	#name : 'WAWebComponentsDemoApplication',
	#superclass : 'WAComponent',
	#category : 'Seaside-WebComponents-Examples',
	#package : 'Seaside-WebComponents-Examples'
}

{ #category : 'testing' }
WAWebComponentsDemoApplication class >> canBeRoot [
	^ true
]

{ #category : 'initialization' }
WAWebComponentsDemoApplication class >> initialize [
	| application |
	"register such that we do not have the developer tools"
	application := WAAdmin register: WAApplication at: 'examples/web-components' in: WAAdmin defaultDispatcher.
	application configuration addParent: WARenderLoopConfiguration instance.
	application
		rootClass: self;
		scriptGeneratorClass: WANullScriptGenerator
]

{ #category : 'rendering' }
WAWebComponentsDemoApplication >> renderContentOn: html [
	html heading: 'Seaside WebComponents Demo'.
	(html tag: 'wa-component')
		attributeAt: 'url' put: '/examples/headless-counter';
		attributeAt: 'ajaxify' put: 'true';
		with: 'Loading...'.
	html script: '
		const components = document.getElementsByTagName("wa-component");
		for (const component of components) {
			component.addEventListener("wa-component.xhr", (event) => {
				console.error("wa-component xhr call failed %O", event) });
		};'
	
]

{ #category : 'updating' }
WAWebComponentsDemoApplication >> updateRoot: aRoot [
	super updateRoot: aRoot.
	aRoot title: 'Seaside WebComponents Demo'.
	aRoot script
		url: (WAWebComponentsLibrary / #seasideWebComponentsJs);
		defer
]
