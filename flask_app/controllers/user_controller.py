from flask import Blueprint, render_template, flash, request, redirect, url_for, current_app, send_file, Flask, jsonify
from flask_app import db, get_database_url
import matplotlib as mlp
import pandas as pd
import numpy as np
import xlsxwriter
import json
import re

bp = Blueprint('user', __name__)

DATABASE_URL = f"mysql+pymysql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}/{os.getenv('DB_NAME')}"

engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)

@bp.route('/user/register', methods=['GET', 'POST'])
def register():
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/user/login', methods=['GET', 'POST'])
def login():
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/user/profile/update', methods=['GET', 'POST'])
def profile_update():
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)

@bp.route('/user/password/update', methods=['GET', 'POST'])
def password_update():
    referer_url = request.headers.get('Referer')
    
    
    return redirect(referer_url)