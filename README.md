PressGang CCMS Deployment
=========================

Prerequisites:
--------------

1. Add the following profiles to your maven settings.xml:

        <profile>
        	<id>oss-public</id>
        	<activation>
        		<property>
        			<name>!oss.public.off</name>
        		</property>
        	</activation>
        	<repositories>
        		<repository>
        			<id>oss-public</id>
        			<name>oss-public</name>
        			<url>https://oss.sonatype.org/content/groups/public/</url>
        			<releases>
        				<enabled>true</enabled>
        			</releases>
        			<snapshots>
        				<enabled>true</enabled>
        			</snapshots>
        		</repository>
        	</repositories>
        	<pluginRepositories>
        		<pluginRepository>
        			<id>oss-public</id>
        			<name>oss-public</name>
        			<url>https://oss.sonatype.org/content/groups/public/</url>
        			<releases>
        				<enabled>true</enabled>
        			</releases>
        			<snapshots>
        				<enabled>true</enabled>
        			</snapshots>
        		</pluginRepository>
        	</pluginRepositories>
        </profile>
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
    		
2. Checkout and install the following applications into your local maven repo for the required version (eg git clone `REPO`; git checkout `VERSION`; mvn clean install)
 * https://github.com/pressgang-ccms/PressGangCCMSREST
 * https://github.com/pressgang-ccms/PressGangCCMSStatic
 * https://github.com/pressgang-ccms/PressGangCCMSUI
 * https://github.com/pressgang-ccms/PressGangCCMSImport
