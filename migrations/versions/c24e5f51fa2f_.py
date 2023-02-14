"""empty message

Revision ID: c24e5f51fa2f
Revises: 8e2bd7a4b5dd
Create Date: 2020-05-03 15:39:05.014930

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'c24e5f51fa2f'
down_revision = '8e2bd7a4b5dd'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('review', sa.Column('genres', sa.String(length=500), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('review', 'genres')
    # ### end Alembic commands ###