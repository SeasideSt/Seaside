Class {
	#name : #SUAllComponentTests,
	#superclass : #SUAllTests,
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #testing }
SUAllComponentTests class >> canBeRoot [
	^ true
]

{ #category : #accessing }
SUAllComponentTests class >> description [
	^ 'Scriptaculous Component Functional Test Suite'
]

{ #category : #initialization }
SUAllComponentTests class >> initialize [
	(WAAdmin register: self asApplicationAt: 'javascript/scriptaculous-components')
		preferenceAt: #scriptGeneratorClass put: PTScriptGenerator;
		addLibrary: PTDevelopmentLibrary;
		addLibrary: SUDevelopmentLibrary;
		addLibrary: SUComponentLibrary;
		addLibrary: SUAllTestLibrary
]

{ #category : #initialization }
SUAllComponentTests >> initializeTabs [
	tabs := OrderedCollection new
		add: 'Welcome' -> (Array
			with: 'Welcome' -> SUWelcomeTest new
			with: 'Counter' -> SUCounterTest new);
		add: 'Window' -> (Array
			with: 'Window' -> SUWindowTest new
			with: 'Lightbox' -> SULightboxTest new
			with: 'TitlePane' -> SUTitlePaneTest new
			with: 'Splitter Vertical'-> SUVerticalSplitterTest new
			with: 'Splitter Horizontal'-> SUHorizontalSplitterTest new);
		add: 'Navigation' -> (Array
			with: 'TabPanel' -> SUTabPanelTest new
			with: 'Accordion' -> SUAccordionTest new
			with: 'Carousel' -> SUCarouselTest new
			with: 'Carousel Horizontal'-> SUCarouselHorizontalTest new
			with: 'Carousel Vertical'-> SUCarouselVerticalTest new);
		add: 'Controls' -> (Array
			with: 'TieredList' -> SUTieredListTest new
			with: 'TreeReport' -> SUTreeReportTest new
			with: 'DatePicker' -> SUDatePickerTest new);
		yourself
]

{ #category : #rendering }
SUAllComponentTests >> renderChildrenOn: html [
	"Display 'Example Source' and 'Actual Source' using a lightbox. "

	html div id: 'content'; with: [
		selected do: [ :each |
			html heading: each key; render: each value.
			each value testClass isNil ifFalse: [
				html paragraph: [
					html anchor
						callback: [ self lightbox: (SUClassBrowser onClass: each value testClass) ];
						with: 'Example source'.
					each value coreClass isNil ifFalse: [
						html break.
						html anchor
							callback: [ self lightbox: (SUClassBrowser onClass: each value coreClass) ];
							with: 'Actual implementation' ] ] ]
				 ] ]
]

{ #category : #accessing }
SUAllComponentTests >> title [
	^ super title , ' Components'
]
