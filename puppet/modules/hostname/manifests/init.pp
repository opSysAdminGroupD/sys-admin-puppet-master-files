class hostname 
{
	if $osfamily == 'Debian' 
	{
		if $ipaddress_eth0 == '10.25.1.105' 
		{
			include deb_hostname_mgmt	
		}
	}
}

class hostname::deb_hostname_mgmt
{
		file{ "/home/adam/hostname" :
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => 0444,
		content => template('hostname/hostname_mgmt.erb')
		}
}
