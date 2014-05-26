node 'default' 
{
	include hosts_file
}
node 'linux'
{
	include hosts_file
	include sudo 
	include vim
	include ssh
	include ntp
	include nagios_agent
	include bacula_client
}

node 'db.op.ac.nz','db.sqrawler.com' inherits linux
{
	include mysql
        include puppet_config_file

}
node 'mgmt.op.ac.nz', 'mgmt.sqrawler.com' inherits linux
{
	include nagios_server
}
node 'app.op.ac.nz', 'app.sqrawler.com' inherits linux
{
	include apache2
	include puppet_config_file
}
node 'backup.op.ac.nz','backup.sqrawler.com' inherits linux
{
	include bacula_director
	include puppet_config_file
}
node 'ad.sqrawler.com', 'ad.op.ac.nz' inherits linux
{
	include nagios_win
}

