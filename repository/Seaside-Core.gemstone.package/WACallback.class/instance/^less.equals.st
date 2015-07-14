comparing
<= other
	^ self priority < other priority or: [ self priority = other priority and: [ self key asNumber <= other key asNumber ] ]