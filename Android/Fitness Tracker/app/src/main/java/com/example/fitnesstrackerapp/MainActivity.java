package com.example.fitnesstrackerapp;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent; // Importing Intent for navigation between activities
import android.view.View; // Importing View to handle UI components
import android.widget.Button; // Importing Button for button UI elements
import android.widget.EditText;
import android.widget.TextView; // Importing TextView for text UI elements
import android.widget.Toast; // Importing Toast for displaying short messages

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EditText StepsInput = findViewById(R.id.steps_input);
        Button CalculateCaloriesButton = findViewById(R.id.calculate_calories_button);

        CalculateCaloriesButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(StepsInput.getText().toString().isEmpty()){

                    Toast.makeText(MainActivity.this, "enter steps", Toast.LENGTH_SHORT).show();

                }
                else if(Integer.parseInt(StepsInput.getText().toString().trim()) <= 0){

                    Toast.makeText(MainActivity.this, "Steps Can't be Zero", Toast.LENGTH_SHORT).show();

                }
                else{

                    Intent intent = new Intent(MainActivity.this, CaloriesActivity.class);

                    intent.putExtra("steps", Integer.parseInt(StepsInput.getText().toString().trim()));

                    startActivity(intent);

                }

            }
        });


    }
}