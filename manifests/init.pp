# Custom puppet module
class samson(
  $user = $::boxen_user,
  $group = 'staff',
  $home = "/Users/${::boxen_user}") {
  include boxen::config
  include homebrew
  include virtualbox
  include vagrant
  include samson::iterm2

  file { ["${home}/dev"]:
    ensure => directory,
    owner  => $user,
    group  => $group
  }

  homebrew::tap { 'theseal/ssh-askpass': }
  package { ['ssh-askpass']:
    ensure => installed,
    require => Homebrew::Tap['theseal/ssh-askpass']
  }

  package { ['coreutils','gpg','jq']:
    ensure => installed,
  }

  package { ['1password','spotify','atom','tunnelblick','spectacle','the-unarchiver','rubymine','google-chrome']:
    ensure   => installed,
    provider => 'brewcask'
  }

### Rubymine 7.1.4
#  package { 'https://raw.githubusercontent.com/caskroom/homebrew-cask/64f1f6b7578b3823f0a3d405206c95938adfa733/Casks/rubymine.rb':
#    provider => 'brewcask'
#  }

  file_line { 'ensure we load the env':
    line => 'source /opt/boxen/env.sh',
    path => "${home}/.bash_profile",
  }
}
