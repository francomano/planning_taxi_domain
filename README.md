# planning_taxi_domain
This is a taxi domain modeled in PDDL
Domain Description:
The objects in the chosen domain are taxis, people, and sidewalks. Taxis can park along a
sidewalk or double-park and can move from one sidewalk to another, except when there is
another taxi double-parked on the same sidewalk. Parking beyond the third row is not
allowed. When a taxi is parked along a sidewalk (not double-parked) where there are people
waiting, the people can be loaded into the taxi. The taxi can unload passengers when they
have reached their destination. The goal is to find a plan to move from one configuration to
another. A configuration is defined by the position of the taxis (along the sidewalks or
double-parked) and the position of people on the sidewalks.

Run with FastDownward:

Run with FF-Metric:
