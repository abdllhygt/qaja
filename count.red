Red []

call/console "wc -l */*"

countdate: context [
  qaja: now - 11-07-2019
  waja: now - 26-12-2017
]
print ""
print [" waja: since" countdate/waja "days"]
print [" qaja: since" countdate/qaja "days"]
