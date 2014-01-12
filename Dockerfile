FROM ubuntu

# install curl, needed to get NVM, git, needed to install NVM, and man-db,
# needed for NVM to run
RUN apt-get install -y curl git man-db

# make node user
RUN groupadd node
RUN useradd -s /bin/bash -m -g node -d /home/node node

# install NVM
RUN su -c "touch .profile" -l node
RUN su -c "curl https://raw.github.com/creationix/nvm/master/install.sh | sh" -l node

# install v0.8.18 by default
ENV NODE_JS_VERSION v0.8.18
RUN su -c "nvm install $NODE_JS_VERSION " -l node
RUN su -c "nvm alias default $NODE_JS_VERSION " -l node

# log in as 'node' user by default
CMD su -l node
