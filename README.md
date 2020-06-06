# com.nero.java.jndi
演示Tomcat8.5配置mysql JNDI数据源
## 步骤
1. 将mysql jdbc驱动放入TOMCAT_HOME/lib文件夹下
1. 在TOMCAT_HOME/conf/context.xml中配置数据源
```xml
<Context>
  <Resource name="jdbc/mysql" auth="Container"
            type="javax.sql.DataSource"
			description="Employees Database for HR Applications"
			maxActive="100"
			maxIdle="30"
			maxWait="10000"
			username="basic"
			password="000000"
			driverClassName="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/jdbctest?useUnicode=true&amp;characterEncoding=utf-8"/>
</Context>
```

1.在web应用的WEB-INF/web/xml中配置Resource-Ref标签
```xml
    <!--MySQL数据库JNDI数据源引用 -->
    <resource-ref>
        <description>MySQL DB Connection</description>
        <res-ref-name>jdbc/mysql</res-ref-name>
        <res-type>javax.sql.DataSource</res-type>
        <res-auth>Container</res-auth>
    </resource-ref>
```
1.通过JNDI api 访问数据源


>注：TOMCAT_HOME是tomcat的安装目录