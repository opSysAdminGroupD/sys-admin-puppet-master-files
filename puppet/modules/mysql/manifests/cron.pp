class mysql::cron {
	cron { mysqldump:
	command => "mysqldump -u root -p P@ssw0rd --all-databases --add-drop-table > /home/roleaccount/db-backup.sql",
	user => root,
	hour => 1,
	}
}
