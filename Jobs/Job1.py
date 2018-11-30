import os


from helpersfunctions import lookupDimensionKey
from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()


def MyMethod(slot='2018/01/01'):
    print(slot)
    filePath = os.path.join(spark.conf.get("ADLS"), 'Test1.csv')
    df = spark.read.format('csv').options(header='true', inferSchema=True).load(filePath)
    df = lookupDimensionKey(df)
    df.show()
    return


if __name__ == "__main__":
    MyMethod()