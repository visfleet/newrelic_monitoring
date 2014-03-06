name              'newrelic_monitoring'
maintainer        'Gazelle'
maintainer_email  'ssalinas@gazelle.com'
license           'MIT'
description       'Installs New Relic Plugins and Server Monitoring'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '1.0.0'

recipe 'newrelic_plugins::passenger', 'Installs New Relic Passenger Plugin'
recipe 'newrelic_plugins::server_monitor', 'Installs New Relic Server Monitoring'

depends 'git'

%w{ debian ubuntu centos suse fedora redhat }.each do |os|
  supports os
end

attribute 'newrelic/hostname',
  :display_name => 'New Relic Hostname',
  :description => 'Name as it should appear in New Relic',
  :type => 'string',
  :required => 'required',
  :recipes => ['newrelic_plugins::passenger', 'newrelic_plugins::server_monitor']

attribute 'newrelic/license_key',
  :display_name => 'New Relic License Key',
  :description => 'License Key for your New Relic account',
  :type => 'string',
  :required => 'required',
  :recipes => ['newrelic_plugins::passenger', 'newrelic_plugins::server_monitor']

attribute 'newrelic/passenger/install_path',
  :display_name => 'New Relic passenger Plugin Install Directory',
  :description => 'Install Directory for New Relic passenger Plugin',
  :type => 'string',
  :required => 'required',
  :default => '/opt/newrelic',
  :recipes => ['newrelic_plugins::passenger']

attribute 'newrelic/passenger/user',
  :display_name => 'New Relic passenger Plugin User',
  :description => 'User to run as for New Relic passenger Plugin',
  :type => 'string',
  :required => 'required',
  :recipes => ['newrelic_plugins::passenger']
