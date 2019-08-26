package com.tmuintentionalrelationships;

import java.net.URL;

import javafx.scene.input.KeyCode;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.Pane;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;
import javafx.stage.Stage;

import java.net.URISyntaxException;

public class DesktopTMUIR extends Application{
	public void start(Stage stage) throws InterruptedException, URISyntaxException {
		Pane pane = new Pane();
		
		
		WebView webView = new WebView();
		webView.getEngine().load("http://127.0.0.1:8080/Intentional_Relationships");
		stage.setTitle("Web Map");
		Scene scene = new Scene(pane, 1600, 984);
		stage.setScene(scene);
		stage.show();
		System.out.println("Running....");
				
		pane.getChildren().addAll(webView);
		
		webView.prefWidthProperty().bind(scene.widthProperty());
		webView.prefHeightProperty().bind(scene.heightProperty());
	}
}
