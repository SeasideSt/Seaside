rendering
renderContentOn: html
	super renderContentOn: html.
	
	html heading level2; with: 'Actions'.
	
	html unorderedList: [
		html listItem: [
			html anchor
				callback: [ Smalltalk garbageCollectMost ];
				title: 'Reclaims recently created garbage (which is usually most of it) fairly quickly.';
				with: 'Young Space GC' ].
		html listItem: [
			html anchor
				callback: [ Smalltalk garbageCollect ];
				title: 'Reclaims all garbage.';
				with: 'Full GC' ].
		html listItem: [
			html anchor
				callback: [ Smalltalk forceTenure ];
				title: 'Tell the GC logic to force a tenure on the next increment GC.';
				with: 'Force Tenure' ].
		html listItem: [
			html anchor
				callback: [ Smalltalk setGCBiasToGrow: 1 ];
				title: 'Indicate that the GC logic should be bias to grow.';
				with: 'Set GC Bias to Grow' ].
		html listItem: [
			html anchor
				callback: [ self setBiasToGrowLimit ];
				title: 'Indicate that the bias to grow logic should do a GC after aNumber Bytes.';
				with: 'Set GC Bias to Grow GC Limit' ] ]