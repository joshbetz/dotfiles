# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Link the dotfiles
  config.vm.synced_folder File.expand_path("~/bin"), "/home/vagrant/bin"

  # Provision
  config.vm.provision :shell, :path => File.join(File.dirname(File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__), "vagrant.sh"),  :upload_path => "/tmp/vagrant-dotfiles"

  # Setup dotfiles
  config.vm.provision :shell, inline: "su vagrant -c /home/vagrant/bin/dotfiles/install.sh > /dev/null"
end
