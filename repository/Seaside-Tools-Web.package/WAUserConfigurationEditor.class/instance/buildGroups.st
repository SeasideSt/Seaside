accessing
buildGroups
	groups := OrderedCollection new.
	groups add: (WAAncestryAttributeEditor new configuration: configuration; group: #inheritedConfiguration; parent: self; yourself).
	groups addAll:
		(self groupedAttributes collect: [ :association | 
			WAConfigAttributeEditor new
				configuration: configuration;
				attributes: association value;
				group: association key;
				parent: self;
				hasAdvancedAttributes: (self includesAdvanced: association value);
				yourself ])