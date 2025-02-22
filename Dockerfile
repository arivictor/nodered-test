FROM nodered/node-red

# copy package.json to the WORKDIR so npm builds for node-red
COPY package.json .
RUN npm install --unsafe-perm --no-update-notifier --no-audit --only=production

# copy node-red project files into place
COPY flow.json /data/flow.json
COPY flow_cred.json /data/flow_cred.json
COPY settings.js /data/settings.js

CMD ["npm", "start"]
