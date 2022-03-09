from typing import Any, List

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from starlette import status

from hitchmaps import crud, models, schemas
from hitchmaps.api import deps

router = APIRouter()


@router.get("/", response_model=List[schemas.Point])
def read_points(
    db: Session = Depends(deps.get_db),
    skip: int = 0,
    limit: int = 100,
) -> Any:
    """
    Retrieve points.
    """
    points = crud.point.get_multi(db, skip=skip, limit=limit)
    return points


@router.post("/next-to", response_model=List[schemas.Point])
def read_points_closes_to_coordinates(
    *, db: Session = Depends(deps.get_db), coords_distance: schemas.CoordinatesDistance
) -> Any:
    """
    Retrieve points.
    """
    points = crud.point.get_points_next_to_coordinates(
        db, coordinates=coords_distance.coordinates, distance=coords_distance.distance
    )
    return points


@router.post("/", response_model=schemas.Point)
def create_point(
    *,
    db: Session = Depends(deps.get_db),
    point_in: schemas.PointCreate,
    current_user: models.User = Depends(deps.get_current_active_user),
) -> Any:
    """
    Create new point.
    """
    point = crud.point.create(db=db, obj_in=point_in)
    return point


@router.put("/{id}", response_model=schemas.Point)
def update_point(
    *,
    db: Session = Depends(deps.get_db),
    id: int,
    point_in: schemas.PointUpdate,
) -> Any:
    """
    Update an point.
    """
    point = crud.point.get(db=db, id=id)
    if not point:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Point not found"
        )
    point = crud.point.update(db=db, db_obj=point, obj_in=point_in)
    return point


@router.get("/{id}", response_model=schemas.Point)
def read_point(
    *,
    db: Session = Depends(deps.get_db),
    id: int,
) -> Any:
    """
    Get point by ID.
    """
    point = crud.point.get(db=db, id=id)
    if not point:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Point not found"
        )
    return point


@router.delete("/{id}", response_model=schemas.Point)
def delete_point(
    *,
    db: Session = Depends(deps.get_db),
    id: int,
    current_user: models.User = Depends(deps.get_current_active_user),
) -> Any:
    """
    Delete an point.
    """
    point = crud.point.get(db=db, id=id)
    if not point:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Point not found"
        )
    if not crud.user.is_superuser(current_user):
        raise HTTPException(status_code=400, detail="Not enough permissions")
    point = crud.point.remove(db=db, id=id)
    return point
