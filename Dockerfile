# ALWAYS USE LATEST
FROM mcr.microsoft.com/devcontainers/universal:latest

USER vscode

# INSTALL LATEST JAVA
RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    echo y|sdk install java"

# INSTALL COOL STUFF
RUN brew install fzf exa buildpacks/tap/pack kubectl
RUN yes | $(brew --prefix)/opt/fzf/install

# DEFAULT TO ZSH
ENV SHELL=/usr/bin/zsh

RUN git clone https://github.com/zsh-users/zsh-autosuggestions /home/gitpod/.zsh/zsh-autosuggestions

ADD --chown=gitpod:gitpod https://raw.githubusercontent.com/maeddes/dotfiles/main/.zshrc.gitpod.full /home/gitpod/.zshrc