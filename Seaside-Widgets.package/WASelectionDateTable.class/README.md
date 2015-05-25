WASelectionDateTable renders a table containing dates and rows. A user can select a continuous block of cells in the table.  The table contains one column for each date from startDate to endDate. The top row of the table groups columns by month and labels each month (January 2008). The second row contains the date of each month  (1-30) in the date range. The table also contains "rows size" rows. The first column of these rows contains the contents of the instance variable "rows". Rest of the cells contents are given by "cellBlock". 

Instance Variables:
	cellBlock	<BlockClosure [:rowIndex :date | ]>	returns text for the cell in row "rowIndex" and column for "date"
	dateSelectionEnd	<Date>	last selected date
	dateSelectionStart	<Date>	first selected date
	rowSelectionEnd	<Integer>	index of last selected row
	rowSelectionStart	<Integer>	index of first selected row

