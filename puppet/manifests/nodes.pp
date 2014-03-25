node 'default' 
{
	include sudo
	include hosts_file
	include vim
	include puppet_config_file
}
node 'db.op.ac.nz','db.sqrawler.com' inherits default
{
	include mysql
}
node 'mgmt.op.ac.nz', 'mgmt.sqrawler.com' inherits default
{
}
node 'app.op.ac.nz', 'app.sqrawler.com' inherits default
{
}
node 'backup.op.ac.nz','backup.sqrawler.com' inherits default
{
}

