class ntp::service {
	service { "ntp" :
	ensure => running,
	hasstatus => true,
	hasrestart => true,
	require => Class["ntp::config"],
	}
}
