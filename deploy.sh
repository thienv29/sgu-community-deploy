echo Hello, World!

# npm install -g npm@latest
# npm install concurrently -g
# npm install kill-port -g
# npm install yarn -g


npx kill-port --port 5100
npx kill-port --port 3100

# config backend
cd sgu-community-be
git checkout -- .env
git pull
yarn install
npx prisma generate
cp ../configBe .env

# config frontend
cd ../sgu-community-fe
git checkout -- core/config/index.ts
git pull
yarn install
cp ../configFe core/config/index.ts

# back to root directory
cd ..

# run app
concurrently "cd sgu-community-be && npm run dev" "cd sgu-community-fe && npm run dev"