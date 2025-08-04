initialization
initialize

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