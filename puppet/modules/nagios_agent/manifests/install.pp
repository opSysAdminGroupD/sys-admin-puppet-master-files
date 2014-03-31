class nagios_agent::install {
	package {"nagios-nrpe-server" :
		ensure => present,
	}
}
