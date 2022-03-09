import math
from typing import List

from requests import Session

from hitchmaps.crud.base import CRUDBase
from hitchmaps.models import Point
from hitchmaps.schemas.point import Coordinates, PointCreate, PointUpdate


class CRUDPoint(CRUDBase[Point, PointCreate, PointUpdate]):
    def get_points_next_to_coordinates(
        self, db: Session, *, coordinates: Coordinates, distance: float
    ) -> List[Point]:
        points = db.query(self.model).filter(
            self.get_distance_from_coordinates(coordinates) < distance
        )
        return points

    def get_distance_from_coordinates(self, coordinates):
        return math.hypot(
            self.model.longitude - coordinates.longitude,
            self.model.latitude - coordinates.latitude,
        )


point = CRUDPoint(Point)
