class bacula_client::install {
	package {"bacula-client" :
		ensure => present,
	}
}
