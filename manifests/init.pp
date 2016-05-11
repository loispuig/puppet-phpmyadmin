# == Class: phpmyadmin
#
# Setup phpMyAdmin on Apache web server
#
# === Authors
#
# Author Loïs PUIG <lois.puig@kctus.fr>
#
# === Copyright
#
# Copyright 2016 Loïs PUIG, unless otherwise noted.
#
class phpmyadmin(
	$pma_alias = $::phpmyadmin::params::pma_alias,
	$pma_path = $::phpmyadmin::params::pma_path,
	$pma_owner = $::phpmyadmin::params::pma_owner,
	$pma_group = $::phpmyadmin::params::pma_group,
	$pma_blowfish = $::phpmyadmin::params::pma_blowfish,
	$pma_verbose = $::phpmyadmin::params::pma_verbose,
	$mysql_host = $::phpmyadmin::params::mysql_host,
	$mysql_connect = $::phpmyadmin::params::mysql_connect,
	$mysql_port	= $::phpmyadmin::params::mysql_port,
	$mysql_socket = $::phpmyadmin::params::mysql_socket,
	$pma_ssl = $::phpmyadmin::params::pma_ssl,
	$pma_auth = $::phpmyadmin::params::pma_auth,
	$pma_mysql_user	= $::phpmyadmin::params::pma_mysql_user,
	$pma_mysql_password = $::phpmyadmin::params::pma_mysql_password,
	$pma_db = $::phpmyadmin::params::pma_db,
	$pma_controluser = $::phpmyadmin::params::pma_controluser,
	$pma_controlpass = $::phpmyadmin::params::pma_controlpass,
	$pma_uploaddir = $::phpmyadmin::params::pma_uploaddir,
	$pma_savedir = $::phpmyadmin::params::pma_savedir,
	$pma_lang = $::phpmyadmin::params::pma_lang,
) inherits phpmyadmin::params  {
	anchor { 'phpmyadmin::begin': } ->
		class { '::phpmyadmin::package': }
		class { '::phpmyadmin::config': }
	anchor { 'phpmyadmin::end': }
}
