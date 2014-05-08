class bacula_client::config { 
	file{ "/etc/bacula/bacula-fd.conf":
		ensure => present,
		content  => template('bacula_client/bacula-fd.conf'),
		mode => 640,
		owner => 'root',
		group => 'bacula',
	}
}
