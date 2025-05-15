package com.example.firstloginscreen;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.view.View; // Importing View to handle UI components
import android.widget.Button; // Importing Button for button UI elements
import android.widget.TextView; // Importing TextView for text UI elements
import android.widget.Toast; // Importing Toast for displaying short messages

public class RegisterViewActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState); // Call the superclasses onCreate method
        setContentView(R.layout.register_view); // Set the layout for this activity

        // Find the TextView for the login link and the Register button
        TextView loginLink = findViewById(R.id.login_link);
        Button registerButton = findViewById(R.id.register_button);

        // Set an OnClickListener for the login link
        loginLink.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Create an Intent to navigate back to the MainActivity
                Intent intent = new Intent(RegisterViewActivity.this, MainActivity.class);
                startActivity(intent); // Start the login activity
            }
        });

        // Set an OnClickListener for the Register button
        registerButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Display a Toast message when the Register button is clicked
                Toast.makeText(RegisterViewActivity.this, "User clicked on register", Toast.LENGTH_SHORT).show();
            }
        });


    }
}