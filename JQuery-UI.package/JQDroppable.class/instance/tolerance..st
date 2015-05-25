options-generated
tolerance: aString
	"Specifies which mode to use for testing whether a draggable is 'over' a droppable. Possible values: 'fit', 'intersect', 'pointer', 'touch'.  
''fit'': draggable overlaps the droppable entirely 
''intersect'': draggable overlaps the droppable at least 50% 
''pointer'': mouse pointer overlaps the droppable 
''touch'': draggable overlaps the droppable any amount "

	self optionAt: 'tolerance' put: aString