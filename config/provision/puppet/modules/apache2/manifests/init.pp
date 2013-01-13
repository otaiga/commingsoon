class apache2 {

  package {
    "apache2":
      ensure => present,
      before => File["/etc/apache2/apache2.conf"],
  }

  service {
    "apache2":
      ensure => true,
      enable => true,
  }

  file {
    "/etc/apache2/apache2.conf":
      source => "puppet:///modules/apache2/apache2.conf",
      mode   => 644,
      owner  => root,
      group  => root,
      notify  => Service["apache2"],
      require => Package["apache2"];
    "/etc/apache2/httpd.conf":
      source => "puppet:///modules/apache2/httpd.conf",
      mode   => 644,
      owner  => root,
      group  => root,
      notify  => Service["apache2"],
      require => Package["apache2"];
    "/etc/apache2/sites-enabled/comingsoon.conf":
      content => template('apache2/comingsoon.erb'),
      mode   => 644,
      owner  => root,
      group  => root,
      notify  => Service["apache2"],
      require => Package["apache2"];
  }

  file {
    "/etc/apache2/sites-enabled/000-default":
      ensure => absent,
      require => Package["apache2"],
      notify  => Service["apache2"],
  }

}
