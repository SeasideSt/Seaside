WADateTable renders a table containing dates from startDate to endDate. The table contains one column for each date from startDate to endDate. The top row of the table groups columns by month and labels each month (January 2008). The second row contains the date of each month (1-31) in the date range. The table also contains "rows size" rows. The first column of these rows contains the contents of the instance variable "rows". Rest of the cells are empty.

Basically this is an abstract superclass for WASelectionDateTable

Instance Variables:
	datesCache	<(SequenceableCollection of: Date>	contains a date object for each date in the range startDate-endDate
	endDate	<Date>	end date of the range displayed in the table
	rows	<SequenceableCollection>	labels of the rows
	startDate	<Date>	start date of the range displayed in the table

