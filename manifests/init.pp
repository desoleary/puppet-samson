# Custom puppet module
class samson(
  $user = $::boxen_user,
  $group = 'staff',
  $home = "/Users/${::boxen_user}") {
  include boxen::config
  include homebrew
  include iterm2::dev
  include iterm2::colors::solarized_dark
  include virtualbox
  include vagrant

  file { ["${home}/dev"]:
    ensure => directory,
    owner  => $user,
    group  => $group
  }

  package { ['1password']:
    ensure   => installed,
    provider => 'brewcask'
  }

  ### Rubymine 7.1.4
  package { 'https://raw.githubusercontent.com/caskroom/homebrew-cask/64f1f6b7578b3823f0a3d405206c95938adfa733/Casks/rubymine.rb':
    provider => 'brewcask'
  }

  file_line { 'ensure we load the env':
    line => 'source /opt/boxen/env.sh',
    path => "${home}/.bash_profile",
  }
}
