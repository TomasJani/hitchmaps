import typing

from fastapi import FastAPI


def include_exception_handlers(
    app: FastAPI,
    exception_handlers: typing.Dict[
        typing.Union[int, typing.Type[Exception]], typing.Callable
    ],
) -> None:
    for exc_class_or_status_code, func in exception_handlers.items():
        app.add_exception_handler(exc_class_or_status_code, func)
