*Seaside-Aria-Core
ariaTree
	"Role.  https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role
	Not recommended to use.  See MDN webpage for why. 
	A tree is a hierarchical list with parent and child nodes that can expand and collapse. A treeitem is a node in a tree. The root of the tree is tree, but all tree nodes are treeitem elements, even if they themselves have nested treeitem nodes.
	
	required to set 
		#ariaLabel: or #ariaLabelledBy: 
		
	can set 
		#ariaExpanded: 
		#ariaMultiSelectable:
		#ariaOrientation:
	"
	self role:'tree'