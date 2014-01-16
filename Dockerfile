FROM dscho/node.js

# for native plugins
RUN apt-get update
RUN apt-get install -y python g++ make

# get cloud9 v2.0.93
RUN su -c "git clone -n https://github.com/ajaxorg/cloud9/" -l node
RUN su -c "cd cloud9 && git fetch && git reset --hard origin/master" -l node

# provide cloud9
RUN su -c "cd cloud9 && npm install" -l node
VOLUME /workspace
EXPOSE 3131

# by default, run cloud9
CMD su -c "cd cloud9/bin && sh -x ./cloud9.sh -l 0.0.0.0 -w /workspace" -l node
