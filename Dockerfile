
# ALWAYS USE LATEST
FROM mcr.microsoft.com/devcontainers/universal:latest

# INSTALL LATEST JAVA STUFF
RUN bash -c ". /usr/local/sdkman/bin/sdkman-init.sh && \
    echo y|sdk upgrade"

# INSTALL COOL STUFF
RUN brew install fzf exa buildpacks/tap/pack kubectl
RUN yes | $(brew --prefix)/opt/fzf/install

# DEFAULT TO ZSH
ENV SHELL=/usr/bin/zsh

RUN git clone https://github.com/zsh-users/zsh-autosuggestions /home/vscode/.zsh/zsh-autosuggestions

ADD --chown=vscode:vscode https://raw.githubusercontent.com/maeddes/dotfiles/main/.zshrc.gitpod.full /home/vscode/.zshrc