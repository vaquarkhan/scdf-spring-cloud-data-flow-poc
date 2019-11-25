## spring-cloud-data-flow
POC for Spring Cloud Data Flow

See this architecture diagram ![Architecture diagram](architecture.png?raw=true "Title")


## For local instalation with Docker follow the guide https://dataflow.spring.io/docs/installation/local/
To start it:
- `cd docker`
- `start.bat`

To start Shell run:
`docker exec -it dataflow-server java -jar shell.jar`

## For local Openshift instalation (with admin):
-Enable Hyper-V https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v
-Add Switch "External VM Switch" https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/connect-to-network
-Download release https://github.com/minishift/minishift/releases/download/v1.34.1/minishift-1.34.1-windows-amd64.zip
-`cd minishift`
-change default memory: `minishift config set --global memory 8192`
- minishift config set  hyperv-virtual-switch "External VM Switch"
-start it `minishift start`  (this downloads the oc binary, image ...)
When OpenShift server started.The server is accessible via web console at: https://192.168.156.249:8443/console
You are logged in as:
User:     developer
Password: developer

To login as administrator: `oc login -u system:admin`

##Install Helm
- download binary from https://get.helm.sh/helm-v2.16.1-windows-amd64.zip
- unzip into helm directory
- helm init
- helm repo update
- helm install --name my-release stable/spring-cloud-data-flow --set kafka.enabled=true,rabbitmq.enabled=false  --set features.streaming.enabled=true --set features.batch.enabled=true

as Helm didnt work https://dataflow.spring.io/docs/installation/kubernetes/kubectl/

To open the Spring Cloud Data Flow Dashboard go to http://localhost:9393/dashboard

You can reach the Prometheus UI at http://localhost:9090/graph and http://localhost:9090/targets

You can reach the Grafana dashboard at http://localhost:3000 with the following credentials:
User: admin
Password: admin

##TODO 
integration test to insert generated csv file with milion rows into sftp folder, 50 000 jms xml messages into Kafka 
gui security
openshift example
email notification - alert manager

https://github.com/spring-cloud/spring-cloud-dataflow



easies way is to use https://dataflow.spring.io/docs/installation/local/manual/

https://www.kaggle.com/ is a data generator platform



install 18c-XE https://github.com/fuzziebrain/docker-oracle-xe and try to export the oracle scripts which flyway created

