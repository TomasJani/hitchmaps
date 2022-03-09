from celery import Celery

from .config import settings

celery_app = Celery(settings.CELERY_WORKER_NAME, broker=settings.CELERY_BROKER_HOST)

celery_app.conf.task_routes = {"hitchmaps.worker.test_celery": "main-queue"}
