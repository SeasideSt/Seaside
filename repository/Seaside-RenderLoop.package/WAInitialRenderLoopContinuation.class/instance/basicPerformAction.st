processing
basicPerformAction
	| root |
	root := self createRoot.
	self session properties at: #presenter put: root.
	self prepareRoot: root