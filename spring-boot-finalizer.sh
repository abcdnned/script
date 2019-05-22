#!/bin/bash
ROOT="test"
FOLDER="src/main/java/hello"
METINF="src/main/resources/META-INF"
FINALIZER='
package hello;

import org.springframework.beans.factory.BeanNotOfRequiredTypeException;
import org.springframework.boot.diagnostics.AbstractFailureAnalyzer;
import org.springframework.boot.diagnostics.FailureAnalysis;

public class MyBeanNotOfRequiredTypeFailureAnalyzer
  extends AbstractFailureAnalyzer<BeanNotOfRequiredTypeException> {
 
    @Override
    protected FailureAnalysis analyze(Throwable rootFailure,
                                      BeanNotOfRequiredTypeException cause) {
        return new FailureAnalysis(getDescription(cause), getAction(cause), cause);
    }
 
    private String getDescription(BeanNotOfRequiredTypeException ex) {
        return String.format("The bean %s could not be injected as %s "
          + "because it is of type %s",
          ex.getBeanName(),
          ex.getRequiredType().getName(),
          ex.getActualType().getName());
    }
 
    private String getAction(BeanNotOfRequiredTypeException ex) {
        return String.format("Consider creating a bean with name %s of type %s",
          ex.getBeanName(),
          ex.getRequiredType().getName());
    }
}
'
SERVICE='
package hello;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class MyService {
 
    @Resource(name = "myDAO")
    private MyDAO myDAO;
}
'
BEAN1='
package hello;

public class MyDAO {
}
'
BEAN2='
package hello;

import org.springframework.stereotype.Repository;

@Repository("myDAO")
public class MySecondDAO { }
'
REGISTER='
org.springframework.boot.diagnostics.FailureAnalyzer=\
  hello.MyBeanNotOfRequiredTypeFailureAnalyzer
'
create.sh $ROOT/$FOLDER MyBeanNotOfRequiredTypeFailureAnalyzer.java "$FINALIZER"
create.sh $ROOT/$FOLDER MyService.java "$SERVICE"
create.sh $ROOT/$FOLDER MyDAO.java "$BEAN1"
create.sh $ROOT/$FOLDER MySecondDAO.java "$BEAN2"
create.sh $ROOT/$METINF spring.factories "$REGISTER"
