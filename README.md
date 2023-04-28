# Job Portal

For live file update.

> Change this in `apache-tomcat-VERSION/conf/server.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
...
<Server port="8005" shutdown="SHUTDOWN">
    ...
  <Service name="Catalina">
      ...
    <Engine name="Catalina" defaultHost="localhost">
        ...
      <Host name="localhost"  appBase="webapps"
            ...
          <Context docBase="E:\assets" path="/files" />
          <!--Should be same on FileController & UploadDownloadController -->

      </Host>
    </Engine>
  </Service>
</Server>

```

