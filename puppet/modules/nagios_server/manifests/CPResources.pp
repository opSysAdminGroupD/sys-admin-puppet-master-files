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
              service_notification_commands => 'notify-service-by-email',
              host_notification_commands => 'notify-host-by-email',
              email => 'dackear1@student.op.ac.nz',
  }

nagios_contact { 'Ben van der Loo':
              target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
              alias => 'ben',
              service_notification_period => '24x7',
              host_notification_period => '24x7',
              service_notification_options => 'w,u,c,r',
              host_notification_options => 'd,r',
              service_notification_commands => 'notify-service-by-email',
              host_notification_commands => 'notify-host-by-email',
              email => 'vandbr1@student.op.ac.nz',
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
	     members => 'db.sqrawler.com',

  }

nagios_service {'check-Disks':
	       service_description => 'Check HDD Space',
		hostgroup_name => 'db-servers',
	       target => '/etc/nagios3/conf.d/ppt_check_disks.cfg',
		check_command => 'check_nrpe_1arg!check_hd',
		max_check_attempts => 3,
		retry_check_interval => 1,
		normal_check_interval => 5,
		check_period => '24x7',
		notification_interval => 30,
		notification_period => '24x7',
		notification_options => 'w,u,c',
		contact_groups => 'sysadmins',
  }
}
