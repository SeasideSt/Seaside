A WARadioGroup is a container for several related radio buttons. It must be used to create radio buttons.

Example:
| group |
group := html radioGroup.
group radioButton
	selected: aBoolean;
	callback: [ self someThing ].
