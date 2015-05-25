private
buildTable
	^ WATableReport new
		rowPeriod: 1;
		rowColors: #( '#eee' 'white' );
		rows: self notifications;
		columns: (Array
			with: (WAReportColumn selector: #messageText title: 'Deprecated')
			with: (WAReportColumn selector: #details title: 'Details'));
		yourself