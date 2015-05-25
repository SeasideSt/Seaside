accessing
clickScript
	^ 'return confirm("Really delete ', self handler basicUrl pathStringUnencoded, '?")'