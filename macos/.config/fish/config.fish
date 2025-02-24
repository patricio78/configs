if status is-interactive

    set -g fish_key_bindings fish_vi_key_bindings

    set GOPATH ~/work/go
    fish_add_path ~/bin
    fish_add_path /opt/homebrew/Cellar/llvm/18.1.7/bin
    fish_add_path /usr/local/bin /usr/bin:/bin:/usr/sbin:/sbin:~/work/bash-tools/bin
    fish_add_path /usr/local/Cellar/gnu-getopt/1.1.6/bin $GOPATH/bin:$PATH
    fish_add_path /usr/local/opt/node@8/bin
    fish_add_path /usr/local/opt/helm@2/bin
    fish_add_path ~/.bat/bat-cli-LATEST/bin
    fish_add_path ~/.porter
    fish_add_path ~/.cargo/bin
    fish_add_path ~/work/flutter/bin
    fish_add_path "/usr/local/opt/ruby@2.7/bin"
    fish_add_path "/opt/homebrew/opt/openssl@3.1/bin/"
    fish_add_path /opt/homebrew/bin /opt/homebrew/Cellar/wireshark/4.0.5/bin:$PATH
    fish_add_path /Library/TeX/texbin/
    set GOPRIVATE "github.com/mulesoft/*,git.soma.salesforce.com/*"

    source ~/.config/fish/extra.fish

end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
