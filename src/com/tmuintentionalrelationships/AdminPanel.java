package com.tmuintentionalrelationships;

import java.net.URISyntaxException;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Pane;
import javafx.scene.shape.Circle;
import javafx.scene.shape.QuadCurve;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;

import com.tmuintentionalrelationships.Tree24;

import com.sun.prism.paint.Color;

public class AdminPanel extends Application{
	public static void main(String[] args){
		launch();
	}
	public void start(Stage stage) throws InterruptedException, URISyntaxException {
		Pane pane = new Pane();
		stage.setTitle("Admin Panel");
		Scene scene = new Scene(pane, 1500, 800);
		scene.getStylesheets().add(getClass().getResource("style.css").toExternalForm());
		
		try{
	      Class.forName("com.mysql.jdbc.Driver");

          Connection myConn = null;

          myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tmuir", "root", null);
          Statement mySts = myConn.createStatement();
          //SELECT COUNT(DATE(`DateJoined`)) FROM `userdata` GROUP BY `DateJoined` DESC LIMIT 5

          ResultSet myRes = mySts.executeQuery("SELECT COUNT(`userID`) FROM `userData`");
          
          if(myRes.next()){
          	Text users = new Text();
        	users = new Text(myRes.getString(1));
        	//System.out.println(myRes.getString(1));
        	users.setId("fancytext");
        	pane.getChildren().add(users);
        	users.setX(scene.getWidth() / 2);
        	users.setY(scene.getHeight() / 2);
          }
          
          myRes = mySts.executeQuery("SELECT COUNT(*) FROM `userdata` GROUP BY `DateJoined` ASC LIMIT 5");
          
          //myRes = mySts.executeQuery("SELECT COUNT(*) as quantity FROM `userdata` GROUP BY `DateJoined` ASC LIMIT 5;"
	      //    		+ "SELECT `DateJoined` as date FROM `userdata` GROUP BY `DateJoined` ASC LIMIT 5;");
          
          int i = 1;
          myRes.beforeFirst();
          myRes.next();

      	  //System.out.println(myRes.getString(1));
      	  
          
          while(myRes.getString(1) != null){
	        //QuadCurve quadCurve = new QuadCurve(i*200, last, (i*200 + 10), last, (i*200 + 20), Integer.parseInt(myRes.getString(1)));
	        Rectangle data = new Rectangle(20, myRes.getInt(1) * 10);
	        pane.getChildren().add(data);
	        data.setFill(javafx.scene.paint.Color.CORNFLOWERBLUE);
	        data.setStroke(javafx.scene.paint.Color.BLANCHEDALMOND);
        	data.setY((scene.getHeight() / 2 - myRes.getInt(1) * 10));
        	data.setX(scene.getWidth() / 2 - i++ * 20);
        	Text dataText = new Text();
        	
        	//System.out.println(myRes.getInt(1));
        	//last = Integer.parseInt(myRes.getString(1));
        	if(!myRes.next()){
        		break;
        	}
          }
        }
        catch(Exception ex){
          ex.printStackTrace();
        }
		
		Tree24 bush = new Tree24();
		bush.insert(1);
		bush.insert(2);
		bush.insert(3);
		bush.insert(4);
		
		ArrayList<Object> test = bush.path(4);
		System.out.print("2-4 Tree contents: ");
		bush.preorder();
		
		stage.setScene(scene);
		stage.show();
		
	}
}
