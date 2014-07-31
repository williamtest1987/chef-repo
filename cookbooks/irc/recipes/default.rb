#
# Cookbook Name:: william
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user = "tdi"

directory "/home/#{user}" do
  owner user
  mode 0700
end

user user do
  action :create
  shell "/bin/bash"
  home "/home/#{user}"
  supports :manage_home => true
end

package "irssi" do
  action :install
end

directory "/home/#{user}/.irssi" do
  owner user
  mode 0700
end

cookbook_file "/home/#{user}/.irssi/config" do
  source "config"
  owner user
  mode 0700
end
