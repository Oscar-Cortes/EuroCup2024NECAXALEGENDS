proc genmod data=strikers;
model goals = _all_ / dist=Pois;
run;
