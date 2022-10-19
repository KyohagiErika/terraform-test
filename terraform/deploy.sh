echo null > /deploy-logs/terraform-test.log
cd terraform-test > /deploy-logs/terraform-test.log
git pull > /deploy-logs/terraform-test.log
docker compose down > /deploy-logs/terraform-test.log
docker compose build --no-cache > /deploy-logs/terraform-test.log
docker compose up -d > /deploy-logs/terraform-test.log