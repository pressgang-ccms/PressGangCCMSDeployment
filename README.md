PressGang CCMS Deployment
=========================

Prerequisites:
--------------

1. Add the following profiles to your maven settings.xml:

        
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">
	<profiles>
		<profile>
			<id>jboss-public</id>
			<activation>
				<property>
					<name>!jboss.public.off</name>
				</property>
			</activation>
			<repositories>
				<repository>
					<id>jboss-public</id>
					<name>JBoss Public Repository Group</name>
					<url>http://repository.jboss.org/nexus/content/groups/public/</url>
					<releases>
						<enabled>true</enabled>
						<updatePolicy>never</updatePolicy>
					</releases>
					<snapshots>
						<enabled>true</enabled>
						<updatePolicy>daily</updatePolicy>
					</snapshots>
				</repository>
			</repositories>
			<pluginRepositories>
				<pluginRepository>
					<id>jboss-public</id>
					<name>JBoss Public Repository Group</name>
					<url>http://repository.jboss.org/nexus/content/groups/public/</url>
					<releases>
						<enabled>true</enabled>
					</releases>
					<snapshots>
						<enabled>true</enabled>
					</snapshots>
				</pluginRepository>
			</pluginRepositories>
		</profile>
	</profiles>
</settings>	
    		
2. Checkout and install the following applications into your local maven repo for the required version (eg git clone `REPO`; git checkout `VERSION`; mvn clean install)
 * https://github.com/pressgang-ccms/PressGangCCMSREST
 * https://github.com/pressgang-ccms/PressGangCCMSStaticContent
 * https://github.com/pressgang-ccms/PressGangCCMSUI
 * https://github.com/pressgang-ccms/PressGangCCMSImport
