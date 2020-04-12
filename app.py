from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_migrate import Migrate, MigrateCommand
from flask_script import Manager
from manage import Blogpost, Review, User, Role, user_datastore
from flask_uploads import UploadSet, configure_uploads, IMAGES
from flask_security import Security, SQLAlchemyUserDatastore, login_required
from flask_security.utils import hash_password

app = Flask(__name__)

photos = UploadSet('photos', IMAGES)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////Users/jakobhoy/Desktop/Development/Python/musicblog/musicblog.db'
app.config['UPLOADED_PHOTOS_DEST'] = 'static/images'
app.config['SECRET_KEY'] = 'thisisasecret'

configure_uploads(app, photos)

db = SQLAlchemy(app)

@app.route('/')
def index():
    posts = Blogpost.query.order_by(Blogpost.date_posted.desc()).all()
    return render_template('index.html', posts=posts)

@app.route('/reviews')
def reviews():
    reviews = Review.query.order_by(Review.date_posted.desc()).all()
    return render_template('reviews.html', reviews=reviews)

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/post/<int:post_id>')
def post(post_id):
    post = Blogpost.query.filter_by(id=post_id).one()

    return render_template('post.html', post=post)

@app.route('/review/<int:review_id>')
def review(review_id):
    review = Review.query.filter_by(id=review_id).one()

    return render_template('review.html', review=review)

@app.route('/contact')
def contact():
    return render_template('contact.html')

@app.route('/add')
def add():
    return render_template('add.html')

@app.route('/addpost', methods=['POST'])
def addpost():
    title = request.form['title']
    subtitle = request.form['subtitle']
    author = request.form['author']
    content = request.form['content']

    post = Blogpost(title=title, subtitle=subtitle, author=author, content=content, date_posted=datetime.now())

    db.session.add(post)
    db.session.commit()
    return redirect(url_for('index'))

@app.route('/addreview')
def addreview():
    return render_template('addreview.html')    

@app.route('/createreview', methods=['POST'])
def createreview():
    subtitle = request.form['subtitle']
    author = request.form['author']
    content = request.form['content']
    score = request.form['score']
    artist = request.form['artist']
    release_title = request.form['release_title']
    art_filename = request.form['art_filename']
    
    title= artist + ' - ' + release_title
    review = Review(title=title, subtitle=subtitle, author=author, content=content, date_posted=datetime.now(), score=score, art_filename=art_filename, artist=artist, release_title=release_title)

    db.session.add(review)
    db.session.commit()
    return redirect(url_for('reviews'))

@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST' and 'photo' in request.files:
        filename = photos.save(request.files['photo'])
        return filename
    return render_template('upload.html')

@app.route('/register', methods=['POST', 'GET'])
def register():
    if request.method == 'POST':
        user_datastore.create_user(
            email=request.form.get('email'),
            password=hash_password(request.form.get('password'))
        )
        db.session.commit()

        return redirect(url_for('profile'))

    return render_template('register.html')

@app.route('/profile')
@login_required
def profile():
    return render_template('profile.html')

if __name__ == '__main__':
    app.run(debug=True)