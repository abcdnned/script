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
public class ConfPropertiesController {

    @Autowired
    AcmeProperties acme;

    @RequestMapping("/acme")
    public AcmeProperties acme() {
        return acme;
    }
}


'
BEAN='
package hello;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties("acme")
public class AcmeProperties {

	private boolean enabled;

	private InetAddress remoteAddress;

	private final Security security = new Security();

	public Security getSecurity() { return security; }

	/**
	 * Get enabled.
	 *
	 * @return enabled as boolean.
	 */
	public boolean isEnabled() {
	    return enabled;
	}

	/**
	 * Set enabled.
	 *
	 * @param enabled the value to set.
	 */
	public void setEnabled(boolean enabled) {
	    this.enabled = enabled;
	}

	/**
	 * Get remoteAddress.
	 *
	 * @return remoteAddress as InetAddress.
	 */
	public InetAddress getRemoteAddress() {
	    return remoteAddress;
	}

	/**
	 * Set remoteAddress.
	 *
	 * @param remoteAddress the value to set.
	 */
	public void setRemoteAddress(InetAddress remoteAddress) {
	    this.remoteAddress = remoteAddress;
	}

	public static class Security {

		private String username;

		private String password;

		private List<String> roles = new ArrayList<>(Collections.singleton("USER"));

		/**
		 * Get username.
		 *
		 * @return username as String.
		 */
		public String getUsername() {
		    return username;
		}

		/**
		 * Set username.
		 *
		 * @param username the value to set.
		 */
		public void setUsername(String username) {
		    this.username = username;
		}

		/**
		 * Get password.
		 *
		 * @return password as String.
		 */
		public String getPassword() {
		    return password;
		}

		/**
		 * Set password.
		 *
		 * @param password the value to set.
		 */
		public void setPassword(String password) {
		    this.password = password;
		}

		/**
		 * Get roles.
		 *
		 * @return roles as List<String>.
		 */
		public List<String> getRoles() {
		    return roles;
		}

		/**
		 * Set roles.
		 *
		 * @param roles the value to set.
		 */
		public void setRoles(List<String> roles) {
		    this.roles = roles;
		}
	}


}
'
YML='
acme:
    remote-address: 192.168.1.1
    security:
        username: admin
        roles:
          - USER
          - ADMIN
'
create.sh $ROOT/$FOLDER ConfPropertiesController.java "$CONTROLLER"
create.sh $ROOT/$FOLDER AcmeProperties.java "$BEAN"
create.sh $ROOT/$RESOURCES application.yml "$YML"
