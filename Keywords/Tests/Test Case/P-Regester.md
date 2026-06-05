https://practice.expandtesting.com/test-cases/register 
https://practice.expandtesting.com/register

Register Automation Test Cases

//Test Case 1: Successful Registration (Happy Path)
Launch the browser.
Navigate to the Register page URL (/register).
Enter a valid Username.
Enter a valid Password.
Confirm the Password by re-entering it correctly.
Click the Register button.
Verify that the user is redirected to the Login page (/login).
Confirm that the success message "Successfully registered, you can log in now." is displayed.

// Test Case 2: Registration with Missing Username
Launch the browser.
Navigate to the Register page URL (/register).
Leave the Username field blank.
Enter a valid Password.
Confirm the Password by re-entering it.
Click the Register button.
Verify that an error message "All fields are required." is displayed.

//Test Case 3: Registration with Missing Password
Launch the browser.
Navigate to the Register page URL (/register).
Enter a valid Username.
Leave the Password field blank.
Confirm the Password by entering any value.
Click the Register button.
Verify that an error message "All fields are required." is displayed.

//Test Case 4: Registration with Non-matching Passwords
Launch the browser.
Navigate to the Register page URL (/register).
Enter a valid Username.
Enter a valid Password.
Confirm the Password by entering a different value.
Click the Register button.
Verify that an error message "Passwords do not match." is displayed.



