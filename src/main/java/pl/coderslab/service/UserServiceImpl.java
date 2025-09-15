package pl.coderslab.service;

import org.springframework.stereotype.Service;
import pl.coderslab.entity.Role;
import pl.coderslab.entity.User;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.UserRepository;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(User user) {
        // Saves the password as plain text, without hashing.
        user.setPassword(user.getPassword());
        user.setActive(true);
        // Assigns a default "USER" role to every new user.
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    // ... (rest of the methods are unchanged)
    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public List<User> findBySupervisor(User user) {
        return userRepository.findBySupervisor(user);
    }

    @Override
    public Double getMaxContractValue(User user) {
        Set<Role> roles = user.getRoles();
        Double max = 0.00;
        if (roles == null) return max;
        for (Role role : roles) {
            if (role.getMaxContractValue() != null && max < role.getMaxContractValue()) {
                max = role.getMaxContractValue();
            }
        }
        return max;
    }
}
