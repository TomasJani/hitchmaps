# Generic single-database configuration.

## Migration instructions

1. Create new model in `hitchmaps/models/`
2. Import new model into `hitchmaps/models/__init__.py` and `hitchmaps/db/base.py`
   (this is necessary for auto-generating)
3. Create new revision with `alembic revision --autogenerate --message <REVISION_MESSAGE>` command
4. Run migrations with `alembic upgrade head`

## Example of running raw SQL in migrations

```python
import psycopg2
import sqlalchemy as sa
from alembic import op

def upgrade():
   op.create_table(
      'person',
      sa.Column('id', sa.Integer(), nullable=False),
      sa.Column('name', sa.String(), nullable=False),
   )
   people = ['Harry', 'Ron', 'Hermione']

   conn = psycopg2.connect('postgres://username:password@localhost/dbname')
   cursor = conn.cursor()

   insert_person_sql = "INSERT INTO person (name) VALUES ('{name}');"
   for person in people:
      cursor.execute(insert_person_sql.format(name=person))
      conn.commit()
```
