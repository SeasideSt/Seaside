Class {
	#name : 'WAHotwiredClassBrowserExample',
	#superclass : 'WAComponent',
	#instVars : [
		'environment',
		'packagesPane',
		'classesPane',
		'methodcategoriesPane',
		'methodsPane',
		'methodEditor',
		'classSide',
		'searchTerm'
	],
	#category : 'Seaside-HotwireTurbo-ClassBrowserExample',
	#package : 'Seaside-HotwireTurbo-ClassBrowserExample'
}

{ #category : 'testing' }
WAHotwiredClassBrowserExample class >> canBeRoot [

	^ true
]

{ #category : 'initialization' }
WAHotwiredClassBrowserExample class >> initialize [

	self register
]

{ #category : 'testing' }
WAHotwiredClassBrowserExample class >> register [
	"test"
	| app |
	app := WAAdmin register: self asApplicationAt: '/examples/hotwired/classbrowser'.
	app
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation;
		preferenceAt: #renderPhaseContinuationClass put: WATurboRenderPhaseContinuation;
		preferenceAt: #sessionClass put: WAHotwireClassBrowserSession;
		addLibrary: WAHotwiredClassBrowserFileLibrary;
		addLibrary: JQDeploymentLibrary 
]

{ #category : 'hooks' }
WAHotwiredClassBrowserExample >> children [

	^ { packagesPane . classesPane . methodcategoriesPane . methodsPane . methodEditor }
]

{ #category : 'accessing' }
WAHotwiredClassBrowserExample >> classSide: aBoolean [

	classSide := aBoolean.
	methodcategoriesPane refreshList.
	methodsPane refreshList
]

{ #category : 'accessing' }
WAHotwiredClassBrowserExample >> environment [

	^ environment
]

{ #category : 'initialization' }
WAHotwiredClassBrowserExample >> initialize [

	super initialize.
	classSide := false.
	environment := RBBrowserEnvironment default.
	packagesPane := (WAHotwiredClassBrowserNavigationPane on: [ self visiblePackages ]) labels: [ :e | e name ].
	packagesPane cssClass: 'package-list'.
	packagesPane onSelectBlock: [ :ts | 
		ts
			replaceComponent: packagesPane morph: true with: packagesPane;
			replaceComponent: classesPane refreshList with: classesPane;
			replaceComponent: methodcategoriesPane refreshList with: methodcategoriesPane;
			replaceComponent: methodsPane refreshList with: methodsPane;
			replaceComponent: methodEditor with: methodEditor ].
	packagesPane addDecoration: WATurboFrame new.
	classesPane := (WAHotwiredClassBrowserNavigationPane on: [ self visibleClasses ]) labels: [ :e | e name ].
	classesPane cssClass: 'class-list'.
	classesPane onSelectBlock: [ :ts | 
		ts
			replaceComponent: classesPane refreshList morph: true with: classesPane;
			replaceComponent: methodcategoriesPane refreshList with: methodcategoriesPane;
			replaceComponent: methodsPane refreshList with: methodsPane;
			replaceComponent: methodEditor with: methodEditor ].
	classesPane addDecoration: WATurboFrame new.
	methodcategoriesPane := (WAHotwiredClassBrowserNavigationPane on: [ self visibleMethodCategories ]) labels: [ :e | e name ].
	methodcategoriesPane onSelectBlock: [ :ts |
		ts
			replaceComponent: methodcategoriesPane refreshList morph: true with: methodcategoriesPane;
			replaceComponent: methodsPane refreshList with: methodsPane;
			replaceComponent: methodEditor with: methodEditor ].
	methodcategoriesPane addDecoration: WATurboFrame new.
	methodsPane := (WAHotwiredClassBrowserNavigationPane on: [ self visibleMethods ]).
	methodsPane onSelectBlock: [ :ts | 
		ts
			replaceComponent: methodsPane refreshList morph: true with: methodsPane;
			replaceComponent: methodEditor with: methodEditor ].
	methodsPane addDecoration: WATurboFrame new.
	methodEditor := (WAMethodEditorComponent on: [ self selectedMethod ]).
	methodEditor addDecoration: WATurboFrame new.
]

{ #category : 'event handling' }
WAHotwiredClassBrowserExample >> pushClassChange: aClassAnnounce to: pusher [

	pusher turboStream: [ :ts | 
		ts 
			replaceComponent: classesPane refreshList with: classesPane;
			replaceComponent: methodcategoriesPane refreshList with: methodcategoriesPane;
			replaceComponent: methodsPane refreshList with: methodsPane;
			replaceComponent: methodEditor with: methodEditor ]
]

{ #category : 'event handling' }
WAHotwiredClassBrowserExample >> pushMethodChange: aMethodAnnounce to: pusher [

	pusher turboStream: [ :ts | 
		ts replaceComponent: methodEditor with: methodEditor ] 
]

{ #category : 'rendering' }
WAHotwiredClassBrowserExample >> renderClassAndInstanceControlsOn: html [

	| label |
	label := classSide ifTrue:[ 'Class' ] ifFalse: [ 'Instance' ].
	html anchor
		class: 'btn elevated';
		turboAction: 'replace';
		callback: [ self classSide: classSide not ];
		with: label
]

{ #category : 'rendering' }
WAHotwiredClassBrowserExample >> renderContentOn: html [

	html div
		class: 'row';
		with: [ 
			html div 
				class: 'col s3';
				with: packagesPane.
			html div
				class: 'col s3' ;
				with: classesPane.
			html div
				class: 'col s3' ;
				with: methodcategoriesPane.			
			html div
				class: 'col s3' ;
				with: methodsPane ].
	html div
		class: 'row';
		style: 'margin-bottom: 10px';
		with: [ 
			html div class: 'col s3'; with: [ self renderPackageSearchOn: html ].
			html div class: 'col s3'.
			html div
				class: 'col s3';
				with: [ self renderClassAndInstanceControlsOn: html ].
			html div class: 'col s3' ].
	html div
		class: 'row';
		with: [ 
			html div
				class: 'col s12';
				with: methodEditor ].
	html render: (WAWebSocketTurboStreamSource new pusher: self session pusher).
]

{ #category : 'rendering' }
WAHotwiredClassBrowserExample >> renderPackageSearchOn: html [

	html form
		get;
		turboTarget: packagesPane turboframeId;
		with: [ 
			html searchInput
				style: 'height: 2.5em';
				placeholder: 'Search...';
				onInput: (html javascript: 'this.form.requestSubmit()');
				callback: [ :value | self searchTerm: value ];
				value: searchTerm ]
]

{ #category : 'accessing' }
WAHotwiredClassBrowserExample >> searchTerm: aString [

	packagesPane filterTerm: aString
]

{ #category : 'accessing' }
WAHotwiredClassBrowserExample >> selectedClass [

	^ classSide
		ifTrue: [ classesPane selectedItem class ]
		ifFalse: [ classesPane selectedItem ]
]

{ #category : 'accessing' }
WAHotwiredClassBrowserExample >> selectedMethod [

	classesPane selectedItem ifNil: [ ^ nil ].
	methodsPane selectedItem ifNil: [ ^ nil ].
	^ self selectedClass >> methodsPane selectedItem
]

{ #category : 'accessing' }
WAHotwiredClassBrowserExample >> selectedMethodCategory [

	^ methodcategoriesPane selectedItem
]

{ #category : 'accessing' }
WAHotwiredClassBrowserExample >> selectedPackage [

	^ packagesPane selectedItem
]

{ #category : 'rendering' }
WAHotwiredClassBrowserExample >> updateRoot: aRoot [

	super updateRoot: aRoot.
	aRoot title: 'Class Browser'.
	aRoot javascript url: WAHotwiredClassBrowserFileLibrary / #idiomorphminJs.
	aRoot javascript
		type: 'module';
		url: WAHotwiredClassBrowserFileLibrary / #codeeditorControllerJs.
	aRoot meta turboRefreshMethod: 'morph'.
	aRoot meta turboRefreshScroll: 'preserve'
]

{ #category : 'accessing' }
WAHotwiredClassBrowserExample >> visibleClasses [

	self selectedPackage ifNil: [ ^ { } ].
	^ (self environment classesInPackage: self selectedPackage) sorted: [ :a :b | a name <= b name ]
]

{ #category : 'accessing' }
WAHotwiredClassBrowserExample >> visibleMethodCategories [

	self selectedClass ifNil: [ ^ { } ].
	^ (self environment protocolsFor: self selectedClass) sorted: [ :a :b | a name <= b name ]
]

{ #category : 'accessing' }
WAHotwiredClassBrowserExample >> visibleMethods [

	self selectedClass ifNil: [ ^ { } ].
	^ self selectedMethodCategory
		ifNil:[ self environment selectorsForClass: self selectedClass ]
		ifNotNil:[ self environment selectorsFor: self selectedMethodCategory in: self selectedClass ]
]

{ #category : 'accessing' }
WAHotwiredClassBrowserExample >> visiblePackages [

	^ self environment packages sorted
]
