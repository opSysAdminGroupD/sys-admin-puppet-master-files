class bacula_director::config {
	file {"/etc/bacula/bacula-dir.conf":
	ensure => present,
	source => "puppet:///modules/bacula_director/bacula-dir.conf",
	mode => 0640,
	owner => "root",
	group => "bacula",
	require => Class["bacula_director::install"],
	notify => Class["bacula_director::service"],
	}
}
