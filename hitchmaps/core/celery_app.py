from celery import Celery

from .config import Settings

celery_app = Celery(Settings.CELERY_WORKER_NAME, broker=Settings.CELERY_BROKER_HOST)

celery_app.conf.task_routes = {"hitchmaps.worker.test_celery": "main-queue"}
