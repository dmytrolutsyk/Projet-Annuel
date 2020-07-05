package ch.makery.address.model;

import javafx.beans.property.*;

import java.time.LocalDate;

/**
 * Model class for a Person.
 *
 * @author Marco Jakob
 */
public class Ad {

    private final StringProperty Title;
    private final StringProperty Description;
    private final StringProperty Category;
    private final StringProperty Photo;

    /**
     * Default constructor.
     */
    public Ad() {
        this(null, null);
    }

    /**
     * Constructor with some initial data.
     *
     * @param Title
     * @param Description
     */
    public Ad(String Title, String Description) {
        this.Title = new SimpleStringProperty(Title);
        this.Description = new SimpleStringProperty(Description);

        // Some initial dummy data, just for convenient testing.
        this.Category = new SimpleStringProperty("some Category");
        this.Photo = new SimpleStringProperty("https://diplomeo-static.com/news-files/0/400/461/kamal-hennou2-esgi.jpg");
    }

    public String getTitle() {
        return Title.get();
    }

    public void setTitle(String Title) {
        this.Title.set(Title);
    }

    public StringProperty TitleProperty() {
        return Title;
    }

    public String getDescription() {
        return Description.get();
    }

    public void setDescription(String Description) {
        this.Description.set(Description);
    }

    public StringProperty DescriptionProperty() {
        return Description;
    }

    public String getCategory() {
        return Category.get();
    }

    public void setCategory(String Category) {
        this.Category.set(Category);
    }

    public StringProperty CategoryProperty() {
        return Category;
    }

    public String getPhoto() {
        return Photo.get();
    }

    public void setPhoto(String Photo) {
        this.Photo.set(Photo);
    }

    public StringProperty PhotoProperty() {
        return Photo;
    }

}