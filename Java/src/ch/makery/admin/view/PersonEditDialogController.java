package ch.makery.admin.view;

import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import ch.makery.admin.model.Person;

/**
 * Dialog to edit details of a person.
 * 
 * @author Marco Jakob
 */
public class PersonEditDialogController {

    @FXML
    private TextField UsernameField;
    @FXML
    private TextField PasswordField;
    @FXML
    private TextField EmailField;
    @FXML
    private TextField PhoneField;
    @FXML
    private TextField CityField;
    @FXML
    private TextField UsertypeField;


    private Stage dialogStage;
    private Person person;
    private boolean okClicked = false;

    /**
     * Initializes the controller class. This method is automatically called
     * after the fxml file has been loaded.
     */
    @FXML
    private void initialize() {
    }

    /**
     * Sets the stage of this dialog.
     * 
     * @param dialogStage
     */
    public void setDialogStage(Stage dialogStage) {
        this.dialogStage = dialogStage;
    }

    /**
     * Sets the person to be edited in the dialog.
     * 
     * @param person
     */
    public void setPerson(Person person) {
        this.person = person;

        UsernameField.setText(person.getUsername());
        PasswordField.setText(person.getPassword());
        EmailField.setText(person.getEmail());
        PhoneField.setText(Integer.toString(person.getPhone()));
        CityField.setText(person.getCity());
        UsertypeField.setText(person.getUsertype());
    }

    /**
     * Returns true if the user clicked OK, false otherwise.
     * 
     * @return
     */
    public boolean isOkClicked() {
        return okClicked;
    }

    /**
     * Called when the user clicks ok.
     */
    @FXML
    private void handleOk() {
        if (isInputValid()) {
            person.setUsername(UsernameField.getText());
            person.setPassword(PasswordField.getText());
            person.setEmail(EmailField.getText());
            person.setPhone(Integer.parseInt(PhoneField.getText()));
            person.setCity(CityField.getText());
            person.setUsertype(UsertypeField.getText());

            okClicked = true;
            dialogStage.close();
        }
    }

    /**
     * Called when the user clicks cancel.
     */
    @FXML
    private void handleCancel() {
        dialogStage.close();
    }

    /**
     * Validates the user input in the text fields.
     * 
     * @return true if the input is valid
     */
    private boolean isInputValid() {
        String errorMessage = "";

        if (UsernameField.getText() == null || UsernameField.getText().length() == 0) {
            errorMessage += "No valid User name!\n";
        }
        if (PasswordField.getText() == null || PasswordField.getText().length() == 0) {
            errorMessage += "No valid Password!\n";
        }
        if (EmailField.getText() == null || EmailField.getText().length() == 0) {
            errorMessage += "No valid Email!\n";
        }

        if (PhoneField.getText() == null || PhoneField.getText().length() == 0) {
            errorMessage += "No valid Phone!\n";
        } else {
            // try to parse the Phone into an int.
            try {
                Integer.parseInt(PhoneField.getText());
            } catch (NumberFormatException e) {
                errorMessage += "No valid Phone (must be an integer)!\n";
            }
        }

        if (CityField.getText() == null || CityField.getText().length() == 0) {
            errorMessage += "No valid City!\n";
        }
        if (UsertypeField.getText() == null || UsertypeField.getText().length() == 0) {
            errorMessage += "No valid User name!\n";
        }

        if (errorMessage.length() == 0) {
            return true;
        } else {
            // Show the error message.
            Alert alert = new Alert(AlertType.ERROR);
            alert.initOwner(dialogStage);
            alert.setTitle("Invalid Fields");
            alert.setHeaderText("Please correct invalid fields");
            alert.setContentText(errorMessage);
            
            alert.showAndWait();
            
            return false;
        }
    }
}