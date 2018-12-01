Class {
	#name : #WAHashCacheAttributeEditor,
	#superclass : #WAExpiringCacheAttributeEditor,
	#category : 'Seaside-Tools-Web'
}

{ #category : #accessing }
WAHashCacheAttributeEditor >> configuration: aCache [
	"unwrap the cache form the WAMutualExclusionCache"
	super configuration: aCache underlyingCache
]

{ #category : #private }
WAHashCacheAttributeEditor >> createCache [
	^ WAMutualExclusionCache on: (WAHashCache
		initialSize: 13
		maximumSize: maximumSize
		maximumAbsoluteAge: maximumAbsoluteAge
		maximumRelativeAge: maximumRelativeAge
		overflowAction: overflowAction)
]

{ #category : #rendering }
WAHashCacheAttributeEditor >> renderConfigurationOn: html [
	html form: [
		html table
			cellspacing: 0;
			cellpadding: 0;
			with: [
				self renderMaximumAbsoluteAgeOn: html.
				self renderMaximumRelativeAgeOn: html.
				self renderMaximumSizeOn: html.
				self renderOverflowActionOn: html ].
			
		self renderCacheReplaceOn: html ]
]
