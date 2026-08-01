*Seaside-Aria-Core
ariaSearchBox
	"Role.  https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role

	for Seaside should set 
		#ariaLabel: or #ariaLabelledBy: 
		
	if the <input> field does not have a name"
	self role:'searchbox'