package com.example.leveraginggeminiaiinandroidstudio;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Get references to the UI elements
        EditText userInput = findViewById(R.id.user_input);
        Button actionButton = findViewById(R.id.action_button);
        TextView resultText = findViewById(R.id.result_text);

        // Set an onClickListener for the actionButton
        actionButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Get the text from the userInput EditText
                String text = userInput.getText().toString();

                // Count the words in the text
                int wordCount = countWords(text);

                // Display the word count in the resultText TextView
                resultText.setText("Word Count: " + wordCount);
            }
        });
    }

    // Method to count the words in a string
    private int countWords(String text) {
        if (text == null || text.trim().isEmpty()) {
            return 0;
        }

        // Split the string into words using whitespace as the delimiter
        String[] words = text.trim().split("\\s+");

        // Return the number of words
        return words.length;
    }
}