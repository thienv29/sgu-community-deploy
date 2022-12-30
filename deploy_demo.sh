echo Hello, World!

npx kill-port --port 5100
npx kill-port --port 3100

# config backend
cd sgu-community-be
git checkout deploy
git checkout -- .env
git pull
yarn install
cp ../.env.demo .env
npx prisma generate
yarn build

# config frontend
cd ../sgu-community-fe
git checkout deploy
git checkout -- next.config.js
git pull
yarn install
cp ../env-fe/config.demo.js next.config.js
yarn build

# back to root directory
cd ..

# run app
concurrently "cd sgu-community-be && yarn start" "cd sgu-community-fe && yarn start"