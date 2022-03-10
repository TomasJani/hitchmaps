import typing

import sqlalchemy.exc as sql_exception
from fastapi import Request
from starlette import status
from starlette.responses import JSONResponse


async def database_exception_handler(
    request: Request, exc: sql_exception.DatabaseError
) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_400_BAD_REQUEST,
        content={"detail": f"Database error: {exc.orig}"},
    )


exception_handlers: typing.Dict[
    typing.Union[int, typing.Type[Exception]], typing.Callable
] = {sql_exception.DatabaseError: database_exception_handler}
