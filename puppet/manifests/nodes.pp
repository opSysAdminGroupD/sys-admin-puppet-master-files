node 'default' 
{
	inlcude sudo
}
node 'db.op.ac.nz','db.sqrawler.com'
{
	include sudo
	include hosts_file
	include vim
	include mysql
}
node 'mgmt.op.ac.nz', 'mgmt.sqrawler.com'
{
	include sudo
	include hosts_file
	include vim
}
node 'app.op.ac.nz', 'app.sqrawler.com'
{
	include sudo
	include hosts_file
	include vim
}
node 'backup.op.ac.nz','backup.sqrawler.com'
{
	include sudo
	include hosts_file
	include vim
}

