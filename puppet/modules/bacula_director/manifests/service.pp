class bacula_director::service{
	service {"bacula-sd":
	ensure => running,
	hasstatus =>true,
	hasrestart => true,
	require => Class["bacula_director::config"]
	}
}
