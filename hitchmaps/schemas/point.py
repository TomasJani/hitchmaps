from datetime import datetime

from pydantic import BaseModel

# Shared properties
from hitchmaps import enums


class PointBase(BaseModel):
    country: str
    longitude: float
    latitude: float


# Properties to receive on item creation
class PointCreate(PointBase):
    pass


# Properties to receive on item update
class PointUpdate(PointBase):
    pass


# Properties shared by models stored in DB
class PointInDBBase(PointBase):
    id: int
    created_at: datetime

    class Config:
        orm_mode = True


# Properties to return to client
class Point(PointInDBBase):
    pass


# Properties stored in DB
class PointInDB(PointInDBBase):
    modified_at: datetime
    status: enums.Status = enums.Status.ACTIVE


class Coordinates(BaseModel):
    longitude: float
    latitude: float


class CoordinatesDistance(BaseModel):
    coordinates: Coordinates
    distance: float
