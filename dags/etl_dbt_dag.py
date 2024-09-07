"""
This is Description.

This is doc md description.
"""

from __future__ import annotations

from datetime import timedelta
from pathlib import Path

import pendulum
from airflow.decorators import dag
from airflow.operators.bash import BashOperator
from airflow_dbt.operators.dbt_operator import (
  DbtDepsOperator,
  DbtRunOperator,
)

from config.dag_default_config import build_default_args

dag_args = build_default_args()

@dag(
    dag_id=Path(__file__).stem,
    description=__doc__[0: __doc__.find(".")],
    doc_md=__doc__,
    default_args=dag_args,
    # start_date=pendulum.datetime(2024, 5, 6, tz="Asia/Seoul"),
    schedule="5 0 * * *",
    catchup=False,
    dagrun_timeout=timedelta(minutes=60),
    tags=["dbt"],
)
def generate_dag() -> None:

    dbt_home = "/opt/airflow/dbt-trino"
    dbt_target = "dev"

    task_dbt_deps = DbtDepsOperator(
        task_id="task_dbt_deps",
        dir=dbt_home,
        profiles_dir=dbt_home,
        target=dbt_target,
        full_refresh=False,
    )

    task_dbt_run = DbtRunOperator(
        task_id="task_dbt_run",
        dir=dbt_home,
        profiles_dir=dbt_home,
        target=dbt_target,
        full_refresh=False,
    )

    task_dbt_deps >> task_dbt_run


generate_dag()

if __name__ == "__main__":
    dag.test()