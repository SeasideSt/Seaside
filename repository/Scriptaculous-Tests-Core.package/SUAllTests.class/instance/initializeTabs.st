initialization
initializeTabs
	tabs := OrderedCollection new
		add: 'Welcome' -> (Array
			with: 'Welcome' -> SUWelcomeTest new
			with: 'Counter' -> SUCounterTest new);
		add: 'Ajax' -> (Array
			with: 'Updater' -> SUUpdaterTest new
			with: 'Periodical' -> SUPeriodicalTest new
			with: 'Evaluator' -> SUEvaluatorTest new);
		add: 'Form' -> (Array
			with: 'Elements' -> SUFormTest new);
		add: 'Controls' -> (Array
			with: 'Autocompleter' -> SUAutocompleterTest new
			with: 'In Place Editor' -> SUInPlaceEditorTest new
			with: 'Slider' -> SUSliderTest new);
		add: 'Drag & Drop' -> (Array
			with: 'Drag & Drop' -> SUDragDropTest new
			with: 'Sortable' -> SUSortableTest new
			with: 'Sortable (two lists)' -> SUSortableDoubleTest new
			with: 'Tree' -> SUTreeTest new);
		add: 'Effects' -> (Array
			with: 'Effects' -> SUEffectsTest new
			with: 'Toggles' -> SUTogglesTest new
			with: 'Morph' -> SUMorphTest new);
		yourself