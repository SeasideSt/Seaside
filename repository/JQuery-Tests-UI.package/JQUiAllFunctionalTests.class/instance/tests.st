configuration
tests
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