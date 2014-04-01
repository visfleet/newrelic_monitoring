define :bundle_install do
  # install bundler gem
  gem_package 'bundler' do
    options '--no-ri --no-rdoc'
  end

  # bundle install
  execute 'bundle install' do
    cwd params[:path]
    command "env NOKOGIRI_USE_SYSTEM_LIBRARIES=true bundle install"
    user params[:user]
    only_if { File.directory?(params[:path]) }
  end
end
