# puppet-phpmyadmin

#### Table of Contents

1. [Overview](#overview)
2. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)

## Overview

Setup phpMyAdmin on Apache web server :

* Download and extract last phpMyAdmin stable release from official web site
* Create phpMyAdmin database from sql script contained in downloaded release
* Setup config.inc.php from given parameters

## Required dependencies

* Puppet module : puppetlabs/stdlib >= 4.12.0 < 5.0.0
* Puppet module : puppetlabs/mysql >= 3.7.0 < 4.0.0
* Puppet module : puppetlabs/apache >= 1.9.0

## Usage

```
class { 'phpmyadmin':
	$pma_alias			=> '/phpmyadmin',
	pma_path			=> '/var/www/phpmyadmin',
	pma_owner			=> 'www-data',
	pma_group			=> 'www-data',
	pma_blowfish		=> '9HvXD9Ajv>5V7B633*n4',
	pma_verbose 		=> 'localhost',
	mysql_host			=> 'localhost',
	mysql_connect		=> 'socket',
	mysql_port			=> '',
	mysql_socket		=> '/var/run/mysqld/mysqld.sock',
	pma_ssl				=> true,
	pma_auth 			=> 'config',
	pma_mysql_user		=> 'root',
	pma_mysql_password	=> 'root',
	pma_db				=> 'phpmyadmin',
	pma_controluser 	=> 'pma',
	pma_controlpass 	=> 'pmapass',
	$pma_uploaddir		=> '',
	$pma_savedir		=> '',
}
```

## Reference

* manifests/init.pp : Initiate the module, includes parameters and starts scripts.
* manifests/package.pp : Download and extract last stable release.
* manifests/config.pp : Create phpMyAdmin database and setup config.inc.php.

## Limitations

Tested on Debian 8 using Puppet 3.7 / 3.8.   
Puppet >= 3.7 required.