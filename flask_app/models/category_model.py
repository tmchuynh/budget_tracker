from sqlalchemy.orm import Mapped, mapped_column, relationship, foreign
from sqlalchemy import String, DateTime, func, Time, JSON
from flask_app.models.base_model import Base

class Category(Base):
    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column(String(45), nullable=False)
    filter: Mapped[dict] = mapped_column(JSON, nullable=True)
    date_created: Mapped[DateTime] = mapped_column(DateTime, server_default=func.now(), nullable=False)
    date_updated: Mapped[DateTime] = mapped_column(DateTime, server_default=func.now(), onupdate=func.now(), nullable=False)