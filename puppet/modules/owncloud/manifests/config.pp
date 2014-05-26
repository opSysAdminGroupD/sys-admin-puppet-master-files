class owncloud::config{ 
	file {"/var/www/owncloud/config.php":
	ensure => present,
	source => "puppet:///modules/owncloud/config.php",
	mode => 0640,
	owner => "www-data",
	group => "www-data",
	}
}
