# hackccelerate_new_year
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
