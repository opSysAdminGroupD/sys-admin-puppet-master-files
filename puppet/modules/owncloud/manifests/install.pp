class owncloud::install {
	package {"php5":
	ensure => present,
	}
	package {"php5-gd":
	ensure => present,
	}
	package{"php-xml":
	ensure => present,
	}
	package{"php-xml-parser":
	ensure => present,
	}
	package{"php5-intl":
	ensure => present,
	}
	package{"php5-sqlite":
	ensure => present,
	}
	package{"php5-mysql":
	ensure => present,
	}
	package{"smbclient":
	ensure => present,
	}
	package{"curl":
	ensure => present,
	}
	package{"libcurl13":
	ensure => present,
	}
	package{"php5-curl":
	ensure => present,
	}
}
