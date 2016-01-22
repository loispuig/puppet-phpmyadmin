class phpmyadmin::package inherits phpmyadmin {
	vcsrepo { '/var/www/phpmyadmin':
		ensure => latest,
		provider => git,
		revision => 'STABLE',
		source => 'https://github.com/phpmyadmin/phpmyadmin.git',
	}
}