## Spring Boot & Spring Cloud example applications for [Kubernetes Service Binding](https://github.com/servicebinding/spec)
Tested with:
* OpenShift
* DBaaS

## Building/deploying all modules
```shell
# build 
./mvnw clean package


# build the images 

 docker build -t spring-postgresql-demo .
 docker image tag spring-postgresql-demo quay.io/<org>/spring-postgresql-demo:v0.0.1
 
# push the images to your image registry
docker push  quay.io/<org>/spring-postgresql-demo:v0.0.1         

# deploy the application to a OpenShift cluster
oc apply -f k8s/deploy-postgresql-app.yaml 
```


## Service Binding

Provide data to be consumed by Service Binding clients (the applications in this repo.).

### Managed cloud database resources

Managing your cloud databases automating Secrets, ConfigMap creation, and volume mounting for applications,
you can use `DBaaS`, aka [`Red Hat OpenShift Database Access Operator`](https://github.com/RHEcosystemAppEng/dbaas-operator)

### Manual database resources preparation

1. Provision the services, such as  PostgreSql
2. Create a Secret or ConfigMap containing the properties to access the service
3. Mount the Secret and/or ConfigMap as a volume within the Pod for the application
4. Set the `SERVICE_BINDING_ROOT` environment variable specifying where the service information has been mounted

Instead of manually preparing steps 2 through 4, they can be automated by installing and using the [`Service Binding Operator`](https://github.com/redhat-developer/service-binding-operator)

## Relevant resources

* [Quarkus App for PostgreSql](https://github.com/RHEcosystemAppEng/postgresql-orm-quickstart)
* [Spring Cloud Bindings](https://github.com/spring-cloud/spring-cloud-bindings)
