
class ssh {

  package  { 'openssh-clients':
    ensure => present,
  }

  file { '/etc/ssh/ssh_config':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['openssh-clients'],
    source  => 'puppet:///modules/ssh/ssh_config',
  }

  service { 'sshd':
    ensure => stopped,
    enable => false,
  }

}
