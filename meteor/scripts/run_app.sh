set -e

if [ -d /bundle ]; then
  cd /bundle
  tar xzf *.tar.gz
  cd /bundle/bundle/programs/server/
  npm i
  cd /bundle/bundle/
elif [[ $BUNDLE_URL ]]; then
  cd /tmp
  curl -L -o bundle.tar.gz $BUNDLE_URL
  tar xzf bundle.tar.gz
  cd /tmp/bundle/programs/server/
  npm i
  cd /tmp/bundle/
elif [ -d /built_app ]; then
  cd /built_app
else
  echo "=> You don't have an meteor app to run in this image."
  exit 1
fi

if [[ $REBULD_NPM_MODULES ]]; then
  if [ -f /opt/meteord/rebuild_npm_modules.sh ]; then
    cd programs/server
    bash /opt/meteord/rebuild_npm_modules.sh
    cd ../../
  else
    echo "=> Use meteorhacks/meteord:bin-build for binary bulding."
    exit 1
  fi
fi

export PORT=80
echo "=> Starting meteor app on port:$PORT"
node main.js
