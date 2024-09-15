from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import ForeignKey, Integer

from flask_app.models.base_model import Base

class Income_Has_Category(Base):
    __tablename__ = "income_has_category"
    income_id: Mapped[int] = mapped_column(ForeignKey('income.id'), primary_key=True)
    category_id: Mapped[int] = mapped_column(ForeignKey('category.id'), primary_key=True)