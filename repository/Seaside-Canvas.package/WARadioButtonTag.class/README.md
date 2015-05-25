Radio buttons work like checkboxes. The difference is that radio buttons, when sharing a single control name, are exclusive. This means that only one of those radio buttons can be checked, and when it's checked, the rest are automatically unchecked.

Radio buttons must be created through a radio group. The callback is only called for the selected option.

| group |
group := html radioGroup.
group radioButton
	selected: aBoolean;
	callback: [ self someThing ]