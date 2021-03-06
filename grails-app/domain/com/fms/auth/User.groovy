package com.fms.auth


class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
    String fullName	
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	Date lastLogin= null
	Date dateCreated
	Date lastUpdated
	
	
	boolean isDeleted = false
	
	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		fullName
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		//sEmail email : true, unique : true
		dateCreated nullable : true
		lastUpdated nullable : true
		lastLogin nullable : true
		fullName nullable : true
	}

	static mapping = {
		password column: '`password`'
	}
}
