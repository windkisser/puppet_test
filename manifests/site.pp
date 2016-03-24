node 'fedora2.localdomain' {
        include custom_utils
	include sudoers
	include motd
	include ntp
}
 
class custom_utils {
        package { ["lynx","httpd","nmap","telnet","vim-enhanced","traceroute"]:
                ensure => installed,
                allow_virtual => false,
        }
	service { ["httpd","puppet"]:
		ensure => running,
		enable => true,
	}
	group { 'sysadmin':
  		ensure => present,
	}
	user { 'elvis':
  		ensure => present,
	}
}

class sudoers {
	file { '/etc/sudoers':
    	source => 'puppet:///modules/sudoers/sudoers',
    	mode   => '0440',
    	owner  => 'root',
    	group  => 'root',
  	}
}

