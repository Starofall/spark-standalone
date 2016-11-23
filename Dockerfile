FROM openjdk:8

ENV SPARK_VERSION 1.6.3
ENV HADOOP_VERSION 2.6

RUN curl -s http://www-us.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz | tar -xz -C /tmp/
RUN ln -s /tmp/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION /spark

ENV SPARK_HOME /spark

EXPOSE 8080 8081 7077 9001 

CMD /spark/sbin/start-master.sh -h ${HOSTNAME} && \
	  /spark/sbin/start-slave.sh -h ${HOSTNAME} -d /spark/work -p 9001 --webui-port 8081 spark://${HOSTNAME}:7077 && \
    tail -f /dev/null
