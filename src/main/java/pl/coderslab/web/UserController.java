package pl.coderslab.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    // This method tells Spring: when someone visits "/login", show them the "login.html" file.
    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }
}