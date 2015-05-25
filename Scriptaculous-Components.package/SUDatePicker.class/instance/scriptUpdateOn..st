scripting
scriptUpdateOn: script
	script prototype element
		id: uid;
		update: [ :r | self renderBodyOn: r ]