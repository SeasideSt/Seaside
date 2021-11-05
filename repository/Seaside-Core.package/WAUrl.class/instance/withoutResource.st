copying
withoutResource

	^ self copy
		  path: OrderedCollection new;
		  queryFields: nil;
		  fragment: nil;
		  yourself