class nagios_agent::config {
	file { "/etc/nagios/nrpe.cfg":
	ensure => present,
	source => "puppet:///modules/nagios_agent/nrpe.cfg",
	mode => 0444,
	owner => "root",
	group => "root",
	require => Class["nagios_agent::install"],
	notify => Class["nagios_agent::service"],
	}
}
