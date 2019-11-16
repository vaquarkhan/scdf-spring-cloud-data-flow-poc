# spring-cloud-data-flow
POC for Spring Cloud Data Flow

See this architecture diagram ![Architecture diagram](architecture.png?raw=true "Title")

For local instalation with Docker follow the guide https://dataflow.spring.io/docs/installation/local/

To start it:
- go to directory docker and run start.bat

To start Shell run:
docker exec -it dataflow-server java -jar shell.jar



To open the Spring Cloud Data Flow Dashboard go to http://localhost:9393/dashboard

You can reach the Prometheus UI at http://localhost:9090/graph and http://localhost:9090/targets

You can reach the Grafana dashboard at http://localhost:3000 with the following credentials:
User: admin
Password: admin