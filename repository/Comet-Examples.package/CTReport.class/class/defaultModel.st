private
defaultModel
	^ OrderedCollection new
		add: (CTReportItem new
			name: 'Peter Parker';
			phone: '183 045 2037';
			yourself);
		add: (CTReportItem new
			name: 'John Hood';
			phone: '602 979 3001';
			yourself);
		add: (CTReportItem new
			name: 'Clark Kent';
			phone: '497 776 2568';
			yourself);
		add: (CTReportItem new
			name: 'Bruce Evans';
			phone: '167 604 1282';
			yourself);
		yourself