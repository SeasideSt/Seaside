attributes
rowSpan: anInteger
	"This attribute specifies the number of rows spanned by the current cell. The default value of this attribute is one. The value zero means that the cell spans all rows from the current row to the last row of the current table section (rowgroup) in which the cell is defined. thead, tbody, and tfoot elements are rowgroups."
	
	self attributes at: 'rowspan' put: anInteger