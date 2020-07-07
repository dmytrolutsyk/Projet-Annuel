package ch.makery.admin.view;

import ch.makery.admin.MainApp;
import ch.makery.admin.model.Ad;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;

public class AdOverviewController {
    @FXML
    private TableView<Ad> AdTable;
    @FXML
    private TableColumn<Ad, String> TitleColumn;
    @FXML
    private Label TitleLabel;
    @FXML
    private Label DescriptionLabel;
    @FXML
    private Label CategoryLabel;
    @FXML
    private Label PhotoLabel;

    // Reference to the main application.
    private MainApp mainApp;

    /**
     * The constructor.
     * The constructor is called before the initialize() method.
     */
    public AdOverviewController() {
    }

    /**
     * Initializes the controller class. This method is automatically called
     * after the fxml file has been loaded.
     */
    @FXML
    private void initialize() {
        // Initialize the Ad table with the two columns.
        TitleColumn.setCellValueFactory(cellData -> cellData.getValue().TitleProperty());
        
        // Clear Ad details.
        showAdDetails(null);

        // Listen for selection changes and show the Ad details when changed.
        AdTable.getSelectionModel().selectedItemProperty().addListener(
                (observable, oldValue, newValue) -> showAdDetails(newValue));
    }

    /**
     * Is called by the main application to give a reference back to itself.
     * 
     * @param mainApp
     */
    public void setMainApp(MainApp mainApp) {
        this.mainApp = mainApp;

        // Add observable list data to the table
        AdTable.setItems(mainApp.getAdData());
    }
    
    /**
     * Fills all text fields to show details about the Ad.
     * If the specified Ad is null, all text fields are cleared.
     * 
     * @param Ad the Ad or null
     */
    private void showAdDetails(Ad Ad) {
        if (Ad != null) {
            // Fill the labels with info from the Ad object.
            TitleLabel.setText(Ad.getTitle());
            DescriptionLabel.setText(Ad.getDescription());
            CategoryLabel.setText(Ad.getCategory());
            PhotoLabel.setText(Ad.getPhoto());
        } else {
            // Ad is null, remove all the text.
            TitleLabel.setText("");
            DescriptionLabel.setText("");
            CategoryLabel.setText("");
            PhotoLabel.setText("");
        }
    }
    
    /**
     * Called when the user clicks on the delete button.
     */
    @FXML
    private void handleDeleteAd() {
        int selectedIndex = AdTable.getSelectionModel().getSelectedIndex();
        if (selectedIndex >= 0) {
            AdTable.getItems().remove(selectedIndex);
        } else {
            // Nothing selected.
            Alert alert = new Alert(AlertType.WARNING);
            alert.initOwner(mainApp.getPrimaryStage());
            alert.setTitle("No Selection");
            alert.setHeaderText("No Ad Selected");
            alert.setContentText("Please select a Ad in the table.");
            
            alert.showAndWait();
        }
    }
    
    /**
     * Called when the user clicks the new button. Opens a dialog to edit
     * details for a new Ad.
     */
    @FXML
    private void handleNewAd() {
        Ad tempAd = new Ad();
        boolean okClicked = mainApp.showAdEditDialog(tempAd);
        if (okClicked) {
            mainApp.getAdData().add(tempAd);
        }
    }

    /**
     * Called when the user clicks the edit button. Opens a dialog to edit
     * details for the selected Ad.
     */
    @FXML
    private void handleEditAd() {
        Ad selectedAd = AdTable.getSelectionModel().getSelectedItem();
        if (selectedAd != null) {
            boolean okClicked = mainApp.showAdEditDialog(selectedAd);
            if (okClicked) {
                showAdDetails(selectedAd);
            }

        } else {
            // Nothing selected.
            Alert alert = new Alert(AlertType.WARNING);
            alert.initOwner(mainApp.getPrimaryStage());
            alert.setTitle("No Selection");
            alert.setHeaderText("No Ad Selected");
            alert.setContentText("Please select a Ad in the table.");
            
            alert.showAndWait();
        }
    }
}