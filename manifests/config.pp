class phpmyadmin::config inherits phpmyadmin {
	mysql::db { "phpmyadmin-db":
		name	 => "${pma_db}",
		host	 => "%",
		ensure   => "present",
		charset  => "utf8",
		collate  => "utf8_bin",
		user 	 => "${pma_controluser}",
		password => "${pma_controlpass}",
		grant	 => "ALL",
		sql		 => "${pma_path}/sql/create_tables.sql",
	} ->

	file { "phpmyadmin-etc":
		path 	=> "/etc/phpmyadmin",
		ensure  => directory,
	} ->

	file { "phpmyadmin-config":
		path 	=> "/etc/phpmyadmin/config.inc.php",
		ensure  => present,
		owner   => "root",
		group   => "root",
		mode	=> "0644",
		content => template("phpmyadmin/config.inc.php.erb"),
	} ->

	file { "phpmyadmin-config-link":
		ensure  => link,
		path 	=> "${pma_path}/config.inc.php",
		target  => "/etc/phpmyadmin/config.inc.php",
	} ->

	file { "phpmyadmin-apache-alias":
		path 	=> "/etc/phpmyadmin/apache.conf",
		ensure  => present,
		mode    => "0644",
		content => template("phpmyadmin/apache.conf.erb"),
		require => Class["apache"],
	} ->

	file { "phpmyadmin-apache-alias-link":
		ensure  => link,
		path 	=> "/etc/apache2/conf.d/phpmyadmin.conf",
		target  => "/etc/phpmyadmin/apache.conf",
		notify  => Class["apache::service"],
	}
}