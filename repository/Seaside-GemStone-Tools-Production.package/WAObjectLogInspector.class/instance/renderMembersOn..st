rendering
renderMembersOn: html
	| members radioGroup |
	selected := nil.
	members := self fieldsFor: self object.
	members isEmpty ifTrue: [ ^ self ].
	radioGroup := html radioGroup.
	radioGroup
		callback: [ :value | selected := value ];
		selected: selected.
	html table: [
		members do: [ :association |
			self
				renderRow: association value
				named: association key
				group: radioGroup
				on: html ] ]