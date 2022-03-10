from datetime import datetime
from typing import Optional

from pydantic import BaseModel, EmailStr

# Shared properties
from hitchmaps import enums


class UserBase(BaseModel):
    email: Optional[EmailStr] = None
    name: Optional[str] = None


# Properties to receive via API on creation
class UserCreate(UserBase):
    email: EmailStr
    password: str


# Properties to receive via API on update
class UserUpdate(UserBase):
    password: Optional[str] = None


class UserInDBBase(UserBase):
    id: Optional[int] = None
    created_at: datetime

    class Config:
        orm_mode = True


# Additional properties to return via API
class User(UserInDBBase):
    pass


# Additional properties stored in DB
class UserInDB(UserInDBBase):
    is_superuser: bool = False
    hashed_password: str
    modified_at: datetime
    status: enums.Status = enums.Status.ACTIVE
