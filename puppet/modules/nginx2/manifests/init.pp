class nginx2 {
 
  package { 'nginx':
    ensure => installed,
  }
    
  service { 'nginx':
    ensure => running,
    require => Package['nginx'],
  }
 
  file { '/etc/nginx/sites-enabled/default':
    source => "puppet:///modules/nginx2/${::fqdn}/default.conf",
    notify => Service['nginx'],
   }

#  file { '/var/www/cat-pictures/index.html':
#    source => 'puppet:///modules/nginx2/cat-pictures.conf',
#   }
}
