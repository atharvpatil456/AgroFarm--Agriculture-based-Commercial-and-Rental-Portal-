#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import cv2
import face_recognition
import mysql.connector
from datetime import datetime
from io import BytesIO
from PIL import Image
import numpy as np


known_faces_dir1 = r'missingPersonPic'
TOLERANCE = 0.6
FRAME_THICKNESS = 3
FONT_THICKNESS = 2
MODEL = "cnn"
location = "RCPIT"

conn = mysql.connector.connect(user='root', password='', host='127.0.0.1', port='3306', database='rentaldata')
cursor = conn.cursor()


known_faces = []
known_emails = []
known_passwords = []

select_query = "SELECT file, email, password FROM admininfo"
cursor.execute(select_query)
result = cursor.fetchall()

for row in result:
    image_blob, email, password = row
    try:
 
        image = Image.open(BytesIO(image_blob))
        image_np = np.array(image)
        encoding = face_recognition.face_encodings(image_np)[0]
        known_faces.append(encoding)
        known_emails.append(email)
        known_passwords.append(password)
    except Exception as e:
       
        print(f"Error processing image: {e}")
        continue

# Video capture
temp_email = "unknown"
video = cv2.VideoCapture(0)


harcascadePath = "C:\\Users\\athar\\anaconda3\\Lib\\site-packages\\cv2\\data\\haarcascade_frontalface_default.xml"

face_cascade = cv2.CascadeClassifier(harcascadePath)

while True:
    ret, img = video.read()

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)


    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=5)

    for (x, y, w, h) in faces:
        cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)

    locations = face_recognition.face_locations(img, number_of_times_to_upsample=0, model="cnn")
    encodings = face_recognition.face_encodings(img, locations)

    for face_encoding, face_location in zip(encodings, locations):
        results = face_recognition.compare_faces(known_faces, face_encoding, TOLERANCE)
        match_index = None
        if True in results:
            match_index = results.index(True)
            email = known_emails[match_index]
            password = known_passwords[match_index]
            cv2.rectangle(img, (face_location[3], face_location[0]), (face_location[1], face_location[2]), (0, 255, 0), 3)
            cv2.putText(img, f"Email: {email}\nPassword: {password}", (face_location[3] + 10, face_location[2] + 15),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)
            if temp_email != email:
                temp_email = email

    cv2.imshow('img', img)

    if cv2.waitKey(27) == ord('q'):
        break

video.release()
cv2.destroyAllWindows()


cursor.close()
conn.close()


# In[2]:


import cv2
import face_recognition
import mysql.connector
from datetime import datetime
from io import BytesIO
from PIL import Image
import numpy as np


KNOWN_FACES_DIRECTORY = r'missingPersonPic'
TOLERANCE = 0.6
FRAME_THICKNESS = 3
FONT_THICKNESS = 2
MODEL = "cnn"
LOCATION = "RCPIT"

DB_CONFIG = {
    'user': 'root',
    'password': '',
    'host': '127.0.0.1',
    'port': '3306',
    'database': 'rentaldata'
}


known_faces = []
known_emails = []
known_passwords = []

def load_known_faces(cursor):
    select_query = "SELECT file, email, password FROM admininfo"
    cursor.execute(select_query)
    result = cursor.fetchall()

    for row in result:
        image_blob, email, password = row
        try:
            image = Image.open(BytesIO(image_blob))
            image_np = np.array(image)
            encoding = face_recognition.face_encodings(image_np)[0]
            known_faces.append(encoding)
            known_emails.append(email)
            known_passwords.append(password)
        except Exception as e:
            print(f"Error processing image: {e}")
            continue

def main():
   
    temp_email = "unknown"
    video = cv2.VideoCapture(0)


    harcascadePath = "C:\\Users\\athar\\anaconda3\\Lib\\site-packages\\cv2\\data\\haarcascade_frontalface_default.xml"
    face_cascade = cv2.CascadeClassifier(harcascadePath)

  
    conn = mysql.connector.connect(**DB_CONFIG)
    cursor = conn.cursor()

    load_known_faces(cursor)

    while True:
        ret, img = video.read()

        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=5)

        for (x, y, w, h) in faces:
            cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)

        locations = face_recognition.face_locations(img, number_of_times_to_upsample=0, model="cnn")
        encodings = face_recognition.face_encodings(img, locations)

        for face_encoding, face_location in zip(encodings, locations):
            results = face_recognition.compare_faces(known_faces, face_encoding, TOLERANCE)
            match_index = None
            if True in results:
                match_index = results.index(True)
                email = known_emails[match_index]
                cv2.rectangle(img, (face_location[3], face_location[0]), (face_location[1], face_location[2]), (0, 255, 0), 3)
                cv2.putText(img, f"Email: {email}\nPassword: ***", (face_location[3] + 10, face_location[2] + 15),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)
                if temp_email != email:
                    temp_email = email

        cv2.imshow('img', img)

        if cv2.waitKey(27) == ord('q'):
            break

   
    video.release()
    cv2.destroyAllWindows()

 
    cursor.close()
    conn.close()

if __name__ == "__main__":
    main()


# In[2]:


get_ipython().system('pip install Flask')


# In[ ]:


from flask import Flask, render_template, request, redirect, url_for
import cv2
import face_recognition
import mysql.connector
from datetime import datetime
from io import BytesIO
from PIL import Image
import numpy as np

app = Flask(__name__)

# Constants
known_faces_dir1 = r'missingPersonPic'
TOLERANCE = 0.6
FRAME_THICKNESS = 3
FONT_THICKNESS = 2
MODEL = "cnn"
location = "RCPIT"

# Database connection using XAMPP
conn = mysql.connector.connect(user='root', password='', host='127.0.0.1', port='3306', database='rentaldata')
cursor = conn.cursor()

# Load known faces
known_faces = []
known_emails = []
known_passwords = []

# Retrieve images and associated data from the database
select_query = "SELECT file, email, password FROM admininfo"
cursor.execute(select_query)
result = cursor.fetchall()

for row in result:
    image_blob, email, password = row
    try:
        # Attempt to open the image
        image = Image.open(BytesIO(image_blob))
        image_np = np.array(image)
        encoding = face_recognition.face_encodings(image_np)[0]
        known_faces.append(encoding)
        known_emails.append(email)
        known_passwords.append(password)
    except Exception as e:
        # Handle the case where the image cannot be opened
        print(f"Error processing image: {e}")
        continue

# Video capture
temp_email = "unknown"
video = cv2.VideoCapture(0)

# Load the pre-trained face detector
harcascadePath = "C:\\Users\\athar\\anaconda3\\Lib\\site-packages\\cv2\\data\\haarcascade_frontalface_default.xml"
face_cascade = cv2.CascadeClassifier(harcascadePath)


@app.route('/')
def index():
    return render_template('index.jsp')


@app.route('/login', methods=['POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        # Check credentials against the database
        select_user_query = "SELECT * FROM admininfo WHERE email = %s AND password = %s"
        cursor.execute(select_user_query, (email, password))
        user = cursor.fetchone()

        if user:
            # Successful login
            return render_template('index.jsp', email=email)
        else:
            # Failed login
            return render_template('login.jsp', error='Invalid email or password')


@app.route('/video_feed')
def video_feed():
    return render_template('video_feed.html')


if __name__ == '__main__':
    app.run(debug=True)

# Release video capture and close windows
video.release()
cv2.destroyAllWindows()

# Close database connection
cursor.close()
conn.close()

