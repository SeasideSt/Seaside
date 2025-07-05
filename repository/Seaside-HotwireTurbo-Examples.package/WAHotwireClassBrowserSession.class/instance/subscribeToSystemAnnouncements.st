private
subscribeToSystemAnnouncements

	SystemAnnouncer uniqueInstance weak
		when: ClassAnnouncement send: #handleClassChange: to: self;
		when: MethodAnnouncement send: #handleMethodChange: to: self