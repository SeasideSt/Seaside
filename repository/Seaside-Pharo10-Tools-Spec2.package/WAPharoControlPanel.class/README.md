Description
--------------------

I am a controle panel for seaside. I will present to the user the list of adaptors registered in Seaside and let the user do some actions such as:
- Adding a new adaptor
- Removing an adaptor
- Starting an adaptor
- Removing an adaptor
...

Examples
--------------------

	self class open	
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	actionBar:		<aToolbarPresenter>	A toolbar containing actions to execute on the selected adaptor
	adaptors:			<aTablePresenter>		A table providing informations about the registered adaptors
	infos:				<aTextPresenter>		A text giving informations to the user about the selected adaptor
