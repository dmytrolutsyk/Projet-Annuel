package ch.makery.admin;

import java.io.IOException;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import ch.makery.admin.model.Ad;
import ch.makery.admin.model.Connexion;
import ch.makery.admin.view.*;
import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import ch.makery.admin.model.Person;

public class MainApp extends Application {

    private Stage primaryStage;
    private BorderPane rootLayout;
    
    /**
     * The data as an observable list of Persons.
     */
    private ObservableList<Person> personData = FXCollections.observableArrayList();
    private ObservableList<Ad> AdData = FXCollections.observableArrayList();
    //private ObservableList<Connexion> ConnexionData = (ObservableList<Connexion>) FXCollections.emptyObservableMap();
    private String ConnexionData;

    /**
     * Constructor
     */
    public MainApp() {
        // Add some sample data
        personData.add(new Person("Hans", "oki123"));
        personData.add(new Person("Ruth", "azerty"));
        personData.add(new Person("Heinz", "toto"));
        personData.add(new Person("Cornelia", "ailenroc"));
        personData.add(new Person("Werner", "nerwer"));
        personData.add(new Person("Lydia", "Pay"));
        personData.add(new Person("Anna", "Bestpong24"));
        personData.add(new Person("Stefan", "fanfan"));
        personData.add(new Person("Martin", "Mystere"));
        AdData.add(new Ad("lit", "Nous offrons des lit aux familles que ne peuvent pas se permettre d'acheter un nouveau"));
        AdData.add(new Ad("lit", "Nous offrons des lit aux familles que ne peuvent pas se permettre d'acheter un nouveau"));
        AdData.add(new Ad("lit", "Nous offrons des lit aux familles que ne peuvent pas se permettre d'acheter un nouveau"));
        AdData.add(new Ad("lit", "Nous offrons des lit aux familles que ne peuvent pas se permettre d'acheter un nouveau"));

    }

    /**
     * Returns the data as an observable list of Persons. 
     * @return
     */
    public ObservableList<Person> getPersonData() {
        return personData;
    }
    public ObservableList<Ad> getAdData() {
        return AdData;
    }
    public String getConnexionData() {
        return ConnexionData;
    }


    @Override
    public void start(Stage primaryStage) throws Exception {
        this.primaryStage = primaryStage;
        this.primaryStage.setTitle("Find & Trade");
        this.primaryStage.getIcons().add(new Image("file:Logo.jpg"));

        MainApp obj = new MainApp();

        System.out.println("Testing 1 - Send Http GET request");
        obj.sendGet();
        obj.sendPost();



        initRootLayout();
        //Person tempPerson = new Person();
        //showPersonOverview(tempPerson);
        Connexion tempConnexion = new Connexion();
        showConnexion(tempConnexion);
        //showAdOverview();
    }

