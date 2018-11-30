from pyspark.sql import SparkSession
from pyspark.sql.functions import lit
import os
spark = SparkSession.builder.getOrCreate()

def lookupDimensionKey(df):
    return df.withColumn("DimensionSKey", lit(1))