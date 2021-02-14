Class {
	#name : #JQUiAllFunctionalTests,
	#superclass : #JQAllFunctionalTests,
	#instVars : [
		'themes',
		'theme'
	],
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #accessing }
JQUiAllFunctionalTests class >> description [
	^ 'jQuery UI Functional Test Suite'
]

{ #category : #initialization }
JQUiAllFunctionalTests class >> initialize [
	| application |
	application := WAAdmin register: self asApplicationAt: 'javascript/jquery-ui'.
	application preferenceAt: #scriptGeneratorClass put: JQScriptGenerator.
	application
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary
]

{ #category : #configuration }
JQUiAllFunctionalTests >> default [
	^ JQUiWelcomeFunctionalTest new
]

{ #category : #initialization }
JQUiAllFunctionalTests >> initialize [
	super initialize.
	themes := (JQBaseTheme withAllSubclasses
		collect: [ :each | each default ])
		asSortedCollection: [ :a :b | a themeName < b themeName ].
	theme := JQBaseTheme default
]

{ #category : #configuration }
JQUiAllFunctionalTests >> menu [
	^ #(('http://www.seaside.st/' 'Seaside') ('http://jquery.com/' 'jQuery') ('http://ui.jquery.com/' 'jQuery UI') ('http://docs.jquery.com/UI' 'Documentation'))
]

{ #category : #rendering }
JQUiAllFunctionalTests >> renderHeaderOn: html [
	super renderHeaderOn: html.
	self renderThemeOn: html
]

{ #category : #rendering }
JQUiAllFunctionalTests >> renderThemeOn: html [
	html form id: 'theme'; with: [
		html label: 'Theme: '.
		html select
			list: self themes;
			selected: self theme;
			labels: [ :each | each themeName ];
			callback: [ :value | theme := value ];
			onChange: (html jQuery this
				closest: 'form';
				triggerSubmit) ]
]

{ #category : #configuration }
JQUiAllFunctionalTests >> tests [
	^ Array
		with: 'Interaction' -> (OrderedCollection new
			add: 'Draggable' -> JQDraggableFunctionalTest new;
			add: 'Droppable' -> JQDroppableFunctionalTest new;
			add: 'Resizable' -> JQResizableFunctionalTest new;
			add: 'Selectable' -> JQSelectableFunctionalTest new;
			add: 'Sortable' -> JQSortableFunctionalTest new;
			yourself)
		with: 'Widgets' -> (OrderedCollection new
			add: 'Accordion' -> JQAccordionFunctionalTest new;
			add: 'Autocomplete' -> JQAutocompleteFunctionalTest new;
			add: 'Button' -> JQButtonFunctionalTest new;
			add: 'Datepicker' -> JQDatepickerFunctionalTest new;
			add: 'Dialog' -> JQDialogFunctionalTest new;
			add: 'Progressbar' -> JQProgressbarFunctionalTest new;
			add: 'Slider' -> JQSliderFunctionalTest new;
			add: 'Tabs' -> JQTabsFunctionalTest new;
			yourself)
		with: 'Effects' -> (OrderedCollection new
			add: 'Basic' -> JQEffectFunctionalTest new;
			add: 'Toggle' -> JQToggleFunctionalTest new;
			add: 'Transition' -> JQTransitionFunctionalTest new;
			yourself)
		with: 'Theming' -> (OrderedCollection new
			add: 'Icons' -> JQIconsFunctionalTest new;
			add: 'Visuals' -> JQVisualsFunctionalTest new;
			yourself)
]

{ #category : #configuration }
JQUiAllFunctionalTests >> theme [
	"Answer the currently selected theme."

	^ theme
]

{ #category : #configuration }
JQUiAllFunctionalTests >> themes [
	"Answer a list of all available themes."
	
	^ themes
]

{ #category : #configuration }
JQUiAllFunctionalTests >> title [
	^ 'jQuery UI for Seaside'
]

{ #category : #updating }
JQUiAllFunctionalTests >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	self theme updateRoot: anHtmlRoot.
	JQUiAllFunctionalTestsLibrary default 
		updateRoot: anHtmlRoot
]

{ #category : #configuration }
JQUiAllFunctionalTests >> url [
	^ 'http://ui.jquery.com/'
]
