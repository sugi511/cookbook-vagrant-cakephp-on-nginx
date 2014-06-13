#
# Cookbook Name:: cakephp_install
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cakephp_dir = "/usr/share/nginx/html/#{node['nginx']['cakephp']['app_name']}"
execute "chmod app_dir" do
  command "sudo chown -R vagrant:wheel #{cakephp_dir}"
  action :run
end

execute "bake cake project" do
  command "su vagrant -l -c 'yes | #{cakephp_dir}/Vendor/bin/cake bake project #{cakephp_dir}'" 
  action :run
end

template 'php.ini' do
  path '/etc/php.ini'
  source "php.ini"
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, "service[php-fpm]"
end
