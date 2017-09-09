define :download, url: nil, to: nil do
  url = params[:url]
  to = params[:to]

  execute "Download #{url} to #{to}" do
    command "curl '#{url}' > #{to}"
    not_if File.file? to
  end
end

# Copy dotfiles
%w|
.aliases
.zshrc
.zprofile
.zlogout
.gitconfig
.gitignore.global
.vimrc
.tmux.conf
|.each do |f|
  dest = File.join ENV['HOME'], f
  remote_file dest do
    action :create
    mode "0644"
  end
end

directory "#{ENV['HOME']}/local/etc"

download "git-prompt" do
  url "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
  to File.join ENV['HOME'], "local", "etc", "git-prompt.sh"
end

download "git-completion" do
  url "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
  to File.join ENV['HOME'], "local", "etc", "git-completion.bash"
end
