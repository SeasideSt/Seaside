private
buildTable
	^ WATableReport new
		rows: instances values;
		columns: (Array
			with: (WAReportColumn new
				title: 'Class';
				selector: #name;
				sortBlock: [ :a :b | a < b ];
				yourself)
			with: (WAReportColumn new
				title: 'Instances';
				selector: #count;
				sortBlock: [ :a :b | a > b ];
				cssClass: 'right';
				hasTotal: true;
				yourself)
			with: (WAReportColumn new
				title: 'Total Size';
				selector: #size;
				sortBlock: [ :a :b | a > b ];
				formatBlock: [ :each | formatter print: each ];
				cssClass: 'right';
				hasTotal: true;
				yourself));
		yourself