Class {
	#name : #WAConfigurationTool,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #testing }
WAConfigurationTool class >> canBeRoot [
	^ true
]

{ #category : #accessing }
WAConfigurationTool class >> description [
	^ 'Configuration Tool'
]

{ #category : #'class initialization' }
WAConfigurationTool class >> initialize [
	(WAAdmin register: self asApplicationAt: 'config') addLibrary: WAToolFiles
]

{ #category : #'instance creation' }
WAConfigurationTool class >> new [
	^ self on: WAAdmin defaultDispatcher
]

{ #category : #'instance creation' }
WAConfigurationTool class >> on: anEntryPoint [
	^ self basicNew initializeOn: anEntryPoint; yourself
]

{ #category : #hooks }
WAConfigurationTool >> children [
	^ Array with: component
]

{ #category : #accessing }
WAConfigurationTool >> component [
	^ component
]

{ #category : #initialization }
WAConfigurationTool >> initializeOn: aDispatcher [
	self initialize.
	component := WAConfigurationBrowser on: aDispatcher
]

{ #category : #rendering }
WAConfigurationTool >> renderComponentOn: html [
	html render: component
]

{ #category : #rendering }
WAConfigurationTool >> renderContentOn: html [
	html table
		class: 'wa-config';
		cellpadding: 0;
		cellspacing: 0;
		with: [
			html tableRow: [
				html tableData
					style: 'width: 100%';
					with: [ self renderHeadingOn: html ].
				html tableData rowSpan: 2; with: [ self renderLogoOn: html ] ].
			html tableRow: [
				html tableData: [ self renderTopBarOn: html ] ] ].
	html div: [ self renderComponentOn: html ]
]

{ #category : #rendering }
WAConfigurationTool >> renderHeadingOn: html [
	html div
		class: 'header';
		with: self title
]

{ #category : #rendering }
WAConfigurationTool >> renderLogoOn: html [
	html anchor
		url: (WAUrl new 
			host: 'www.seaside.st';
			yourself);
		with: [ html div class: 'smallLogo' ]
]

{ #category : #rendering }
WAConfigurationTool >> renderTopBarOn: html [ 
	| handler |
	html div
		class: 'topbar';
		with: [
			| selectedTools |
			handler := component selection.
			selectedTools := ((WAConfigurationToolPlugin 
				allSubclassesOn: handler
				for: component)
					select: [ :each | each isActive ]).
					
			(selectedTools	select: [ :each | each priority < 0 ])
				do: [ :each | html render: each ]
				separatedBy: [ html space ].
			html text: ' | '.	
			(selectedTools	select: [ :each | each priority >= 0 ])
				do: [ :each | html render: each ]
				separatedBy: [ html space ] ]
]

{ #category : #accessing }
WAConfigurationTool >> title [
	^ self component title
]
