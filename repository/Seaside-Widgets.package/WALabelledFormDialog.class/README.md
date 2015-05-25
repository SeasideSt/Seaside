WALabelledFormDialog is an abstract class for generating html forms. Given a data model WALabelledFormDialog displays a label and input field for each instance variable of interest. User supplied data is placed in the data model.

Subclasses need to implment the methods labelForSelector:, model, and rows. The "model" method just returns the object whose fields we wish to populate with date. The "rows" method returns a collections of symbols. One symbol for each row of data in the dialog. The symbol is used generate the accessor methods for the data in the model. The method "labelForSelector:" returns the labels for each row and each submit button in the form.

A standard text input field is used for each row of data. To use other html widgets for input for = a datum implement the method renderXXXOn: where XXX is the symbol for the row. See "renderNameOn:" in example below.

The default form has one button "Ok". Override the "buttons" method to change the text or number of submit buttons on the form. Override the "defaultButton" method to indicate which button is the default. For each button in the form the subclass needs a method with the same name as the button, which is called when the user clicks that button. See example below.

LabelledFormDialogExample subclass of WALabelledFormDialog instance methods
	initialize
		super initialize.
		contact := Contact new. "contact is an inst var"
		self addMessage: 'Please enter the followning information'.

	model
		^ contact

	ok
		self answer: contact

	cancel
		self answer

	rows
		^ #(name phoneNumber)

	buttons
		#(ok cancel)

	labelForSelector: aSymbol
		aSymbol == #name ifTrue: [^'Your Name'].
		aSymbol == #phoneNumber ifTrue: [^'Phone Number'].
		aSymbol == #ok ifTrue: [^'Ok'].
		aSymbol == #cancel ifTrue: [^'Cancel'].
		^ super labelForSelector: aSymbol

	renderNameOn: html 
		"Show how to specily special input instead of using simple text field."
		(html select)
				list: #('Roger' 'Pete');
				selected: 'Roger';
				callback: [:v | contact name: v]

Contact Class used above has instance variables name, phoneNumber with standard getter and setter methods
