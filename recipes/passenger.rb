# verify ruby dependency
verify_ruby 'Passenger Plugin'

# check required attributes
verify_attributes do
  attributes [
    'node[:newrelic][:license_key]',
    'node[:newrelic][:passenger][:install_path]',
    'node[:newrelic][:passenger][:user]',
  ]
end

directory "/opt/newrelic" do
  action :create
  recursive true
end

verify_license_key node[:newrelic][:license_key]

install_plugin 'newrelic_passenger_plugin' do
  plugin_version   node[:newrelic][:passenger][:version]
  install_path     node[:newrelic][:passenger][:install_path]
  plugin_path      node[:newrelic][:passenger][:plugin_path]
  download_url     node[:newrelic][:passenger][:download_url]
  user             node[:newrelic][:passenger][:user]
end

# newrelic template
template "#{node[:newrelic][:passenger][:plugin_path]}/config/newrelic_plugin.yml" do
  source 'passenger/newrelic_plugin.yml.erb'
  action :create
  owner node[:newrelic][:passenger][:user]
  notifies :restart, 'service[newrelic-passenger-plugin]'
end

# install bundler gem and run 'bundle install'
bundle_install do
  path node[:newrelic][:passenger][:plugin_path]
  user node[:newrelic][:passenger][:user]
end

# install init.d script and start service
plugin_service 'newrelic-passenger-plugin' do
  daemon          './newrelic_passenger_agent'
  daemon_dir      node[:newrelic][:passenger][:plugin_path]
  plugin_name     'passenger'
  plugin_version  node[:newrelic][:passenger][:version]
  run_command     "sudo -u #{node[:newrelic][:passenger][:user]} bundle exec"
end
