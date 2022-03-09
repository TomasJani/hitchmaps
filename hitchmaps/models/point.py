from typing import TYPE_CHECKING

from sqlalchemy import (
    Column,
    Enum,
    Float,
    ForeignKey,
    Index,
    Integer,
    Text,
    UniqueConstraint,
)
from sqlalchemy.orm import relationship

from hitchmaps import enums
from hitchmaps.db.base_class import Base

if TYPE_CHECKING:
    from .review import Review  # noqa: F401
    from .user import User  # noqa: F401


class Point(Base):
    country = Column(Text, nullable=False)
    latitude = Column(Float, nullable=False)
    longitude = Column(Float, nullable=False)
    description = Column(Text, default=None)
    status = Column(Enum(enums.Status), default=enums.Status.ACTIVE)

    user_id = Column(Integer, ForeignKey("user.id"))
    user = relationship("User", back_populates="points")
    reviews = relationship("Review", back_populates="review")

    __table_args__ = (UniqueConstraint("latitude", "longitude"),)


Index("ix_point_latitude_longitude", Point.latitude, Point.longitude)
