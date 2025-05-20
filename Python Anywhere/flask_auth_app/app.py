from flask import Flask, render_template, request, redirect, url_for, flash
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash, check_password_hash
import MySQLdb.cursors

app = Flask(__name__, template_folder='templates')
app.secret_key = 'your_secret_key'

# MySQL Configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'flask_auth'

mysql = MySQL(app)

# Login Manager Setup
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'

class User(UserMixin):
    def __init__(self, id, username):
        self.id = id
        self.username = username

    def get_id(self):
        return str(self.id)

@login_manager.user_loader
def load_user(user_id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM users WHERE id = %s", (user_id,))
    user = cursor.fetchone()
    if user:
        return User(user['id'], user['username'])
    return None

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        confirm = request.form['confirm_password']

        if password != confirm:
            flash('Passwords do not match', 'danger')
            return redirect(url_for('signup'))

        hashed_password = generate_password_hash(password, method='pbkdf2:sha256')

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute("SELECT * FROM users WHERE username = %s OR email = %s", (username, email))
        if cursor.fetchone():
            flash('Username or email already exists', 'danger')
            return redirect(url_for('signup'))

        cursor.execute("INSERT INTO users (username, email, password) VALUES (%s, %s, %s)",
                       (username, email, hashed_password))
        mysql.connection.commit()
        flash('Account created successfully', 'success')
        return redirect(url_for('login'))

    return render_template('signup.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
        user = cursor.fetchone()

        if user and check_password_hash(user['password'], password):
            login_user(User(user['id'], user['username']))
            flash('Logged in successfully', 'success')
            return redirect(url_for('dashboard'))
        else:
            flash('Invalid credentials', 'danger')

    return render_template('login.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash('Logged out successfully', 'success')
    return redirect(url_for('login'))

@app.route('/dashboard')
@login_required
def dashboard():
    stats = {
        'total_published': 10,
        'recent_views': 5,
        'saved_theses': 3
    }
    recent_theses = [
        {'id': 1, 'title': 'AI in Medicine', 'authors': 'John Doe', 'school': 'ABC University', 'year_made': 2022},
        {'id': 2, 'title': 'Climate Change Impact', 'authors': 'Jane Smith', 'school': 'XYZ College', 'year_made': 2023}
    ]
    return render_template('dashboard.html', stats=stats, recent_theses=recent_theses)

@app.route('/search', methods=['GET', 'POST'])
@login_required
def search():
    if request.method == 'POST':
        query = request.form.get('query')
        flash(f'Searching for "{query}"...', 'info')
    return render_template('search.html')

# Dummy route handlers for referenced URLs
@app.route('/profile_settings')
@login_required
def profile_settings():
    return "Profile settings page"

@app.route('/browse_theses')
@login_required
def browse_theses():
    return "Browse theses page"

@app.route('/view_history')
@login_required
def view_history():
    return "View history page"

@app.route('/view_bookmarks')
@login_required
def view_bookmarks():
    return "Bookmarks page"

@app.route('/view_thesis/<int:thesis_id>')
@login_required
def view_thesis(thesis_id):
    return f"Viewing thesis {thesis_id}"

if __name__ == '__main__':
    app.run(debug=True)
