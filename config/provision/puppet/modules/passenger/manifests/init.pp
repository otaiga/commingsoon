class passenger {

  exec {
    "/usr/bin/gem install passenger -v=${passenger_version}":
      user    => root,
      group   => root,
      alias   => "install_passenger",
      require => Package["apache2"],
      unless  => "ls /var/lib/gems/1.9.1/gems/passenger-${passenger_version}/"
  }

  exec {
    "/var/lib/gems/1.9.1/gems/passenger-${passenger_version}/bin/passenger-install-apache2-module --auto":
      user    => root,
      group   => root,
      path    => "/bin:/usr/bin:/usr/local/apache2/bin/",
      require => Exec["/usr/bin/gem install passenger -v=${passenger_version}"],
      alias   => "passenger_apache_module",
      unless  => "ls /var/lib/gems/1.9.1/gems/\
      passenger-${passenger_version}/ext/apache2/mod_passenger.so"
  }

  file {
    "/etc/apache2/conf.d/passenger.conf":
      mode    => 644,
      owner   => root,
      group   => root,
      alias   => "passenger_conf",
      notify  => Service["apache2"],
      require => Package["apache2"],
      content => template("passenger/passenger.erb")
  }

}