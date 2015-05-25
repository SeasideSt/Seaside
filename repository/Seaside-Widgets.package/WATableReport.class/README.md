WATableReport presents tabular data. A WATableReport contains a collections of objects, one per row, and a collection of WAReportColumns. The WAReportColumn objects are configured to produce the text for the table cell based on the each row object. Each column has a header and an optional column sum. The table can be sorted on a column by clicking its header, unless the column handles rendering on the canvas itself. A table can be given a set of html colors (rowColors), used to colors the rows to aid in viewing. 

For more information see:
	Example - WATableReportFunctionalTest (initialization code below)
	WATableReport Tutorial - http://www.cdshaffer.com/david/Seaside/WATableReport/index.html

Instance Variables:
	columns	<Collection of WAReportColumn>	Each WAReportColumn produces the text for each table cell in a column  
	isReversed	<Boolean>	true if the current sort column is to be sorted in reverse order
	rowColors	<Collection of String/Symbol>	Each element is a string for an html color, which is used as a background color for table rows
	rowPeriod	<Integer>	Each color in rowColors is used for rowPeriod consectutive rows before using the next row color.
	rows	<Collection of Object>	Each element of the collection provides the data for a row in the table.
	sortColumn	<WAValueHolder on WAReportColumn>	Column used to sort the the table rows

Example:
	WATableReport new
		rows: WAComponent allSubclasses asArray;
		columns: (OrderedCollection new
			add: (WAReportColumn
				selector: #fullName title: 'Name'
				onClick: [ :each | self inform: each description ]);
			add: ((WAReportColumn
				selector: #canBeRoot title: 'Can Be Root')
				sortBlock: [ :a :b | a ]);
			add: (WAReportColumn
				renderBlock: [ :each :html | html emphasis: each description ]
				title: 'Description');
			yourself);
		rowColors: #(lightblue lightyellow);
		rowPeriod: 1;
		yourself