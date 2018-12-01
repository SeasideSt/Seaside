Class {
	#name : #WABulkReapingCacheAttributeEditor,
	#superclass : #WAExpiringCacheAttributeEditor,
	#category : 'Seaside-Tools-Web'
}

{ #category : #private }
WABulkReapingCacheAttributeEditor >> createCache [
	^ WABulkReapingCache
		initialSize: 13
		maximumSize: maximumSize
		maximumAbsoluteAge: maximumAbsoluteAge
		maximumRelativeAge: maximumRelativeAge
		overflowAction: overflowAction
]

{ #category : #rendering }
WABulkReapingCacheAttributeEditor >> renderConfigurationOn: html [
	html form: [
		html table
			cellspacing: 0;
			cellpadding: 0;
			with: [
				self renderMaximumAbsoluteAgeOn: html.
				self renderMaximumRelativeAgeOn: html ].
			
		self renderCacheReplaceOn: html ]
]
