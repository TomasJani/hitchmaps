from typing import TYPE_CHECKING

from sqlalchemy import Boolean, Column, Enum, String
from sqlalchemy.orm import relationship

from hitchmaps import enums
from hitchmaps.db.base_class import Base

if TYPE_CHECKING:
    from .point import Point  # noqa: F401


class User(Base):
    name = Column(String, index=True)
    email = Column(String, unique=True, index=True, nullable=False)
    hashed_password = Column(String, nullable=False)
    is_active = Column(Boolean, default=True)
    is_superuser = Column(Boolean, default=False)
    status = Column(Enum(enums.Status), default=enums.Status.ACTIVE)

    points = relationship("Point", back_populates="user")
