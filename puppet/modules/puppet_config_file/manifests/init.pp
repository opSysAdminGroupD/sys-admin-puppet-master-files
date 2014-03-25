class puppet_config_file {
	if $osfamily == 'Debian'
	{
	include deb_config
	}
}

class puppet_config_file::deb_config {
	file { "/etc/puppet/puppet.conf" :
	ensure =>present,
	owner => 'root',
	group => 'root',
	mode => 0444,
	content =>template('puppet_config_file/deb_config.erb'),
	}
}
