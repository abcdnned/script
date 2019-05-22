#!/bin/bash
ROOT="test"
FOLDER="src/main/java/hello"
RESOURCES="src/main/resources"
CONTROLLER='
package hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NameController {

    @Autowired
    AppEnv appEnv;

    @RequestMapping("/name")
    public String name() {
        return appEnv.name;
    }
}

'
ENV='
package hello;

import org.springframework.stereotype.*;
import org.springframework.beans.factory.annotation.*;

@Component
public class AppEnv {

    @Value("${name}")
    public String name;

}
'
APPPROTO='
name=springboot
}
'
create.sh $ROOT/$FOLDER NameController.java "$CONTROLLER"
create.sh $ROOT/$FOLDER AppEnv.java "$ENV"
create.sh $ROOT/$RESOURCES application.properties "$APPPROTO"
