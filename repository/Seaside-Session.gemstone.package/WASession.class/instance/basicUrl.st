private
basicUrl
	| url |
	url := self parent url.
	self parent trackingStrategy addKey: key toUrl: url.
	^ url