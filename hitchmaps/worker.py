import sentry_sdk

from hitchmaps.core.celery_app import celery_app
from hitchmaps.core.config import settings

client_sentry = sentry_sdk.init(settings.SENTRY_DSN)


@celery_app.task(acks_late=True)
def test_celery(word: str) -> str:
    return f"test task return {word}"
