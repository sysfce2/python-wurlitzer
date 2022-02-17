Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
  config.ssh.forward_env = [
    # for codecov, from
    # https://github.com/codecov/uploader/blob/b561fe71e0262aa606b7391014ff01228adfac3d/src/ci_providers/provider_githubactions.ts#L113-L124
    'GITHUB_ACTION',
    'GITHUB_HEAD_REF',
    'GITHUB_REF',
    'GITHUB_REPOSITORY',
    'GITHUB_RUN_ID',
    'GITHUB_SERVER_URL',
    'GITHUB_SHA',
    'GITHUB_WORKFLOW',
  ]

  config.vm.define "freebsd" do |bsd|
    vm = bsd.vm
    vm.box = "generic/freebsd12"
    vm.provision "shell", inline: "pkg install -y git py38-pip py38-sqlite3", privileged: true
    vm.provision "shell", inline: "echo 'export PATH=$HOME/.local/bin:$PATH' >> $HOME/.bash_profile", privileged: false
  end
end
