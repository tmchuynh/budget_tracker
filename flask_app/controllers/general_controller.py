from flask import Blueprint, render_template

bp = Blueprint('general', __name__)

@bp.route('/')
def index():
    return render_template('login.html')

@bp.route('/profile')
def profile():
    return render_template('profile.html')

@bp.route('/budget')
def budget():
    return render_template('budget.html')

@bp.route('/reports')
def reports():
    return render_template('reports.html')

@bp.route('/resources')
def resources():
    return render_template('resources.html')