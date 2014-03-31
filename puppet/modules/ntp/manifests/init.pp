class ntp {
	if $osfamily == 'Debian'
	{
	include ntp::config, ntp::service
	}
}
