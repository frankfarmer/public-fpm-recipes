require 'pathname'

ROOT = Pathname.new(__FILE__).expand_path.dirname

Vagrant.configure('2') do |config|
  config.vm.define 'bionic64' do |machine|
    machine.vm.provider 'docker' do |docker|
      docker.build_dir = ROOT.join "docker/bionic"
      docker.build_args = ['--rm=true', "--tag=wikia_fpm_recipes/bionic"]

      # Avoid leaving unused containers behind.
      docker.create_args = %w[--rm=true --privileged=true]
    end
  end
end
