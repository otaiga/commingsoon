Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}

$extlookup_datadir = "/etc/puppet/extdata"
$extlookup_precedence  = "settings"

$app_name       = extlookup("app_name"       , "my_app_name")
$base_dir       = extlookup("base_dir"       , "/var/apps/")
$app_dir        = extlookup("app_dir"        , "/var/apps/my_app_name")
$passenger_version = extlookup("passenger_version"        , "3.0.18")
$pem_pub = extlookup("pem_pub")
$app_url = extlookup("app_url")

import "nodes.pp"