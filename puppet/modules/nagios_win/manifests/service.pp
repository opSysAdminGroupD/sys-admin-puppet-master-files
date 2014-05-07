class nagios_win::service {
	service { "nscp" :
	ensure => running,
	enable => true,
	require => Class["nagios_win::config"]
	}
}
