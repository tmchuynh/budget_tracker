from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import String, DateTime, func
from flask_app.models.base_model import Base
from flask_app.models.user_model import User

class Expense(Base):
    