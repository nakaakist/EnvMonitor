import sqlite3
from datetime import datetime
from numpy import random
import time


conn = sqlite3.connect('../db/development.sqlite3')
c = conn.cursor()
for i in range(10):
  t = str(datetime.now())
  a_x = random.rand()
  a_y = random.rand()
  a_z = random.rand()
  temperature = random.rand()
  s = (t, a_x, a_y, a_z, temperature, t, t,)
  c.execute("insert into envlogs(aq_time, a_x, a_y, a_z, temperature, created_at, updated_at) values(?, ?, ?, ?, ?, ?, ?)", s)
  time.sleep(0.1)
conn.commit()
conn.close()
