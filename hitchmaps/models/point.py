from sqlalchemy import Column, DateTime, Float, Index, Integer, Text, UniqueConstraint

from hitchmaps.db.base_class import Base


class Point(Base):
    id = Column(Integer, primary_key=True, index=True)
    country = Column(Text)
    latitude = Column(Float)
    longitude = Column(Float)
    created = Column(DateTime, index=True)

    __table_args__ = (UniqueConstraint("latitude", "longitude"),)


Index("ix_point_latitude_longitude", Point.latitude, Point.longitude)
