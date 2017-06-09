
package com.iqmsoft.boot.groovytpl;

import java.net.URI;

import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import static org.assertj.core.api.Assertions.assertThat;


@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@DirtiesContext
public class GroovyTemplateApplicationTests {

	@LocalServerPort
	private int port;

	@Autowired
	private TestRestTemplate restTemplate;

	@Test
	public void testHome() throws Exception {
		ResponseEntity<String> entity = this.restTemplate.getForEntity("/", String.class);
		assertThat(entity.getStatusCode()).isEqualTo(HttpStatus.OK);
		assertThat(entity.getBody()).contains("<title>Messages");
		assertThat(entity.getBody()).doesNotContain("layout:fragment");
	}

	@Test
	public void testCreate() throws Exception {
		MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
		map.set("text", "FOO text");
		map.set("summary", "FOO");
		URI location = this.restTemplate.postForLocation("/", map);
		assertThat(location.toString()).contains("localhost:" + this.port);
	}

	@Test
	public void testCss() throws Exception {
		ResponseEntity<String> entity = this.restTemplate
				.getForEntity("/css/bootstrap.min.css", String.class);
		assertThat(entity.getStatusCode()).isEqualTo(HttpStatus.OK);
		assertThat(entity.getBody()).contains("body");
	}

}
