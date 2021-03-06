#yum -y install ruby rubygems ruby-devel make gcc rpm-build git
# gem install fpm

class fpm::centos {
  package { 'ruby-devel':
    ensure => 'present',
  }
  package { 'rubygems':
    ensure => 'present',
  }
  package { 'make':
    ensure => 'present',
  }
  package { 'gcc':
    ensure => 'present',
  }
  package { 'rpm-build':
    ensure => 'present',
  }
  package { 'git':
    ensure => 'present',
  }
  package { 'fpm':
    ensure => 'present',
    provider => 'gem',
    require  => [ Package["rubygems"], Package["ruby-devel"] ],
  }

file { 'redis-rpm.sh':
    ensure  => present,
    path    => '/tmp/redis-rpm.sh',
    owner   => vagrant,
    group   => vagrant,
    mode    => '0755',
    replace => true,
    source  => 'puppet:///modules/fpm/redis-rpm.sh',
  }
file { 'elasticsearch-rpm.sh':
    ensure  => present,
    path    => '/tmp/elasticsearch-rpm.sh',
    owner   => vagrant,
    group   => vagrant,
    mode    => '0755',
    replace => true,
    source  => 'puppet:///modules/fpm/elasticsearch-rpm.sh',
  }


}