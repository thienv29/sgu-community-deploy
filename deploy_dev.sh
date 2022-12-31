echo Hello, World!

npx kill-port --port 5100
npx kill-port --port 3100
npx kill-port --port 3000

# config backend
cd sgu-community-be
git checkout deploy
git checkout -- .env
git pull
yarn install
npx prisma generate
cp ../env-be/.env.demo .env

# config frontend
cd ../sgu-community-fe
git checkout deploy
git checkout -- next.config.js
git pull
yarn install
cp ../env-fe/config.demo.js next.config.js

# back to root directory
cd ..

# run app
concurrently "cd sgu-community-be && yarn dev" "cd sgu-community-fe && yarn dev"