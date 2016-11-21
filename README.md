# spark-standalone
Starts a standalone spark master and one slave.
Suited for development or single node testing.

Versions:
* Spark Version 1.6.3 
* Hadoop Version 2.6

Features:
* Starts Spark Master
* Starts Spark Client
* Keeps the container alive forever
* Ports are exposed

To use spark for local development:
```
docker run --name spark -d -p 8080:8080 -p 8081:8081 -p 7077:7077 -p 9001:9001 starofall/spark-standalone
```

If you want to link it to another container just use:
```
docker run --name spark -d starofall/spark-standalone
```
