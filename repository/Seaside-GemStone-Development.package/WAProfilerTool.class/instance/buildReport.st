private
buildReport
	^ WATableReport new
		rows: self items;
		columns: (OrderedCollection new
				add: (WAReportColumn new
						title: 'Start';
						selector: #start;
						cssClass: 'left';
						yourself);
				add: (WAReportColumn new
						title: 'Duration';
						selector: #duration;
						cssClass: 'left';
						yourself);
				add: (WAReportColumn new
						title: 'Request';
						valueBlock: [ :value | value request method , ' ' , value request url greaseString ];
						clickBlock: [ :value | self show: (WAInspector current on: value request) ];
						yourself);
				add: (WAReportColumn new
						sortBlock: nil;
						title: 'Commands';
						valueBlock: [ :value :html | 
							self 
								renderCommands: value
								on: html ];
						yourself);
				yourself);
		yourself