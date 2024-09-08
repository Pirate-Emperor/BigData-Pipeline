from typing import (
    Any,
    Dict,
    Hashable,
)

from airflow.utils.dates import days_ago

CONST_DEFAULT_ARGS = {
    "owner": "airflow",
    "retries": 1,
    'start_date': days_ago(0)
}

def build_default_args(custom_args: Dict[Hashable, Any] | None = None) -> Dict[Hashable, Any]:
    actual_args = CONST_DEFAULT_ARGS.copy()

    if custom_args:
        return actual_args | custom_args

    return actual_args