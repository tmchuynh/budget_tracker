from flask import Blueprint, render_template, flash, request, redirect, url_for, current_app, send_file, Flask, jsonify
from flask_app import db, get_database_url
import matplotlib as mlp
import pandas as pd
import numpy as np
import xlsxwriter
import json
import re

bp = Blueprint('budget', __name__)

DATABASE_URL = f"mysql+pymysql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}/{os.getenv('DB_NAME')}"

engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)

@bp.route('/budget/add', methods=['GET', 'POST'])
def add_budget():
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/budget/view_all', methods=['GET', 'POST'])
def view_budgets():
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/budget/update/<int:id>', methods=['GET', 'POST'])
def update_budget(id):
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/budget/delete/<int:id>', methods=['GET', 'POST'])
def delete_budget(id):
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/budget/category/<string:category>', methods=['GET', 'POST'])
def view_category():
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/budget/expense/add', methods=['GET', 'POST'])
def add_expense():
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/budget/expenses/view_all', methods=['GET', 'POST'])
def view_expenses():
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/budget/expense/update/<int:id>', methods=['GET', 'POST'])
def update_expense():
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/budget/expense/delete/<int:id>', methods=['GET', 'POST'])
def delete_expense():
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/budget/search', methods=['GET', 'POST'])
def search():
    referer_url = request.headers.get('Referer')
    # Allow users to search for specific budgets or expenses
    
    
    return redirect(referer_url)