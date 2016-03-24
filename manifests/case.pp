case $::operatingsystem {
  'debian':  { include Debian } # apply the Debian class
  'ubuntu':  { include Ubuntu } # apply the Ubuntu class
   default:  { include Centos } # apply the Centos class
}

class Centos { 
	file { '/tmp/src':
  		ensure => 'directory',
  		owner  => 'root',
  		group  => 'root',
  		mode   => '0755',
	}
}

case $::operatingsystem {
  'ubuntu': {
    $ssh_pkg = 'ssh'
  }
  'solaris': {
    $ssh_pkg = [ 'SUNWsshcu', 'SUNWsshdr', 'SUNWsshdu', 'SUNWsshr', 'SUNWsshu' ]
  }
  # default assumes CentOS, RedHat
  default: {
    $ssh_pkg = ['openssh', 'openssh-clients', 'openssh-server']
  }
}

package { $ssh_pkg:
  ensure => present,
}
