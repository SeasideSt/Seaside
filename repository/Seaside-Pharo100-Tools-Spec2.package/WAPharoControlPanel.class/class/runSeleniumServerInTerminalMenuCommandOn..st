world menu
runSeleniumServerInTerminalMenuCommandOn: builder

	<worldMenu>
	
	(builder item: 'Run Selenium Server in Terminal')
		parent: #Seaside;
		order: 3;
		action: [ self runSeleniumServerInTerminal ]