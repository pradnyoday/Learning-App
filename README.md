# hackccelerate_new_year

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

#### Create a new database in phpmyadmin and enter the database. Then import pharmarket_portal.sql

#### Make migrations inside projects folder and then run server

```sh
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```
