## New Relic Plugin's Cookbook ##

## Overview ##

This cookbook installs, configures and manages as a service New Relic Plugins on Debian/RHEL.

To use the cookbook, add it to your Chef cookbooks path under the name `newrelic_plugins`.

Recipes for the following plugins are provided:

 - [New Relic Server Monitoring](#server-monitoring)
 - [Passenger Plugin](#passenger-plugin)

## Requirements ##

Chef 0.10.10+ and Ohai 6.10+ for `platform_family` support.

## Platforms ##
 - Debian
 - Ubuntu
 - CentOS
 - Red Hat
 - Fedora
 - Amazon
 - FreeBSD

## Usage ##

## Passenger Plugin ##

#### Attributes: ####

 `node[:newrelic][:license_key]` - _(required)_ New Relic License Key

 `node[:newrelic][:passenger][:install_path]` -  _(required)_ Install directory. Defaults to `/opt/newrelic`. Any downloaded files will be placed here. The plugin will be installed within this directory at `newrelic_passenger_plugin`.

 `node[:newrelic][:passenger][:user]` - _(required)_ User to run as

#### Usage: ####

    name "newrelic_passenger_plugin"
    description "System that runs the passenger Plugin"
    run_list(
      "recipe[newrelic_plugins::passenger]"
    )
    default_attributes(
      "newrelic" => {
        "license_key" => "NEW_RELIC_LICENSE_KEY",
        "passenger" => {
          "install_path" => "/path/to/plugin",
          "user" => "newrelic"
        }
      }
    )

## Server Monitoring ##

#### Attributes: ####

 `node[:newrelic][:license_key]` - _(required)_ New Relic License Key

 `node[:newrelic][:hostname]` -  _(required)_ Hostname as it should appear in newrelic

#### Usage: ####

    name "newrelic_passenger_plugin"
    description "System that runs the passenger Plugin"
    run_list(
      "recipe[newrelic_plugins::server_monitor]"
    )
    default_attributes(
      "newrelic" => {
        "license_key" => "NEW_RELIC_LICENSE_KEY",
        "hostname" => "hostname"
      }
    )


*Based on the newrelic_plugins example plugin recipe*
http://blog.newrelic.com/2014/02/04/installing-new-relic-plugins-chef-puppet/
