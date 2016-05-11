class phpmyadmin::package inherits phpmyadmin {

	exec { "phpmyadmin-download":
		cwd => "/tmp",
		path => ["/usr/local/bin", "/usr/bin", "/bin", "/usr/local/sbin", "/usr/sbin", "/sbin"],
		command => "curl -LO https://github.com/phpmyadmin/phpmyadmin/archive/STABLE.zip",
		require => [ Package[ "curl", "unzip" ]],
	} ->

	exec { "phpmyadmin-uncompress":
		cwd 	=> "/tmp",
		path 	=> [ "/usr/local/bin", "/usr/bin", "/bin", "/usr/local/sbin", "/usr/sbin", "/sbin" ],
		command => "unzip -qo STABLE.zip",
	} ->

	file { "/var/www/STABLE.zip":
		ensure => absent,
	} ->

	exec { "phpmyadmin-remove":
		path 	=> [ "/usr/local/bin", "/usr/bin", "/bin", "/usr/local/sbin", "/usr/sbin", "/sbin" ],
		command => "rm -Rf ${pma_path}",
	} ->

	exec { "phpmyadmin-move":
		path 	=> [ "/usr/local/bin", "/usr/bin", "/bin", "/usr/local/sbin", "/usr/sbin", "/sbin" ],
		command => "mv /tmp/phpmyadmin-STABLE ${pma_path}",
	} ->

	file { "phpmyadmin-owner":
		path 	=> "${pma_path}",
		ensure 	=> directory,
		force 	=> true,
		recurse => true,
		owner 	=> "${pma_owner}",
		group 	=> "${pma_group}",
	}
}