import sqlite3
from datetime import datetime
from numpy import random
import time


conn = sqlite3.connect('../db/development.sqlite3')
c = conn.cursor()
for i in range(1000):
  t = str(datetime.now())
  a_x = random.rand()
  a_y = random.rand()
  a_z = random.rand()
  temperature = random.rand()
  s = (t, a_x, a_y, a_z, t, t,)
  c.execute("insert into acclogs(aq_time, a_x, a_y, a_z, created_at, updated_at) values(?, ?, ?, ?, ?, ?)", s)
  s = (t, temperature, t, t,)
  c.execute("insert into tmplogs(aq_time, temperature, created_at, updated_at) values(?, ?, ?, ?)", s)
  conn.commit()
  time.sleep(0.5)
conn.close()
