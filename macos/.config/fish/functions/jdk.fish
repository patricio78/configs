function jdk --argument-names jdk_version
    switch $jdk_version
        case 21
            set -gx JAVA_HOME ~/Downloads/openjdk_21.0.5.0.101_21.39.14_aarch64
        case '*'
            echo "JDK $jdk_version not supported"
            return 1
    end
    ln -fs $JAVA_HOME/bin/java ~/bin/java
    java -version
end
