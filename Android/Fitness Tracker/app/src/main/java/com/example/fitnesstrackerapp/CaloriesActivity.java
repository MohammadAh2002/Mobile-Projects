package com.example.fitnesstrackerapp;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class CaloriesActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calories);

        TextView CaloriesBurned = findViewById(R.id.calories_burned);

        EditText AgeInput = findViewById(R.id.age_input);
        EditText WeightInput = findViewById(R.id.weight_input);

        Button CalculateButton = findViewById(R.id.calculate_button);
        Button BackButton = findViewById(R.id.back_button);

        CalculateButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(WeightInput.getText().toString().isEmpty()){

                    Toast.makeText(CaloriesActivity.this, "enter Weight", Toast.LENGTH_SHORT).show();

                }
                else if(AgeInput.getText().toString().isEmpty()){

                    Toast.makeText(CaloriesActivity.this, "enter Age", Toast.LENGTH_SHORT).show();

                }
                else{

                    int steps = getIntent().getIntExtra("steps", 0);
                    int Age = Integer.parseInt(AgeInput.getText().toString().trim());
                    int Weight = Integer.parseInt(WeightInput.getText().toString().trim());

                    double Calories = calculateCalories(Age, Weight, steps);

                    CaloriesBurned.setText("Calories Burned: " + Math.round(Calories));

                }

            }
        });

        BackButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                finish();

            }
        });

    }

    private double calculateCalories(int weight, int age, int steps) {

        // MET value for walking at moderate speed (e.g., 3.5 METs)
        double met = 3.5;

        // Average step length in miles (e.g., 2,000 steps per mile)
        double stepsPerMile = 2000;

        // Convert steps to miles
        double miles = steps / stepsPerMile;

        // Adjust the MET value based on age (example adjustment, you can refine this)
        double ageFactor = 1 - (age - 20) * 0.001;

        // Calories burned per mile = METs * weight (lbs) * miles * ageFactor
        double caloriesPerMile = met * weight * miles * ageFactor;

        return caloriesPerMile;

    }

}