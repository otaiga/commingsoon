class comingsoon {

  $user = "${app_name}"
  
  package {
    "bundler":
      provider => gem
  }

  group { "${user}":
    ensure => 'present',
  }

  user { "${user}":
     gid => "${user}",
     comment => 'The application user',
     managehome => 'true',
     shell => '/bin/bash',
     ensure => 'present',
     require => Group["${user}"],
  }

  file {
    "base_directory":
      path => "${base_dir}",
      ensure => directory,
      owner => "${user}",
      group => "${user}",
      mode => 775;
    "app_directory":
      path => "${app_dir}",
      ensure => directory,
      owner => "${user}",
      group => "${user}",
      mode => 775;
    "shared_directory":
      path => "${app_dir}shared",
      ensure => directory,
      owner => "${user}",
      group => "${user}",
      mode => 775;
    "shared_log_directory":
      path => "${app_dir}shared/log",
      ensure => directory,
      owner => "${user}",
      group => "${user}",
      mode => 775;
    "shared_pids_directory":
      path => "${app_dir}shared/pids",
      ensure => directory,
      owner => "${user}",
      group => "${user}",
      mode => 775;
    "shared_config_directory":
      path => "${app_dir}shared/config",
      ensure => directory,
      owner => "${user}",
      group => "${user}",
      mode => 775;
    "releases_directory":
      path => "${app_dir}releases",
      ensure => directory,
      owner => "${user}",
      group => "${user}",
      mode => 775;
  }

  file { "${app_dir}shared/config/config.yml":
    owner => "${user}",
    group => "${user}",
    mode => 775,
    require => File[shared_config_directory],
    source => "puppet:///modules/comingsoon/config.yml"
  }

  file {"${app_dir}shared/config/secret_token.rb":
    owner => "${user}",
    group => "${user}",
    mode => 775,
    require => File[shared_config_directory],
    source => "puppet:///modules/comingsoon/secret_token.rb"
  }

  # this key was generated from the file.pem file:
  #  ssh-keygen -y -f file.pem
  ssh_authorized_key { "comingsoon.pem.pub":
    ensure => "present",
    type => "ssh-rsa",
    key => "${pem_pub}",
    user => "${user}",
  }

}