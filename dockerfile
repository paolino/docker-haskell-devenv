
## Dockerfile for a haskell environment
FROM       debian:stretch

MAINTAINER Paolo Veronelli <paolo.veronelli@gmail.com>

ENV LAST_UPDATED 2017-11-12

## ensure locale is set during build
ENV LANG            C.UTF-8
ENV HOME /root

#haskell
RUN apt-get update
run apt-get install -y gnupg
RUN echo 'deb http://ppa.launchpad.net/hvr/ghc/ubuntu trusty main' > \
            /etc/apt/sources.list.d/ghc.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F6F88286 
RUN apt-get update 
RUN apt-get install -y cabal-install-2.0 ghc-8.2.1 
RUN apt-get install -y happy-1.19.5 alex-3.1.7     
RUN apt-get install -y zlib1g-dev libtinfo-dev libsqlite3-0 libsqlite3-dev 
RUN apt-get install -y ca-certificates g++ git curl 
RUN apt-get install -y vim git wget xclip tmux make

RUN curl -fSL \
        https://github.com/commercialhaskell/stack/releases/download/v1.6.0.20171022/stack-1.6.0.20171022-linux-x86_64-static.tar.gz\
        -o stack.tar.gz 
RUN curl -fSL \
       https://github.com/commercialhaskell/stack/releases/download/v1.6.0.20171022/stack-1.6.0.20171022-linux-x86_64-static.tar.gz.asc\ 
        -o stack.tar.gz.asc
RUN apt-get purge -y --auto-remove curl 
RUN export GNUPGHOME="$(mktemp -d)"
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys C5705533DA4F78D8664B5DC0575159689BEFB442 
RUN gpg --batch --verify stack.tar.gz.asc stack.tar.gz 
RUN tar -xf stack.tar.gz -C /usr/local/bin --strip-components=1 
RUN /usr/local/bin/stack config set system-ghc --global true 
RUN rm -rf "$GNUPGHOME" /var/lib/apt/lists/* /stack.tar.gz.asc /stack.tar.gz

ENV PATH $HOME/.cabal/bin:$HOME/.local/bin:/opt/cabal/2.0/bin:/opt/ghc/8.2.1/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.7/bin:$PATH

#configuring editor
RUN mkdir -p $HOME/.vim/bundle

ADD vimrc $HOME/.vimrc
ADD bundles.vim $HOME/.vim/bundles.vim

RUN git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
RUN vim -u $HOME/.vim/bundles.vim +PluginInstall +qall

WORKDIR $HOME/.vim/bundle/vimproc.vim
RUN make


WORKDIR $HOME
run wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key \
    -O Release.key
run apt-key add - < Release.key
run echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /'> \ 
    /etc/apt/sources.list.d/fish.list 
run apt-get update
run apt-get install -y fish
run chsh -s /usr/bin/fish
ENTRYPOINT ["fish"]

