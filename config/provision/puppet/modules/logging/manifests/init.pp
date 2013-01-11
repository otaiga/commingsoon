class logging {

  file {
    "/etc/logrotate.d/${app_name}.conf":
      owner   => root,
      group   => root,
      mode    => 755,
      content => template("logging/rotate-domain-logs.conf.erb")
  }

}