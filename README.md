# apache-cosign
Testing centos & httpd

You will need 2 execute build steps in Jenkins:

git clone https://github.com/cousinea/apache-cosign.git

echo ${BUILD_NUMBER} > apache-cosign/skel/build

docker build -t docker-pilot.dsc.umich.edu:31111/apache-cosign apache-cosign/

docker tag docker-pilot.dsc.umich.edu:31111/apache-cosign docker-pilot.dsc.umich.edu:31111/apache-cosign:${BUILD_NUMBER}

docker push docker-pilot.dsc.umich.edu:31111/apache-cosign

------------


sed -i -e "s|docker-pilot.dsc.umich.edu:31111/apache-cosign:latest|docker-pilot.dsc.umich.edu:31111/apache-cosign:$BUILD_NUMBER|g" apache-cosign/apache-cosign.marathon.json

curl -X PUT -H "Accept: application/json" -H "Content-Type: application/json" http://docker-pilot.dsc.umich.edu:8080/v2/apps/apache-cosign -d @apache-cosign/apache-cosign.marathon.json
