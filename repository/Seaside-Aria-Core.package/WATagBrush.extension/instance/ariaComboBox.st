*Seaside-Aria-Core
ariaComboBox
	"Role.  https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role
	
	The combobox role identifies an element as either an input or a button that controls another element, such as a listbox or grid, that can dynamically pop up to help the user set the value. A combobox can be either editable (allowing text input) or select-only (only allowing selection from the popup).
	
	required to set 
		#ariaExpanded:
		#ariaLabel: or #ariaLabelledBy: or <label> element for the <input> element
		
	can set 
		#ariaHasPopUp: 

	"
	self role:'combobox'