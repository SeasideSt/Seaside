WATree implements a tree menu, which supports nesting, collapsing and expanding. Prefixes items with "+/-" to indicate items that can be expanded/collapsed.

See class methods for simple example.


Instance Variables:
	canSelectBlock	<BlockClosure [:nodeInTree | ]>	returns true if user can select the argument of the block, if true node is an anchor
	childrenBlock	<BlockClosure [:nodeInTree | ]>	returns children (or subnodes) of the given node in the tree, sent to all nodes
	expanded	<IdentitySet>	Collection of all nodes that are currently expanded
	labelBlock	<[:nodeInTree | ]> returns text to display for given node
	root	<Object>	root or top level node in tree, childrenBlock is used to determine roots subnodes
	selectBlock	<BlockClosure [:selectedNode | ]>	called when an node is selected, put a callback to your code here
	selected	<Object>	currently selected node


