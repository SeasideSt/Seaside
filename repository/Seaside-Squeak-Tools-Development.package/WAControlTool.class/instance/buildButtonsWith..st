building
buildButtonsWith: builder

	| panelSpec |
	panelSpec := builder pluggablePanelSpec new.
	panelSpec
		layout: #horizontal;
		children: OrderedCollection new.
	self buttonSpecs do:[:spec|
		| buttonSpec |
		buttonSpec := builder pluggableActionButtonSpec new
			model: self;
			label: spec first;
			action: spec second;
			enabled: spec third;
			yourself.
		spec size > 3 ifTrue:[buttonSpec help: spec fourth].
		panelSpec children addLast: buttonSpec.
	].
	^panelSpec