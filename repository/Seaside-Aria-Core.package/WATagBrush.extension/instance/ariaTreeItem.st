*Seaside-Aria-Core
ariaTreeItem
	"Role.  https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role
	
	A tree is a hierarchical list with parent and child nodes that can expand and collapse. A treeitem is a node in a tree. The root of the tree is tree, but all tree nodes are treeitem elements, even if they themselves have nested treeitem nodes.
	
	can set 
		#ariaExpanded: 
		#ariaSelected:
		#ariaChecked:
	"
	self role:'treeitem'