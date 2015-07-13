private
updateMappingOf: aKey from: oldValue to: newValue
	self removeFromValueTable: oldValue.
	self mapValue: newValue to: aKey expectMapping: false