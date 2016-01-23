class phpmyadmin::package inherits phpmyadmin {
	# exec { 'phpmyadmin-install':
	# 	cwd => '/var/www',
	# 	environment => ["COMPOSER_HOME=/usr/local/bin"],
	# 	command => 'composer create-project phpmyadmin/phpmyadmin --working-dir=/var/www --repository-url=https://www.phpmyadmin.net/packages.json',
	# 	path => ['/usr/local/bin', '/usr/bin', '/bin', '/usr/local/sbin', '/usr/sbin', '/sbin'],
	# 	user => root,
	# 	require => Exec['composer-install'],
	# 	unless => 'test -d /var/www/phpmyadmin',
	# 	timeout => 900,
	# }

	# vcsrepo { '/var/www/phpmyadmin':
	# 	ensure => latest,
	# 	provider => git,
	# 	revision => 'master',
	# 	source => 'https://github.com/phpmyadmin/phpmyadmin.git',
	# }

	exec { 'phpmyadmin-download':
		cwd => '/tmp',
		path => ['/usr/local/bin', '/usr/bin', '/bin', '/usr/local/sbin', '/usr/sbin', '/sbin'],
		# command => 'curl -L -o phpmyadmin-stable.zip https://github.com/phpmyadmin/phpmyadmin/archive/STABLE.zip',
		command => 'curl -LO https://github.com/phpmyadmin/phpmyadmin/archive/STABLE.zip ; unzip STABLE.zip; rm STABLE.zip; mv phpmyadmin-STABLE /var/www/phpmyadmin',
		require => Package['curl', 'unzip'],
	}
}