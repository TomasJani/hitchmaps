# Import all the models, so that Base has them before being
# imported by Alembic
from hitchmaps.db.base_class import Base  # noqa
from hitchmaps.models.item import Item  # noqa
from hitchmaps.models.point import Point  # noqa
from hitchmaps.models.user import User  # noqa
