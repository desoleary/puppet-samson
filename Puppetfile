#!/usr/bin/env ruby
#^syntax detection

# use dependencies defined in metadata.json
# metadata

# use dependencies defined in Modulefile
# modulefile

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

forge 'https://forgeapi.puppetlabs.com'
mod    'puppetlabs-vcsrepo'

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
github 'iterm2', '1.2.5'
github 'virtualbox'
github 'vagrant'
