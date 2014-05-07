class nagios_win::config {
	if $osfamily == 'windows' {
		file {"C:/Program Files/NSClient++/nsclient.ini" :
		ensure => present,
		source => "puppet:///modules/nagios_win/nsclient.ini",
		}
	}
}
