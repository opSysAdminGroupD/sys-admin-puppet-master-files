class nagios_server::resources 
{
  nagios_host { 'db.sqrawler.com':
                 target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
                 alias => 'db',		
                 address => '10.25.1.44',
                 check_period => '24x7',
                 max_check_attempts => 3,
                 check_command => 'check-host-alive',
                 notification_interval => 30,
                 notification_period => '24x7',
                 notification_options => 'd,u,r',
                 contact_groups => 'sysadmins',
            }
 nagios_host{ 'app.sqrawler.com':
		target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
		alias => 'app',
		address => '10.25.1.42',
		check_period => '24x7',
		max_check_attempts => 3,
		check_command => 'check-host-alive',
		notification_interval => 30,
		notification_period => '24x7',
		notification_options => 'd,u,r',
		contact_groups => 'sysadmins',
	}

 nagios_host { 'backup.sqrawler.com':
		target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
		alias => 'backup',
		address => '10.25.1.41',
		check_period => '24x7',
		max_check_attempts => 3,
		check_command => 'check-host-alive',
		notification_interval =>30,
		notification_period => '24x7',
		notification_options => 'd,u,r',
		contact_groups => 'sysadmins',
	}

 nagios_host{ 'ad.sqrawler.com':
		target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
		alias => 'Active Directory',
		address => '10.25.1.40',
		check_period => '24x7',
		max_check_attempts => 3,
		check_command => 'check-host-alive',
		notification_interval => 30,
		notification_period => '24x7',
		notification_options => 'd,u,r',
		contact_groups => 'testing',
	}

nagios_contactgroup { 'testing':
		target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
		alias => 'Testing Configs',
		members => 'Adam Dackers',
}

 nagios_contactgroup { 'sysadmins':
               target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
               alias => 'Systems Administrators',
               members => 'tclark, Adam Dackers, Ben van der Loo',
  }

nagios_contact { 'tclark':
              target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
              alias => 'Tom Clark',
              service_notification_period => '24x7',
              host_notification_period => '24x7',
              service_notification_options => 'w,u,c,r',
              host_notification_options => 'd,r',
              service_notification_commands => 'notify-service-by-email',
              host_notification_commands => 'notify-host-by-email',
              email => 'root@localhost',
  }

nagios_contact { 'Adam Dackers':
              target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
              alias => 'adam',
              service_notification_period => '24x7',
              host_notification_period => '24x7',
              service_notification_options => 'w,u,c,r',
              host_notification_options => 'd,r',
              service_notification_commands => 'notify-service-by-email , notify-host-by-whatsapp',
              host_notification_commands => 'notify-host-by-email , notify-host-by-whatsapp',
              email => 'dackear1@student.op.ac.nz',
	      pager => 64272067073,
  }

nagios_contact { 'Ben van der Loo':
              target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
              alias => 'ben',
              service_notification_period => '24x7',
              host_notification_period => '24x7',
              service_notification_options => 'w,u,c,r',
              host_notification_options => 'd,r',
              service_notification_commands => 'notify-service-by-email , notify-service-by-whatsapp',
              host_notification_commands => 'notify-host-by-email , notify-host-by-whatsapp',
              email => 'vandbr1@student.op.ac.nz',
	      pager => 64211032106
  }

nagios_service {'MySQL':
              service_description => 'MySQL DB',
              hostgroup_name => 'db-servers',
              target => '/etc/nagios3/conf.d/ppt_mysql_service.cfg',
              check_command => 'check_mysql_cmdlinecred!$USER3$!$USER3$!$HOSTADDRESS$',
              max_check_attempts => 3,
              retry_check_interval => 1,
              normal_check_interval => 5,
              check_period => '24x7',
              notification_interval => 30,
              notification_period => '24x7',
              notification_options => 'w,u,c',
              contact_groups => 'sysadmins',
  }

nagios_hostgroup{'db-servers':
              target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
              alias => 'Database Servers',
              members => 'db.sqrawler.com',
  }
nagios_hostgroup{'remote-disks':
	     target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
	     alias => 'Remote Disks',
	     members => 'db.sqrawler.com , app.sqrawler.com , backup.sqrawler.com' ,

  }
nagios_hostgroup{'remote-users':
		target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
		alias => 'Remote Users',
		members =>'db.sqrawler.com , app.sqrawler.com , backup.sqrawler.com',
}

nagios_hostgroup{'remote-load':
		target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
		alias => 'Remote Load',
		members => 'db.sqrawler.com , app.sqrawler.com , backup.sqrawler.com',
}

nagios_hostgroup{'remote-processes':
		target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
		alias => 'Remote Processes',
		members => 'db.sqrawler.com , app.sqrawler.com , backup.sqrawler.com',
}
nagios_hostgroup{ 'remote-ssh':
		target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
		alias => 'Remote SSH',
		members => 'db.sqrawler.com , app.sqrawler.com , backup.sqrawler.com',
}

nagios_service {'check-Disks':
	       service_description => 'Check HDD Space',
		hostgroup_name => 'db-servers , app-servers , backup-servers',
	        target => '/etc/nagios3/conf.d/ppt_check_disks.cfg',
		check_command => 'check_nrpe_1arg!check_hd',
		max_check_attempts => 3,
		retry_check_interval => 1,
		normal_check_interval => 5,
		check_period => '24x7',
		notification_interval => 30,
		notification_period => '24x7',
		notification_options => 'w,u,c',
		contact_groups => 'testing',
  }
nagios_service {'check-users':
		service_description => 'Check Users',
		hostgroup_name => 'db-servers, app-servers , backup-servers',
		target => '/etc/nagios3/conf.d/ppt_check_users.cfg',
		check_command => 'check_nrpe_1arg!check_users',
		max_check_attempts => 3,
		retry_check_interval =>1,
		normal_check_interval => 5,
		check_period => '24x7',
		notification_interval =>30,
		notification_period => '24x7',
		notification_options => 'w,u,c',
		contact_groups => 'sysadmins',
}

nagios_service {'check-load':
		service_description => 'Check load',
		hostgroup_name => 'db-servers, app-servers, backup-servers',
		target => '/etc/nagios3/conf.d/ppt_check_load.cfg',
		check_command => 'check_nrpe_1arg!check_load',
		max_check_attempts => 3,
		retry_check_interval => 1,
		normal_check_interval =>5,
		check_period => '24x7',
		notification_interval => 30,
		notification_period => '24x7',
		notification_options => 'w,u,c',
		contact_groups => 'sysadmins',
	}

nagios_service {'check_processes':
		service_description => 'Check Processes',
		hostgroup_name => 'db-servers, app-servers, backup-servers',
		target => '/etc/nagios3/conf.d/ppt_check_load.cfg',
		check_command => 'check_nrpe_1arg!check_total_procs',
		max_check_attempts =>3,
		retry_check_interval => 1,
		normal_check_interval => 5,
		check_period => '24x7',
		notification_interval =>30,
		notification_period => '24x7',
		notification_options => 'w,u,c',
		contact_groups => 'sysadmins',
	}
nagios_service {'check_uptime_windows':
		service_description => 'Check Uptime',
		hostgroup_name => 'ad-servers',
		target => '/etc/nagios3/conf.d/ppt_win_uptime.cfg',
		check_command => 'check_nt!UPTIME',
		max_check_attempts =>3,
		retry_check_interval =>1,
		normal_check_interval =>5,
		check_period => '24x7',
		notification_interval => 30,
		notification_period => '24x7',
		notification_options => 'w,u,c',
		contact_groups => 'sysadmins',
	}

nagios_service { 'check_client-version':
		service_description => 'Check Client Version',
		hostgroup_name => 'ad-servers',
		target => '/etc/nagios3/conf.d/ppt_win_client_version.cfg',
		check_command => 'check_nt!CLIENTVERSION',
		max_check_attempts =>3,
		retry_check_interval =>1,
		normal_check_interval =>5,
		check_period => '24x7',
		notification_interval => 30,
		notification_period => '24x7',
		notification_options => 'w,u,c',
		contact_groups => 'sysadmins',
	}

nagios_service { 'check_CPU':
		service_description => 'Check CPU Load',
		hostgroup_name => 'ad-servers',
		target => '/etc/nagios3/conf.d/ppt_win_cpu.cfg',
		check_command => 'check_nt!CPULOAD!-l 5,80,90',
		max_check_attempts =>3,
		retry_check_interval =>1,
		normal_check_interval =>5,
		check_period => '24x7',
		notification_interval => 30,
		notification_period => '24x7',
		notification_options => 'w,u,c',
		contact_groups => 'sysadmins',
	}

nagios_service { 'check_Mem':
		service_description => 'Check Mem Use',
		hostgroup_name => 'ad-servers',
		target => '/etc/nagios3/conf.d/ppt_win_mem.cfg',
		check_command => 'check_nt!MEMUSE!-w 80 -c 90',
		max_check_attempts =>3,
		retry_check_interval =>1,
		normal_check_interval =>5,
		check_period => '24x7',
		notification_interval => 30,
		notification_period => '24x7',
		notification_options => 'w,u,c',
		contact_groups => 'sysadmins',
	}
nagios_service { 'check_disk_space':
		service_description => 'Check Disk Use',
		hostgroup_name => 'ad-servers',
		target => '/etc/nagios3/conf.d/ppt_win_disk.cfg',
		check_command => 'check_nt!USEDDISKSPACE!-l c -w 80 -c 90',
		max_check_attempts =>3,
		retry_check_interval =>1,
		normal_check_interval =>5,
		check_period => '24x7',
		notification_interval => 30,
		notification_period => '24x7',
		notification_options => 'w,u,c',
		contact_groups => 'sysadmins',
	}

nagios_service { 'check_ssh':
		service_description => 'Check SSH',
		hostgroup_name => 'backup-servers, app-servers, db-servers',
		target => '/etc/nagios3/conf.d/ppt_check_ssh.cfg',
		check_command => 'check_ssh',
		max_check_attempts => 3,
		retry_check_interval => 1,
		normal_check_interval => 5,
		check_period => '24x7',
		notification_interval =>30,
		notification_period => '24x7',
		notification_options => 'w,u,c',
		contact_groups => 'sysadmins',
	}
nagios_hostgroup{'app-servers':
	target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
	alias => 'App Servers',
	members => 'app.sqrawler.com',
  }
nagios_hostgroup{'backup-servers':
	target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
	alias => 'Backup Servers',
	members => 'backup.sqrawler.com',
}
nagios_hostgroup{'ad-servers':
	target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
	alias => 'AD Servers',
	members => 'ad.sqrawler.com',
}
}
