import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableAutoConfiguration
public class HelloJava {

    @RequestMapping("/")
    String home() {
        return "Hello from Java!";
    }

    public static void main(String[] args) {
        SpringApplication.run(HelloJava.class, args);
    }

}