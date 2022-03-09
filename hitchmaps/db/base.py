# Import all the models, so that Base has them before being
# imported by Alembic
from hitchmaps.db.base_class import Base  # noqa
from hitchmaps.models import Point  # noqa
from hitchmaps.models import Review  # noqa
from hitchmaps.models import User  # noqa
