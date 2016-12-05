require 'chef/provisioning'
require 'chef/provisioning/hanlon_driver/hanlon_driver'

with_driver 'hanlon:192.168.1.128:8026/hanlon/api/v1'
current_dir = File.dirname(__FILE__)

num = ENV['HARDWARE_TARGET'] || '2'
deploy="coreos_on_#{num}"

remote_file "#{current_dir}/../web/coreos_production_iso_image-1185.3.0.iso" do
  source 'https://stable.release.core-os.net/amd64-usr/1185.3.0/coreos_production_iso_image.iso'
  checksum '1601e88e17d0dc62e6f8617a0d2f2c844c41a79c54f7e3780e23a256e4e1b1bd' #sha256sum
end

hanlon_image 'coreos_production_iso_image-1185.3.0.iso' do
  type 'os'
  version '1185.3.0'
  description 'CoreOS stable 1185'
end

hanlon_model "ii#{deploy}" do
  action :delete if ENV['DESTROY']
  #image 'coreos_production_iso_image.iso'
  image 'coreos_production_iso_image-1185.3.0.iso'
  template 'coreos_stable'
  metadata ({
              hostname_prefix: 'iicoremem',
              domainname: 'vulk.can.cd',
              cloud_config: {
                install_disk: '/dev/sda',
                users: [{ name: 'hh','coreos-ssh-import-github' =>  'hh',
                          groups: [ 'sudo', 'docker']}],
                coreos: { units: [
                            { name: 'etcd.service', command: 'start' },
                            { name: 'fleet.service', command: 'start' },
                          ]},} })
end

hanlon_policy "ii#{deploy}" do
  model "ii#{deploy}"
  template 'linux_deploy'
  tags num
  maximum 1
end

#bash "ipmi-chassis -h 1.1.0.#{num} --chassis-control=power-up"
