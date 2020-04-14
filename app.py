from flask import Flask, render_template, request, redirect, url_for, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_migrate import Migrate, MigrateCommand
from flask_script import Manager
from manage import Blogpost, Review, User
from flask_uploads import UploadSet, configure_uploads, IMAGES
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)

photos = UploadSet('photos', IMAGES)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////Users/jakobhoy/Desktop/Development/Python/musicblog/musicblog.db'
app.config['UPLOADED_PHOTOS_DEST'] = 'static/images'
app.config['SECRET_KEY'] = 'umamibanana'
configure_uploads(app, photos)

db = SQLAlchemy(app)
login_manager = LoginManager()
login_manager.init_app(app)

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

@app.route('/login', methods=['POST'])
def login():
    user = User.query.filter_by(username='Gatlingjakob').first()

    username = request.form['username']
    password = request.form['password']

    if user.username == username and check_password_hash(user.password, password):
        login_user(user)
        return redirect(url_for('admin'))  

    return redirect(url_for('adminlogin'))    

@app.route('/userauthenticated')
def userauthenticated():
    if current_user.is_authenticated:
         return True
    else:
         return False

@app.route('/adminlogin')
def adminlogin():
    return render_template('adminlogin.html')

@app.route('/adminlogout')
@login_required
def adminlogout():
    user = User.query.filter_by(username='Gatlingjakob').first()
    logout_user()
    return redirect(url_for('index'), code=302)

@app.route('/admin')
@login_required
def admin():
    return render_template('add.html')

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
@login_required
def add():
    return render_template('add.html')

@app.route('/addpost', methods=['POST'])
@login_required
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
@login_required
def addreview():
    return render_template('addreview.html')    

@app.route('/createreview', methods=['POST'])
@login_required
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
@login_required
def upload():
    if request.method == 'POST' and 'photo' in request.files:
        filename = photos.save(request.files['photo'])
        return render_template('addreview.html', filename=filename)
    return render_template('addreview.html')

@app.route('/archive')
def archive():
    reviews = Review.query.order_by(Review.date_posted.desc()).all()
    return render_template('archive.html', reviews=reviews)

if __name__ == '__main__':
    app.run(debug=True)