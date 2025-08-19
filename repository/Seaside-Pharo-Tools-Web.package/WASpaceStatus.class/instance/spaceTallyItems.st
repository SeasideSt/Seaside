private
spaceTallyItems
	^ (SpaceTally new spaceTally: self classesWithManyInstances) items 
		sort: [ :a :b | a spaceForInstances > b spaceForInstances ]