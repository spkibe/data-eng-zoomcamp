#!/usr/bin/env python
# coding: utf-8

import click
import pandas as pd
from sqlalchemy import create_engine
from tqdm.auto import tqdm

dtype = {
    "VendorID": "Int64",
    "passenger_count": "Int64",
    "trip_distance": "float64",
    "RatecodeID": "Int64",
    "store_and_fwd_flag": "string",
    "PULocationID": "Int64",
    "DOLocationID": "Int64",
    "payment_type": "Int64",
    "fare_amount": "float64",
    "extra": "float64",
    "mta_tax": "float64",
    "tip_amount": "float64",
    "tolls_amount": "float64",
    "improvement_surcharge": "float64",
    "total_amount": "float64",
    "congestion_surcharge": "float64"
}

parse_dates = [
    "tpep_pickup_datetime",
    "tpep_dropoff_datetime"
]


@click.command()
@click.option('--pg-user', default='root', help='PostgreSQL user')
@click.option('--pg-pass', default='root', help='PostgreSQL password')
@click.option('--pg-host', default='localhost', help='PostgreSQL host')
@click.option('--pg-port', default=5432, type=int, help='PostgreSQL port')
@click.option('--pg-db', default='ny_taxi', help='PostgreSQL database name')
@click.option('--year', default=2021, type=int, help='Year of the data')
@click.option('--month', default=1, type=int, help='Month of the data')
@click.option('--target-table', default='yellow_taxi_data', help='Target table name')
@click.option('--chunksize', default=100000, type=int, help='Chunk size for reading CSV')
def run(pg_user, pg_pass, pg_host, pg_port, pg_db, year, month, target_table, chunksize):
    """Ingest NYC taxi data into PostgreSQL database."""
    prefix = 'https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow'
    url = f'{prefix}/yellow_tripdata_{year}-{month:02d}.csv.gz'

    engine = create_engine(f'postgresql://{pg_user}:{pg_pass}@{pg_host}:{pg_port}/{pg_db}')

    df_iter = pd.read_csv(
        url,
        dtype=dtype,
        parse_dates=parse_dates,
        iterator=True,
        chunksize=chunksize,
    )

    first = True

    for df_chunk in tqdm(df_iter):
        if first:
            df_chunk.head(0).to_sql(
                name=target_table,
                con=engine,
                if_exists='replace'
            )
            first = False

        df_chunk.to_sql(
            name=target_table,
            con=engine,
            if_exists='append'
        )

if __name__ == '__main__':
    run()

# uv run python ingest_data.py \
#   --pg-user=root \
#   --pg-pass=root \
#   --pg-host=localhost \
#   --pg-port=5432 \
#   --pg-db=ny_taxi \
#   --target-table=yellow_taxi_trips

# run with Docker

# docker run -it --rm\
#   --network=pg-network\
#    taxi_ingest:v001\
#   --pg-user=root \
#   --pg-pass=root \
#   --pg-host=pgdatabase \
#   --pg-port=5432 \
#   --pg-db=ny_taxi \
#   --target-table=yellow_taxi_trips_docker

# add network

# docker run -it --rm \
#   -e POSTGRES_USER="root" \
#   -e POSTGRES_PASSWORD="root" \
#   -e POSTGRES_DB="ny_taxi" \
#   -v ny_taxi_postgres_data:/var/lib/postgresql \
#   -p 5432:5432 \
#   --network=pg-network\
#   --name pgdatabase\
#   postgres:18

# In another terminal, run pgAdmin on the same network

# docker run -it \
#   -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
#   -e PGADMIN_DEFAULT_PASSWORD="root" \
#   -v pgadmin_data:/var/lib/pgadmin \
#   -p 8085:80 \
#   --network=pg-network \
#   --name pgadmin \
#   dpage/pgadmin4