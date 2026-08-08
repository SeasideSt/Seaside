private
buildTable
	| classColumn instanceCountColumn totalSizeColumn |
	classColumn := WAReportColumn new
				title: 'Class';
				selector: #name;
				sortBlock: [ :a :b | a < b ];
				yourself.
	instanceCountColumn := WAReportColumn new
				title: 'Instances';
				selector: #count;
				sortBlock: [ :a :b | a > b ];
				cssClass: 'right';
				hasTotal: true;
				yourself.
	totalSizeColumn := WAReportColumn new
				title: 'Total Size';
				selector: #size;
				sortBlock: [ :a :b | a > b ];
				formatBlock: [ :each | formatter print: each ];
				cssClass: 'right';
				hasTotal: true;
				yourself.
	^ WATableReport new
		rows: instances values;
		columns: (Array
			with: classColumn
			with: instanceCountColumn
			with: totalSizeColumn);
		sortColumn: totalSizeColumn;
		yourself