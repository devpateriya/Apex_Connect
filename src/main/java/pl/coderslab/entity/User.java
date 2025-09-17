package pl.coderslab.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Data
@Entity
@Table(name = "users") // <-- THIS IS THE FIX. It renames the table to avoid the keyword conflict.
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @NotBlank
    @Email
    @Column(unique = true)
    private String email;
    
    @NotBlank
    private String password;
    
    @NotBlank
    private String firstname;
    
    @NotBlank
    private String lastname;
    
    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH}, fetch = FetchType.EAGER)
    @JoinTable(name="user_roles", joinColumns=@JoinColumn(name="user_id"), inverseJoinColumns=@JoinColumn(name="roles_role_id"))
    private Set<Role> roles;
    
    private boolean active;
    
    private String phone;
    
    @ManyToOne
    @JoinColumn(name = "office_id")
    private Office office;
    
    @ManyToOne
    @JoinColumn(name = "supervisor_id")
    private User supervisor;
    
    @OneToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH}, mappedBy = "user")
    @JsonIgnore
    private List<Client> clients;
    
    
    
    public String getName() {
        return getFirstname() +" "+ getLastname();
    }
    

}
