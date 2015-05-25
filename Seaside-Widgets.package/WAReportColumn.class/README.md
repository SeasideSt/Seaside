WAReportColumn displays a column, one cell at a time, of a WAReportTable. Columns can be sorted, have a title, can have a total, and its element can be links. The valueBlock obtains the output (an object) to display for each row from the row's object.  The formatBlock is used to convert the valueBlock output to a string. If you need html markup to display the result, use the two argument form of valueBlock. However, columns with two argument valueBlock can not be sorted. See class methods for shortcut methods for setting the value block. 

For more information see:
	WATableReport

Instance Variables:
	clickBlock	<BlockClosure [:rowObject | ]>	When clickBlock is set items in column will be anchors. clickBlock is called with the selected object when anchor is clicked on. Typically clickBlock calls a component which generates a new page.
	formatBlock	<BlockClosure [:object | ]>	Should convert the result of the one-argument valueBlock to the string to be displayed. If formatBlock is nil then  "displayString" is sent to the result of valueBlock for the display string for this column.  
	hasTotal	<Boolean>	If true the column will display the sum of all elements in the column, sum is displayed in the last row.
	sortBlock	<BlockClosure [:a :b | ]>	Used to sort the element in the column. Arguments are the value from the one argument valueBlock
	title	<String>	Column header 
	valueBlock	<BlockClosure [:rowObject | ] or [:rowObject :aWARenderCanvas |] >	
		[:rowObject | ] this form results in an object that is to be displayed in a column cell, argument is the object for a given row (see WATableReport)
		[:rowObject :aHtmlCanvas |] this form is to render the value for a column cell from rowObject directly on aWRenderCanvas
cssClass
	title <String> CSS class
	the CSS class assigned to the <td>-tag in this column 

