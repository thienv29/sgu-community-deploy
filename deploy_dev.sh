echo Hello, World!

npx kill-port --port 5100
npx kill-port --port 3100

# config backend
cd sgu-community-be
git checkout dev
git checkout -- .env
git pull
yarn install
npx prisma generate
cp ../.env.demo .env

# config frontend
cd ../sgu-community-fe
git checkout dev
git checkout -- next.config.js
git pull
yarn install
cp ../env-fe/config.demo.js next.config.js

# back to root directory
cd ..

# run app
concurrently "cd sgu-community-be && yarn dev" "cd sgu-community-fe && yarn dev"