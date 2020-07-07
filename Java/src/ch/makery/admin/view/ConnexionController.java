package ch.makery.admin.view;

import ch.makery.admin.MainApp;
import ch.makery.admin.model.Connexion;
import ch.makery.admin.model.Person;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

public class ConnexionController{
    private MainApp mainApp;
    @FXML
    private TextField user;

    public void setMainApp(MainApp mainApp) {
        this.mainApp = mainApp;

        // Add observable list data to the table
        user.setText(mainApp.getConnexionData());
    }

    @FXML
    private void handleSignin() {
        Person tempPerson = new Person();
        boolean okClicked = mainApp.showPersonOverview(tempPerson);
        if (okClicked) {
        }

    }

    @FXML
    private void handleSignup(ActionEvent actionEvent) {
        Connexion tempConnexion = new Connexion();
        boolean okClicked = mainApp.showConnexion(tempConnexion);
        if (okClicked) {
        }
    }
}

