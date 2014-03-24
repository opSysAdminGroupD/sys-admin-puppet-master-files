class vim {
	if $osfamily == 'Debian' {
	package {'vim' :
			ensure => present
		}
	}
}
