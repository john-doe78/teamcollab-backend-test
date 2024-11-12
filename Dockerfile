# Use a lightweight Python 3.12 image
FROM python:3.12-slim

# Set the working directory
WORKDIR /src

# Install pipenv
RUN pip install pipenv

# Copy only the Pipfile and Pipfile.lock for better caching
COPY Pipfile Pipfile.lock ./

# Install dependencies using pipenv
RUN pipenv install --deploy --ignore-pipfile

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 8000

# Command to run the application
CMD ["pipenv", "run", "python", "./projectile/manage.py", "runserver", "0.0.0.0:8000"]
