# Hackccelerate Hackathon | Team New_Year

### This is the repository for Hackccelerate Hackathon for problem statement 'Learning App' by team New_Year

#### The project provides a unique way for students to gain knowledge by interacting with their fellow students. The students can interact with other students' posts, help students in solving any problems or ask questions. Teachers can monitor the forum and can answer students' questions and can even create knowledge sharing posts. Parents can monitor the child's progress by viewing attendance, marks and other student's activities. To sum it all up, the project provides a common ground for students, teachers and parents to coherently make equal contributions in the progress of the student. 

 ## Video Link
 [Please refer to this YouTube link](https://youtu.be/-xZzE0P3Go0)


 ## Demo Link
 [Please refer to this demo link](http://learnitapp.pythonanywhere.com/)


## Instructions
#### Create Virtual Environment
```sh
python -m venv venv
```

#### Activate virtual environment

```sh
source venv/Scripts/activate  - For linux
venv\Scripts\activate - For Windows CMD
```

#### Install dependencies

```sh
pip install -r requirements.txt
```

#### Create a new database in phpmyadmin named 'learning_app' and enter the database. Then import learning_app_final.sql.

#### Make migrations inside projects folder and then run server

```sh
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```



