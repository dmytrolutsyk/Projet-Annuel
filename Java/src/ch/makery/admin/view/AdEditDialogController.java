package ch.makery.admin.view;

import ch.makery.admin.model.Ad;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

/**
 * Dialog to edit details of a ad.
 * 
 * @author Marco Jakob
 */
public class AdEditDialogController {

    @FXML
    private TextField TitleField;
    @FXML
    private TextField DescriptionField;
    @FXML
    private TextField CategoryField;
    @FXML
    private TextField PhotoField;


    private Stage dialogStage;
    private Ad ad;
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
     * Sets the ad to be edited in the dialog.
     * 
     * @param ad
     */
    public void setAd(Ad ad) {
        this.ad = ad;

        TitleField.setText(ad.getTitle());
        DescriptionField.setText(ad.getDescription());
        CategoryField.setText(ad.getCategory());
        PhotoField.setText(ad.getPhoto());

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
            ad.setTitle(TitleField.getText());
            ad.setDescription(DescriptionField.getText());
            ad.setCategory(CategoryField.getText());
            ad.setPhoto(PhotoField.getText());

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

        if (TitleField.getText() == null || TitleField.getText().length() == 0) {
            errorMessage += "No valid User name!\n";
        }
        if (DescriptionField.getText() == null || DescriptionField.getText().length() == 0) {
            errorMessage += "No valid Description!\n";
        }
        if (CategoryField.getText() == null || CategoryField.getText().length() == 0) {
            errorMessage += "No valid Category!\n";
        }
        if (PhotoField.getText() == null || PhotoField.getText().length() == 0) {
            errorMessage += "No valid Photo!\n";
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