description
describeOn: config
	(config list: #trackingStrategy)
		comment: 'How handlers should be tracked.';
		options: [ Array with: WAQueryFieldHandlerTrackingStrategy new ];
		default: WAQueryFieldHandlerTrackingStrategy new