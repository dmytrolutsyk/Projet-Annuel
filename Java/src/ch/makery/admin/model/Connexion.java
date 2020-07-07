package ch.makery.admin.model;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 * Model class for a Person.
 *
 * @author Marco Jakob
 */
public class Connexion {

    private final StringProperty Username;
    private final StringProperty Password;

    /**
     * Default constructor.
     */
    public Connexion() {
        this(null, null);
    }

    /**
     * Constructor with some initial data.
     *
     * @param Username
     * @param Password
     */
    public Connexion(String Username, String Password) {
        this.Username = new SimpleStringProperty(Username);
        this.Password = new SimpleStringProperty(Password);
    }

    public String getUsername() {
        return Username.get();
    }

    public void setUsername(String Username) {
        this.Username.set(Username);
    }

    public StringProperty UsernameProperty() {
        return Username;
    }

    public String getPassword() {
        return Password.get();
    }

    public void setPassword(String Password) {
        this.Password.set(Password);
    }

    public StringProperty PasswordProperty() {
        return Password;
    }


}
