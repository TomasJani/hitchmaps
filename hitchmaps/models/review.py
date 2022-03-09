from typing import TYPE_CHECKING

from sqlalchemy import Column, Enum, ForeignKey, Integer, Text
from sqlalchemy.orm import relationship

from hitchmaps import enums
from hitchmaps.db.base_class import Base

if TYPE_CHECKING:
    from .point import Point  # noqa: F401


class Review(Base):
    waiting_time_minutes = Column(Integer, default=None)
    description = Column(Text, default=None)
    status = Column(Enum(enums.Status), default=enums.Status.ACTIVE)

    point_id = Column(Integer, ForeignKey("point.id"))
    point = relationship("Point", back_populates="reviews")
