class nagios_server {
	include nagios_server::install, nagios_server::config, nagios_server::service, nagios_server::resources,cron
}
