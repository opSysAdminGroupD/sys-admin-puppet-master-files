class bacula_client::service{
	service { "bacula-fd":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		require => Class["bacula_client::install"],
	}
}
