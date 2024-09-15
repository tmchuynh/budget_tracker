from flask import Blueprint, render_template, flash, request, redirect, url_for, current_app, send_file, Flask, jsonify
from flask_app import db, get_database_url
import matplotlib as mlp
import pandas as pd
import numpy as np
import xlsxwriter
import json
import re

bp = Blueprint('report', __name__)

DATABASE_URL = f"mysql+pymysql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}/{os.getenv('DB_NAME')}"

engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)

@bp.route('/report/monthly/<int:year>/<int:month>', methods=['GET', 'POST'])
def monthly_spending_report():
    referer_url = request.headers.get('Referer')
    # Total spending per category, comparison with budgeted amounts, and trends over the months
    
    
    return redirect(referer_url)

@bp.route('/report/yearly/<int:year>', methods=['GET', 'POST'])
def yearly_spending_summary():
    referer_url = request.headers.get('Referer')
    # Total spending by category, yearly budget vs. actual spending, trends throughout the year
    
    
    return redirect(referer_url)

@bp.route('/report/trends', methods=['GET', 'POST'])
def expense_trends():
    referer_url = request.headers.get('Referer')
    # Visualize trends in spending over time (e.g., monthly or quarterly)
    # Graphs or charts
    
    
    return redirect(referer_url)

@bp.route('/report/budget-vs-actual', methods=['GET', 'POST'])
def budget_vs_actual():
    referer_url = request.headers.get('Referer')
    # Compare budgeted amounts with actual spending for each category
    # Side-by-side comparison of budgeted vs. actual spending
    
    return redirect(referer_url)

@bp.route('/report/savings', methods=['GET', 'POST'])
def savings_report():
    referer_url = request.headers.get('Referer')
    # Track savings or surplus amounts, if any
    # Total savings, savings goals, and progress towards goals
    
    
    return redirect(referer_url)

@bp.route('/report/debt', methods=['GET', 'POST'])
def debt_report():
    referer_url = request.headers.get('Referer')
    # Track outstanding debts and repayment progress
    # Total debt, debt by category, repayment progress, and interest
    
    return redirect(referer_url)

@bp.route('/report/expense-categorization', methods=['GET', 'POST'])
def expense_categorization():
    referer_url = request.headers.get('Referer')
    # Analyze expenses by categories to see where money is being spent
    # Breakdown of expenses by different categories with percentages
    
    
    return redirect(referer_url)