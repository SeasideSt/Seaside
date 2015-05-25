patches
treePatchJs
	^ 'Object.extend(Sortable, {
	tree_sequence: function(element, options) {
		return Sortable.tree(element, options).children.map(function(each) {
			return [encodeURIComponent(each.parent.id) + ":" + encodeURIComponent(each.id)]
				.concat(each.children.map(arguments.callee));
		}).flatten().join(","); } });'