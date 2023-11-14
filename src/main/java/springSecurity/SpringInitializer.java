package springSecurity;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

public class SpringInitializer extends AbstractSecurityWebApplicationInitializer {

	public SpringInitializer() {
		super(SpringConfiguration.class);
		
	}
}
