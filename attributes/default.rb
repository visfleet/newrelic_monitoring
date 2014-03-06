# passenger plugin attributes
default[:newrelic][:passenger][:version] = "1.0.1"
default[:newrelic][:passenger][:download_url] = "https://github.com/secondrotation/newrelic_passenger_plugin/archive/master.tar.gz"
default[:newrelic][:passenger][:install_path] = "/opt/newrelic"
default[:newrelic][:passenger][:plugin_path] = "#{node[:newrelic][:passenger][:install_path]}/newrelic_passenger_plugin"
default[:newrelic][:passenger][:user] = "root"
