function jdk --argument-names jdk_version
     set -gx JAVA_HOME (/usr/libexec/java_home -v"$jdk_version")
     java -version
end
