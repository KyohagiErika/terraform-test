echo =====Checkout project folder=====
cd ~/terraform-test
echo =====Pull the latest=====
git pull
echo =====Docker Compose down=====
docker compose down
echo =====Docker Compose build======
docker compose build --no-cache
echo =====Docker Compose up======
docker compose up -d
echo =====DONE!======
exit 0