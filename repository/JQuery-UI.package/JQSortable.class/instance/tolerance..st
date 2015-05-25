options-generated
tolerance: aString
	"This is the way the reordering behaves during drag. Possible values: 'intersect', 'pointer'. In some setups, 'pointer' is more natural.  
''intersect'': draggable overlaps the droppable at least 50% 
''pointer'': mouse pointer overlaps the droppable "

	self optionAt: 'tolerance' put: aString