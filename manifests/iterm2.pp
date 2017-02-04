## Installs custom iterm2 and settings
class samson::iterm2 () {
  include iterm2::dev
  include iterm2::colors::solarized_dark

  vcsrepo { "/Users/${::boxen_user}/Library/Application Support/iTerm2/DynamicProfiles":
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/samsonnguyen/iterm-profile.git',
    revision => 'master',
    require  => Package['ssh-askpass']
  }
}