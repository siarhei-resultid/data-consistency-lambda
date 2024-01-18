FROM public.ecr.aws/lambda/python:3.9.2023.01.11.07

# Copy function code
COPY app.py ${LAMBDA_TASK_ROOT}

# Install the function's dependencies using file requirements.txt
# from your project folder.

COPY app.py requirements.txt  ./
RUN pip3 install --upgrade pip setuptools
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

COPY . .

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "app.handler" ]