class sshd {
  package { 'sshd':
    ensure => present,
    name   => 'openssh-server',
  }
  service { 'sshd':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  #  this works too
  #  subscribe => File['/etc/ssh/sshd_config'],
  }
  file { '/etc/ssh/sshd_config':
    source  => 'puppet:///modules/sshd/sshd_config',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => Service['sshd'],
    require => Package['sshd'],
  }
}
