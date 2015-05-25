initialization
initialize
	super initialize.
	self rewriteRule
		replaceMethod: 'handleRequest: `aRequest | `@temps | `@.statements'
		withValueFrom: [ :node |
			RBParseTreeRewriter new
				replace: node arguments first name with: 'aRequestContext';
				executeTree: node.
			RBParseTreeRewriter new
				replace: 'aRequestContext' with: 'aRequestContext request';
				executeTree: node body.
			node
				selector: #handleFiltered:;
				arguments: (Array with: (RBVariableNode named: 'aRequestContext'));
				yourself ]