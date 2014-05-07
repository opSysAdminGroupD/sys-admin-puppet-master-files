node 'default' 
{
	include hosts_file
}
node 'db.op.ac.nz','db.sqrawler.com' inherits default
{
	include mysql
	include puppet_config_file
	include sudo
	include vim
	include ssh 
	include ntp
	include nagios_agent
}
node 'mgmt.op.ac.nz', 'mgmt.sqrawler.com' inherits default
{
	include sudo
	include vim
	include ssh 
	include ntp
	include hostname
	include nagios_server
}
node 'app.op.ac.nz', 'app.sqrawler.com' inherits default
{
	include puppet_config_file
	include sudo
	include vim
	include ssh 
	include ntp
	include nagios_agent
}
node 'backup.op.ac.nz','backup.sqrawler.com' inherits default
{
	include puppet_config_file
	include sudo
	include vim
	include ssh 
	include ntp
	include nagios_agent
}
node 'ad.sqrawler.com', 'ad.op.ac.nz' inherits default
{
	include nagios_win
}

