class nagios_server::service {
	service { "nagios3" :
	ensure => running,
	hasstatus => true,
	hasrestart => true,
	require => Class["nagios_server::config"]
	}
}
