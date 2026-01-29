# %%
import duckdb

# set current directory to the location of this file
import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))

con = duckdb.connect("unit-1-3.db")
df = con.execute("""
select * from lesson.users;
""").df()

print(df)
con.close()
# %%
