#
# Cookbook Name:: cakephp_install
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory "/usr/share/nginx/html/#{node['nginx']['cakephp']['app_name']}" do
  mode "0775"
  owner 'vagrant'
  group 'wheel'
  action :create
end

template 'composer.json' do
  path "/usr/share/nginx/html/#{node['nginx']['cakephp']['app_name']}/composer.json"
  source "composer.json.erb"
  owner 'root'
  group 'root'
  mode '0775'
end
