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

Run with FastDownward: (if you have downward and this repo cloned in the same repo, otherwise adjust it based on your local paths)

./fast-downward.py ../planning_taxi_domain/taxi_domain.pddl ../planning_taxi_domain/instances/instance1.pddl --search "astar(blind())"


Run with FF-Metric: 

./ff -o ../../planning_taxi_domain/taxi_domain.pddl -f ../../planning_taxi_domain/instances/instance1.pddl 
