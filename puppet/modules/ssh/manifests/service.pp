class ssh::service {
	service{"ssh" :
	ensure => running,
	hasstatus => true,
	hasrestart => true,
	require => Class[ssh::config],
	}
}
