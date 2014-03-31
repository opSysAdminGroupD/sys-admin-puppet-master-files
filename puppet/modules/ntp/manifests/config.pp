class ntp::config {
	package{"ntp" :
	ensure => present,
	}
	package{"ntpdate" :
	ensure => present,
	}
}
