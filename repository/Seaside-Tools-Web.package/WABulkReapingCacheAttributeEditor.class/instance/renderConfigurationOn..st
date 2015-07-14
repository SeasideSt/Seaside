rendering
renderConfigurationOn: html
	html form: [
		html table
			cellspacing: 0;
			cellpadding: 0;
			with: [
				self renderMaximumAbsoluteAgeOn: html.
				self renderMaximumRelativeAgeOn: html ].
			
		self renderCacheReplaceOn: html ]