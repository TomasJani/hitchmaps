from datetime import datetime
from typing import Optional

from pydantic import BaseModel

# Shared properties
from hitchmaps import enums


class ReviewBase(BaseModel):
    description: Optional[str] = None
    rating: Optional[float] = None
    waiting_time: Optional[int] = None


# Properties to receive on item creation
class ReviewCreate(ReviewBase):
    pass


# Properties to receive on item update
class ReviewUpdate(ReviewBase):
    pass


# Properties shared by models stored in DB
class ReviewInDBBase(ReviewBase):
    id: int
    created_at: datetime

    class Config:
        orm_mode = True


# Properties to return to client
class Review(ReviewInDBBase):
    pass


# Properties stored in DB
class ReviewInDB(ReviewInDBBase):
    modified_at: datetime
    status: enums.Status = enums.Status.ACTIVE
