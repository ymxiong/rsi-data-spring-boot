rm -rf core-starter/target/
mvn clean install -DskipTests
docker build -t apps.horsecoder.com:5000/s-60b824d3ecbdff0a3956589ac922e740-core:latest -f ./Dockerfile.prod .
docker push apps.horsecoder.com:5000/s-60b824d3ecbdff0a3956589ac922e740-core:latest
curl -X POST "http://apps.horsecoder.com:32871/task" -H "accept: application/json" -H "Content-Type: application/json" -d "{ \"image\": \"apps.horsecoder.com:5000/s-60b824d3ecbdff0a3956589ac922e740-core:latest\", \"name\": \"60b824d3ecbdff0a3956589ac922e740-core\", \"namespace\": \"horsecoder-test\", \"path\": \"/core/\", \"port\": 30845}"
