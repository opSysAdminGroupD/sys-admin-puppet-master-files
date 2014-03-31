class nagios_agent::service {
	service { "nagios-nrpe-server" :
	ensure => running,
	hasstatus => true,
	hasrestart => true,
	require => Class["nagios_agent::config"]
	}
}
