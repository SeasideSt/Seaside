private
spaceTallyItems
	^ (SpaceTally new spaceTally: self classesWithManyInstances)
		sort: [ :a :b | a spaceForInstances > b spaceForInstances ]