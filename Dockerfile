
## Dockerfile for a haskell environment
FROM       debian:stretch

MAINTAINER Paolo Veronelli <paolo.veronelli@gmail.com>

ENV LAST_UPDATED 2017-11-12

## ensure locale is set during build
ENV LANG            C.UTF-8
ENV HOME /root

#common
RUN apt-get update
RUN apt-get install -y ca-certificates g++ curl libgmp-dev
RUN apt-get install -y vim git wget tmux make gnupg

#stack
RUN curl -fSL \
        https://github.com/commercialhaskell/stack/releases/download/v1.6.0.20171022/stack-1.6.0.20171022-linux-x86_64-static.tar.gz\
        -o stack.tar.gz 
RUN curl -fSL \
       https://github.com/commercialhaskell/stack/releases/download/v1.6.0.20171022/stack-1.6.0.20171022-linux-x86_64-static.tar.gz.asc\ 
        -o stack.tar.gz.asc
RUN export GNUPGHOME="$(mktemp -d)"
RUN gpg --keyserver ha.pool.sks-keyservers.net \
	--recv-keys C5705533DA4F78D8664B5DC0575159689BEFB442 
RUN gpg --batch --verify stack.tar.gz.asc stack.tar.gz 
RUN tar -xf stack.tar.gz -C /usr/local/bin --strip-components=1 
RUN rm -rf "$GNUPGHOME" /var/lib/apt/lists/* /stack.tar.gz.asc /stack.tar.gz

ENV STACK_ROOT=/stack

#vim

WORKDIR $HOME
RUN mkdir -p .vim/bundle
RUN mkdir -p .vim/undo

ADD bundles.vim bundles.vim

RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN vim -u bundles.vim +PlugInstall +qall

ADD bundles.vim .vimrc
ADD rest.vim rest.vim
RUN cat rest.vim >> .vimrc
RUN rm bundles.vim rest.vim


WORKDIR $HOME/.vim/plugged/vimproc.vim
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
ENV PATH=$PATH:$HOME/.local/bin
