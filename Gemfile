#source 'https://rubygems.com'
# per http://stackoverflow.com/questions/8693319/where-can-i-install-gems-from-when-rubygems-org-is-down
#source 'https://production.cf.rubygems.org'
source 'https://ruby.taobao.org/'
#gem 'chef-provisioning-hanlon', git: 'https://github.com/chef/chef-provisioning-hanlon.git', branch: 'master'
#gem 'hanlon-api', github: 'chef/chef-hanlon-api'
gem 'pry'
gem 'pry-byebug'
source 'https://rubygems.org'
if ENV['LOCALDEV']
  gem 'chef-provisioning-hanlon', path: '../chef-provisioning-hanlon'
  gem 'hanlon-api', path: '../hanlon-api-ruby'
else
  gem 'chef-provisioning-hanlon', github: 'hh/chef-provisioning-hanlon'
  gem 'hanlon-api', github: 'hh/hanlon-api-ruby'
end

#gem 'hanlon-api', path: './hanlon-api-ruby'
#gem 'chef-provisioning-hanlon', path: './chef-provisioning-hanlon'
