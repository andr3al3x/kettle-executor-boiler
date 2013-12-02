JAVA_OPTS="-Xms128m -Xmx512m"
BASEDIR=`dirname $0`

EXEC_JAR=$BASEDIR/kettle-executor-boiler-1.0-SNAPSHOT.jar
EXEC_CLASSNAME=org.itfactory.kettle.App
EXEC_CLASSPATH=$EXEC_JAR

# Add PDI extra JARs to classpath
for f in `find $BASEDIR/lib -type f -name "*.jar"`
do
  EXEC_CLASSPATH=$EXEC_CLASSPATH:$f
done

echo $EXEC_CLASSPATH

# Start flume agent
java $JAVA_OPTS -cp $EXEC_CLASSPATH $EXEC_CLASSNAME "${1+$@}"