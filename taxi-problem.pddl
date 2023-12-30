(define (problem taxi-problem)
(:domain taxi-domain)
(:objects
ts1 ts2 ts3 - taxistand   ;three taxistands
p_alfa p_beta p_gamma - passenger   ;three passengers
tA tB tC - taxi       ;three taxi 
)
(:init

(is_taxi_at tA ts1)
(is_taxi_at tB ts2)
(is_taxi_at tC ts3)
(is_passenger_at p_alfa ts1)
(is_passenger_at p_beta ts1)
(is_passenger_at p_gamma ts2)
(is_destination p_alfa ts3)
(is_destination p_beta ts2)
(is_destination p_gamma ts3)
(not(is_boarded p_alfa))
(not(is_boarded p_beta))
(not(is_boarded p_gamma))
(is_along_sidewalk tA)
(is_along_sidewalk tB)
(is_along_sidewalk tC)
(is_waiting p_alfa)
(is_waiting p_beta)
(is_waiting p_gamma)
)
;The goal is to bring all passengers to floor 1
(:goal (and
(not(is_boarded p_alfa))
(not(is_boarded p_beta))
(not(is_boarded p_gamma))
(is_passenger_at p_alfa ts3)
(is_passenger_at p_beta ts2)
(is_passenger_at p_gamma ts3)
(is_along_sidewalk tA)
(is_along_sidewalk tB)
(is_along_sidewalk tC)
(not(is_waiting p_alfa))
(not(is_waiting p_beta))
(not(is_waiting p_gamma))

))
)
