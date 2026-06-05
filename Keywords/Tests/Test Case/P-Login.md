Login Automation Test Cases
// Test Case 1: Successful Login
Launch the browser.
Navigate to the login page URL.
Verify that the login page is displayed successfully.
Enter Username: practice.
Enter Password: SuperSecretPassword!.
Click the Login button.
Verify that the user is redirected to the /secure page.
Confirm the success message "You logged into a secure area!" is visible.
Verify that a Logout button is displayed.

// Test Case 2: Invalid Username
Launch the browser.
Navigate to the login page URL.
Verify that the login page is displayed successfully.
Enter an incorrect Username (e.g., wrongUser).
Enter Password: SuperSecretPassword!.
Click the Login button.
Verify that an error message "Invalid username." is displayed.
Ensure the user remains on the login page.

// Test Case 3: Invalid Password
Launch the browser.
Navigate to the login page URL.
Verify that the login page is displayed successfully.
Enter Username: practice.
Enter an incorrect Password (e.g., WrongPassword).
Click the Login button.
Verify that an error message "Invalid password." is displayed.
Ensure the user remains on the login page.

Practice Test Automation WebSite for Web UI and Rest API
Version: e64cd80e | Copyright Expand Testing 2026

