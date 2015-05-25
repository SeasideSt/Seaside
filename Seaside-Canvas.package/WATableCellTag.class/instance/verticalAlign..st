attributes
verticalAlign: aString
	"This attribute specifies the vertical position of data within a cell. Possible values:

- top: Cell data is flush with the top of the cell.
- middle: Cell data is centered vertically within the cell. This is the default value.
- bottom: Cell data is flush with the bottom of the cell.
- baseline: All cells in the same row as a cell whose valign attribute has this value should have their textual data positioned so that the first text line occurs on a baseline common to all cells in the row. This constraint does not apply to subsequent text lines in these cells."
		
	self attributes at: 'valign' put: aString