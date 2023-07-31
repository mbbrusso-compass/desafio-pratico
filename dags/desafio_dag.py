from airflow import DAG
from datetime import datetime
from airflow.providers.mysql.operators.mysql import MySqlOperator

with DAG(
	dag_id="desafio_dag",
	start_date=datetime(2023, 1, 1),
	schedule="@daily",
	catchup=False,
	default_args={"mysql_conn_id": "desafio"}
):
	drop_tables = MySqlOperator(
		task_id="drop_table_task",
		sql="resources/drop_tables.sql")

	create_table = MySqlOperator(
		task_id="create_table_task",
		sql="resources/create_table.sql")

	import_data = MySqlOperator(
		task_id="import_data_task",
		sql="resources/import_data.sql")

	cleanse_data = MySqlOperator(
		task_id="cleanse_data_task",
		sql="resources/cleanse_data.sql")

	customers_table = MySqlOperator(
		task_id="customers_table_task",
		sql="resources/customers.sql")

	merchants_table = MySqlOperator(
		task_id="merchants_table_task",
		sql="resources/merchants.sql")

	trim_transactions = MySqlOperator(
		task_id="trim_transactions_task",
		sql="resources/trim_transactions.sql")

	drop_tables >> create_table >> import_data >> cleanse_data >> customers_table >> merchants_table >> trim_transactions
