from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand
from flask_login import UserMixin


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////Users/jakobhoy/Desktop/Development/Python/musicblog/musicblog.db'

db = SQLAlchemy(app)
migrate = Migrate(app, db)

manager = Manager(app)
manager.add_command('db', MigrateCommand)

# Models

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50), unique=True)
    password = db.Column(db.String(50))

class Blogpost(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(200))
    subtitle = db.Column(db.String(200))
    author = db.Column(db.String(50))
    date_posted = db.Column(db.DateTime)
    content = db.Column(db.Text)

class Review(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(200))
    subtitle = db.Column(db.String(50))
    author = db.Column(db.String(50))
    date_posted = db.Column(db.DateTime)
    content = db.Column(db.Text)
    score = db.Column(db.String(50))
    artist = db.Column(db.String(200))
    release_title = db.Column(db.String(200))
    art_filename = db.Column(db.String(500))
    # album animation background on review page
    # Read article link on cards
    # post+review-header background 
    # make automatic blogpost whenever a review is released
    # edit review/post
    # pagination
    # tags
    # searching and sorting (archive and maybe reviews+blog)
    # about section with links to my music and art (maybe integrated music player and photo album)
    

if __name__ == '__main__':
    manager.run()