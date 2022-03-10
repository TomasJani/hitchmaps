from typing import Iterable

from sqlalchemy.orm import Session

from hitchmaps import schemas
from hitchmaps.crud.base import CRUDBase
from hitchmaps.models import Review


class CRUDReview(CRUDBase[Review, schemas.PointCreate, schemas.PointUpdate]):
    def get_user_reviews(self, db: Session, *, user_id: int) -> Iterable[Review]:
        reviews = db.query(self.model).filter(self.model.user.id == user_id).all()
        return reviews


review = CRUDReview(Review)
