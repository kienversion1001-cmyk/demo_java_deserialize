#!/bin/bash

build_app() {
  app_path="$1"
  app_name="$2"
  cd "/usr/local/tomcat/${app_path}" || return 1
  mvn clean package || return 1
  mv "target/${app_name}-1.0-SNAPSHOT.war" "/usr/local/tomcat/webapps/" || return 1
  rm -rf target
  echo "Successfully built and deployed ${app_name}"
}

case "$1" in
    1) build_app "java_deserialization/deserialize-lv1" "java-deserialize-lv1" ;;
    2) build_app "java_deserialization/deserialize-lv2" "java-deserialize-lv2" ;;
    3) build_app "java_deserialization/deserialize-lv3" "java-deserialize-lv3" ;;
    4) build_app "java_deserialization/deserialize-lv4" "java-deserialize-lv4" ;;
    5) build_app "java_deserialization/deserialize-exploit-tool" "deserialize-exploit" ;;
    6) build_app "debug-java-web" "debug-java-web" ;;
    7)
        build_app "debug-java-web" "debug-java-web"
        build_app "java_deserialization/deserialize-lv1" "java-deserialize-lv1"
        build_app "java_deserialization/deserialize-lv2" "java-deserialize-lv2"
        build_app "java_deserialization/deserialize-lv3" "java-deserialize-lv3"
        build_app "java_deserialization/deserialize-lv4" "java-deserialize-lv4"
        build_app "java_deserialization/deserialize-exploit-tool" "deserialize-exploit"
        ;;
    8) echo "Exiting..." ; exit 0 ;;
    *)  
        echo "Usage: $0 <option>"
        echo "1. deserialize-lv1"
        echo "2. deserialize-lv2"
        echo "3. deserialize-lv3"
        echo "4. deserialize-lv4"
        echo "5. deserialize-exploit-tool"
        echo "6. debug-java-web"
        echo "7. all"
        echo "8. exit"
        exit 1 ;;
esac
