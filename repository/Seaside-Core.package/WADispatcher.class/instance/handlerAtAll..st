accessing
handlerAtAll: aCollectionOfStrings
	^ aCollectionOfStrings inject: self into: [ :handler :element |
		handler handlerAt: element ]