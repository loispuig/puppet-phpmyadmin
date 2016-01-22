class phpmyadmin {

	anchor { 'phpmyadmin::begin': } ->
		class { '::phpmyadmin::package': } ->
	anchor { 'phpmyadmin::end': }
}
