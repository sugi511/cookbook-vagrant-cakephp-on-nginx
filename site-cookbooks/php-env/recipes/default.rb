#
# Cookbook Name:: php-env
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{php-fpm php-pecl-zendopcache php php-common php-mbstring php-pdo php-cli php-devel php-gd php-mysql php-mcrypt}.each do |pkg|
  package pkg do 
    action :install
    notifies :restart, "service[php-fpm]"
  end
end

service "php-fpm" do
  action [:enable, :start]
end