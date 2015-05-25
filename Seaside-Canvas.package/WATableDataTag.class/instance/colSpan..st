attributes
colSpan: anInteger
	"This attribute specifies the number of columns spanned by the current cell. The default value of this attribute is one. The value zero means that the cell spans all columns from the current column to the last column of the column group (colgroup) in which the cell is defined."
	
	self attributes at: 'colspan' put: anInteger