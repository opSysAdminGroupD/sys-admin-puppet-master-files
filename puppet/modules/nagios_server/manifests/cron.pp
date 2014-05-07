class nagios_server::cron{
	cron { chmod:
  	command => "chmod 644 /etc/nagios3/conf.d/ppt_*",
  	user    => root,
  	minute  => 5
	}
}
