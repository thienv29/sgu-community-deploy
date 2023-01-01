echo Hello, World!

# config backend
cd sgu-community-be
git checkout deploy
git checkout -- .env
git pull
sudo yarn install
cp ../../env-be/.env.dev .env
npx prisma generate
sudo yarn build

# config frontend
cd ../sgu-community-fe
git checkout deploy
git checkout -- next.config.js
git pull
sudo yarn install
cp ../../env-fe/config.dev.js next.config.js
sudo yarn build

# back to root directory
cd ..

# run app
# concurrently "cd sgu-community-be && yarn start" "cd sgu-community-fe && yarn start"

# cp ../Docker-file/be/.dockerignore .dockerignore
# cp ../Docker-file/be/Dockerfile Dockerfile
