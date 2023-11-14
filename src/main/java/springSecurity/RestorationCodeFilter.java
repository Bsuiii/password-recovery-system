package springSecurity;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.filter.OncePerRequestFilter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RestorationCodeFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        // Check if the user has entered the valid restoration code (from session)
        boolean validCodeEntered = (request.getParameter("code"))!=null;

        if (!validCodeEntered && new AntPathRequestMatcher("/changePassword").matches(request)) {
            response.sendRedirect("/home.jsp"); // Redirect to an error page if code is not entered
            return;
        }

        filterChain.doFilter(request, response);
    }
}
