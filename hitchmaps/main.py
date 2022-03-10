from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware
from starlette.responses import RedirectResponse

from hitchmaps.api.api_v1.api import api_router
from hitchmaps.core.config import settings
from hitchmaps.exception_handlers import exception_handlers
from hitchmaps.utils import include_exception_handlers

app = FastAPI(
    title=settings.PROJECT_NAME, openapi_url=f"{settings.API_V1_STR}/openapi.json"
)

# Set all CORS enabled origins
if settings.BACKEND_CORS_ORIGINS:
    app.add_middleware(
        CORSMiddleware,
        allow_origins=[str(origin) for origin in settings.BACKEND_CORS_ORIGINS],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

include_exception_handlers(app, exception_handlers)


@app.get("/", response_class=RedirectResponse)
async def redirect_to_docs() -> str:
    return "/docs"


app.include_router(api_router, prefix=settings.API_V1_STR)
