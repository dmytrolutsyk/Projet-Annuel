package ch.makery.address.model;

import java.time.LocalDate;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 * Model class for a Person.
 *
 * @author Marco Jakob
 */
public class Person {

    private final StringProperty Username;
    private final StringProperty Password;
    private final StringProperty Email;
    private final IntegerProperty Phone;
    private final StringProperty City;
    private final StringProperty Usertype;

    /**
     * Default constructor.
     */
    public Person() {
        this(null, null);
    }

    /**
     * Constructor with some initial data.
     * 
     * @param Username
     * @param Password
     */
    public Person(String Username, String Password) {
        this.Username = new SimpleStringProperty(Username);
        this.Password = new SimpleStringProperty(Password);

        // Some initial dummy data, just for convenient testing.
        this.Email = new SimpleStringProperty("some Email");
        this.Phone = new SimpleIntegerProperty(1234);
        this.City = new SimpleStringProperty("some City");
        this.Usertype = new SimpleStringProperty("association");
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

    public String getEmail() {
        return Email.get();
    }

    public void setEmail(String Email) {
        this.Email.set(Email);
    }

    public StringProperty EmailProperty() {
        return Email;
    }

    public int getPhone() {
        return Phone.get();
    }

    public void setPhone(int Phone) {
        this.Phone.set(Phone);
    }

    public IntegerProperty PhoneProperty() {
        return Phone;
    }

    public String getCity() {
        return City.get();
    }

    public void setCity(String City) {
        this.City.set(City);
    }

    public StringProperty CityProperty() {
        return City;
    }

    public String getUsertype() {
        return Usertype.get();
    }

    public void setUsertype(String Usertype) {
        this.Usertype.set(Usertype);
    }

    public StringProperty UsertypeProperty() {
        return Usertype;
    }
}