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
-start it `minishift start`  (this downloads the oc binary, image ...)
When OpenShift server started.The server is accessible via web console at: https://192.168.99.128:8443
You are logged in as:
User:     developer
Password: developer

To login as administrator: `oc login -u system:admin`


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
