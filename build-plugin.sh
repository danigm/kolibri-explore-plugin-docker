# Build master kolibri-explore-plugin
git clone https://github.com/endlessm/kolibri-explore-plugin.git

python3 -m venv env
. ./env/bin/activate

pip install nodeenv
nodeenv -p --node=10.17.0
npm install -g yarn@1.22.10
yarn global add @vue/cli

# building all custom channels and copy to kolibri-explore-plugin
git clone https://github.com/endlessm/kolibri-channel-custom-web-app.git
cd kolibri-channel-custom-web-app
# This is needed, for some reason the template-ui doesn't build without the
# nodes.json
./scripts/create_mock_nodes.py > template-ui/src/nodes.json
yarn install
yarn build
yarn deploy ../kolibri-explore-plugin/kolibri_explore_plugin/apps
cd ..

cd kolibri-explore-plugin
pip install -r requirements.txt
pip install wheel
yarn install
make dist
cd ..

deactivate
