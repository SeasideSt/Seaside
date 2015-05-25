comparing
<= otherStatusItem
	^ (self priority < otherStatusItem priority) or: [
		(self priority = otherStatusItem priority) and: [
			self label <= otherStatusItem label ] ]