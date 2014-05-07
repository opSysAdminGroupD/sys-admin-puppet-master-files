class nagios_server::config {
	file { "/etc/nagios3/htpasswd.users":
	ensure => present,
	source => "puppet:///modules/nagios_server/htpasswd.users",
	mode => 0444,
	owner => "root",
	group => "root",
	require => Class["nagios_server::install"],
	notify => Class["nagios_server::service"],
	}
	file { "/etc/nagios3/nagios.cfg":
	ensure => present,
	source => "puppet:///modules/nagios_server/nagios.cfg",
	mode => 0444,
	owner => "root",
	group => "root",
	require => Class["nagios_server::install"],
	notify => Class["nagios_server::service"],
	}
	file { "/etc/nagios3/resource.cfg":
	ensure => present,
	source => "puppet:///modules/nagios_server/resource.cfg",
	mode => 0444,
	owner => 'root',
	group => 'root',
	require => Class["nagios_server::install"],
	notify => Class["nagios_server::service"],
	}
	file { "/etc/exim4/update-exim4.conf.conf":
	ensure => present,
	source => "puppet:///modules/nagios_server/update-exim4.conf.conf",
	mode => 0444,
	owner => 'root',
	group => 'root',
	}
}
