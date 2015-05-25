rendering
potentialParents
	| configurations |
	configurations := WASystemConfiguration allSubclasses collect: [ :each | each instance ].
	configurations addAll: WASharedConfiguration configurations.
	^ configurations select: [ :each | 
		(self configuration canAddParent: each)
			and: [ (self configuration inheritsFrom: each) not ] ]