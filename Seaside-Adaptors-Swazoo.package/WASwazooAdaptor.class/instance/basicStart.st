private
basicStart
	site port: self port.
	SwazooServer singleton addSite: site.
	site start