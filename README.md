# puppet-phpmyadmin

#### Table of Contents

1. [Overview](#overview)
2. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)

## Overview

Sets phpmyadmin on Debian based OS :

* Clone master branch of phpmyadmin's Github repository

## Usage

```
include phpmyadmin
```

## Reference

* manifests/init.pp : Initiates the module, includes parameters and starts the package and config scripts.
* manifests/package.pp : Installs required packages.

## Limitations

Tested on Debian 8 using Puppet 3.7.  
Should work on any Debian and Ubuntu based OS.  
Puppet >= 3.3 required.