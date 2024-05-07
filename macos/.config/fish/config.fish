if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_key_bindings fish_vi_key_bindings

set JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-17.jdk/Contents/Home
set GOPATH ~/work/go
set PATH /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/work/bash-tools/bin
set PATH /usr/local/Cellar/gnu-getopt/1.1.6/bin:$GOPATH/bin:$PATH
set PATH /usr/local/opt/node@8/bin:$PATH
set PATH /usr/local/opt/helm@2/bin:$PATH
set PATH ~/.bat/bat-cli-LATEST/bin:$PATH
set PATH ~/.porter:$PATH
set PATH ~/.cargo/bin:$PATH
set PATH ~/work/flutter/bin:$PATH
set PATH "/usr/local/opt/ruby@2.7/bin:$PATH"
set PATH "/opt/homebrew/opt/openssl@3.1/bin/:$PATH"
set PATH /opt/homebrew/bin:/opt/homebrew/Cellar/wireshark/4.0.5/bin:$PATH
set PATH /Library/TeX/texbin/:$PATH
set GOPRIVATE "github.com/mulesoft/*,git.soma.salesforce.com/*"

# source ~/.config/fish/extra.fish
