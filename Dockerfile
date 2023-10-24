"""

Hello CMA DaTA Unit hiring team,

Due to schedule conflicts, time did not allow for me to fully realise the application.
However, I am happy to share my list of next steps I’d be eager to take

1. Define the structure of web app with Docker:

    - Create a Dockerfile to build image.
    - Specify the base image (Python) and required dependencies.
    - Copy web app code and CSV data into the Docker image.
    - Expose a port for the web app to run.

2. Write the web app code:

    - Use Flask to handle HTTP requests.
    - Create routes for handling user input and responding with data.
    - Read the CSV file into memory upon app startup.

3. Create a form for user input:

    - Create an HTML form with input fields for "Company Number" and "DOB."

    example: https://codepen.io/mkh7878/pen/RwvNvgx

    - Use HTML and JavaScript to restrict input length (8 digits for Company Number, 6 digits for DOB).
    - Potentiall add other search fields, or a menu to scroll through names.
    - Submit the form data to the appropriate route in your app.

4. Implement the search functionality:

    - Receive the input data in app route.
    - Validate the input data to ensure it meets the required format.
    - Search the CSV data for a matching record based on Company Number and/or DOB.
    - Retrieve the person's name and address from the dataset.

5. Display the result:

    - Render a response page that displays the person's name and address.
    - If no match is found, handle the case with an appropriate message.

6. Ensure data scalability:

    - If the dataset grows larger, it would make more sense to transfer it to a SQLite database for better
    performance and querying capabilities.

7. Implement security (important):

    - Ensure that web app is secure, including input validation and database security measures.


I appreciate your time and consideration and hope to speak further.

"""



# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Copy the data.csv file into the container
COPY data.csv .

# Copy application code and dependencies
COPY app.py .
COPY requirements.txt .
COPY data.csv .

# Copy HTML templates
COPY templates /app/templates/

# Copy CSS files
COPY static /app/static/

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt flask

# Define the command to run your application
CMD ["python", "app.py"]