    /**
     * Initializes the root layout.
     */
    public void initRootLayout() {
        try {
            // Load root layout from fxml file.
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(MainApp.class.getResource("view/RootLayout.fxml"));
            rootLayout = (BorderPane) loader.load();

            // Show the scene containing the root layout.
            Scene scene = new Scene(rootLayout);
            primaryStage.setScene(scene);
            primaryStage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Shows the person overview inside the root layout.
     * @param tempPerson
     * @return
     */
    public boolean showPersonOverview(Person tempPerson) {
        try {
            // Load person overview.
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(MainApp.class.getResource("view/PersonOverview.fxml"));
            AnchorPane personOverview = (AnchorPane) loader.load();

            // Set person overview into the center of root layout.
            rootLayout.setCenter(personOverview);

            // Give the controller access to the main app.
            PersonOverviewController controller = loader.getController();
            controller.setMainApp(this);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean showAdOverview(Ad tempAd) {
        try {
            // Load person overview.
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(MainApp.class.getResource("view/AdOverview.fxml"));
            AnchorPane adOverview = (AnchorPane) loader.load();

            // Set person overview into the center of root layout.
            rootLayout.setCenter(adOverview);

            // Give the controller access to the main app.
            AdOverviewController controller = loader.getController();
            controller.setMainApp(this);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean showConnexion(Connexion tempConnexion) {
        try {
            // Load person overview.
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(MainApp.class.getResource("view/Connexion.fxml"));
            AnchorPane Connexion = (AnchorPane) loader.load();

            // Set person overview into the center of root layout.
            rootLayout.setCenter(Connexion);

            // Give the controller access to the main app.
            ConnexionController controller = loader.getController();
            controller.setMainApp(this);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    /**
     * Opens a dialog to edit details for the specified person. If the user
     * clicks OK, the changes are saved into the provided person object and true
     * is returned.
     * 
     * @param person the person object to be edited
     * @return true if the user clicked OK, false otherwise.
     */
    public boolean showPersonEditDialog(Person person) {
        try {
            // Load the fxml file and create a new stage for the popup dialog.
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(MainApp.class.getResource("view/PersonEditDialog.fxml"));
            AnchorPane page = (AnchorPane) loader.load();

            // Create the dialog Stage.
            Stage dialogStage = new Stage();
            dialogStage.setTitle("Edit Person");
            dialogStage.initModality(Modality.WINDOW_MODAL);
            dialogStage.initOwner(primaryStage);
            Scene scene = new Scene(page);
            dialogStage.setScene(scene);

            // Set the person into the controller.
            PersonEditDialogController controller = loader.getController();
            controller.setDialogStage(dialogStage);
            controller.setPerson(person);

            // Show the dialog and wait until the user closes it
            dialogStage.showAndWait();

            return controller.isOkClicked();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean showAdEditDialog(Ad ad) {
        try {
            // Load the fxml file and create a new stage for the popup dialog.
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(MainApp.class.getResource("view/AdEditDialog.fxml"));
            AnchorPane page = (AnchorPane) loader.load();

            // Create the dialog Stage.
            Stage dialogStage = new Stage();
            dialogStage.setTitle("Edit Ad");
            dialogStage.initModality(Modality.WINDOW_MODAL);
            dialogStage.initOwner(primaryStage);
            Scene scene = new Scene(page);
            dialogStage.setScene(scene);

            // Set the person into the controller.
            AdEditDialogController controller = loader.getController();
            controller.setDialogStage(dialogStage);
            controller.setAd(ad);

            // Show the dialog and wait until the user closes it
            dialogStage.showAndWait();

            return controller.isOkClicked();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Returns the main stage.
     * @return
     */
    public Stage getPrimaryStage() {
        return primaryStage;
    }

    public static void main(String[] args) {
        launch(args);
    }

    private void sendGet() throws Exception {

        HttpRequest request = HttpRequest.newBuilder()
                .GET()
                .uri(URI.create("http://findandtrade.herokuapp.com/annonces/all"))
                .header("Content-Type", "application/json")
                .header("x-access-token", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZWIwM2IxZGIzNWJkMzcxYmM2NDQxN2IiLCJ1c2VybmFtZSI6ImJlcm5hcmQiLCJwYXNzd29yZCI6IiQyYiQwNSQ1NXk4WmNtVDJobVNpSFpuSFNxelguM2kyZTRlYjVWS3RNUHd4aWpwZlo2RjJjQXkzUTJHMiIsImlhdCI6MTU5NDczMDQ1MiwiZXhwIjoxNTk0ODE2ODUyfQ.s3Zvr2NI2LXx95WQJiefjSq9C38s1MwL1XUe-NijYqw")
                .build();

        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

        // print status code
        System.out.println(response.statusCode());

        // print response body
        System.out.println(response.body());

    }

    private void sendPost() throws Exception {

        // form parameters
        Map<Object, Object> data = new HashMap<>();
        data.put("username", "abc");
        data.put("password", "123");
        data.put("custom", "secret");
        data.put("ts", System.currentTimeMillis());

        HttpRequest request = HttpRequest.newBuilder()
                .POST(buildFormDataFromMap(data))
                .uri(URI.create("https://httpbin.org/post"))
                .setHeader("User-Agent", "Java 11 HttpClient Bot") // add request header
                .header("Content-Type", "application/x-www-form-urlencoded")
                .build();

        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

        // print status code
        System.out.println(response.statusCode());

        // print response body
        System.out.println(response.body());

    }

    private static HttpRequest.BodyPublisher buildFormDataFromMap(Map<Object, Object> data) {
        var builder = new StringBuilder();
        for (Map.Entry<Object, Object> entry : data.entrySet()) {
            if (builder.length() > 0) {
                builder.append("&");
            }
            builder.append(URLEncoder.encode(entry.getKey().toString(), StandardCharsets.UTF_8));
            builder.append("=");
            builder.append(URLEncoder.encode(entry.getValue().toString(), StandardCharsets.UTF_8));
        }
        System.out.println(builder.toString());
        return HttpRequest.BodyPublishers.ofString(builder.toString());
    }

    private final HttpClient httpClient = HttpClient.newBuilder()
            .version(HttpClient.Version.HTTP_2)
            .build();
}
