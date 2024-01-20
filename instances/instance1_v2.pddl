
(define (problem instance1)
    (:domain taxi)

(:objects
ts1 ts2 ts3 - taxistand   
p_alfa p_beta p_gamma - passenger   
tA tB tC - taxi     
)


(:init
(= (total-cost) 0)
(= (distance ts1 ts2) 1)
(= (distance ts2 ts1) 1)
(= (distance ts1 ts3) 2)
(= (distance ts3 ts1) 2)
(= (distance ts3 ts2) 1)
(= (distance ts2 ts3) 1)
(= (distance ts2 ts2) 0)
(= (distance ts3 ts3) 0)
(= (distance ts1 ts1) 0)
(is_taxi_at tA ts1)
(is_taxi_at tB ts2)
(is_taxi_at tC ts3)
(is_passenger_at p_alfa ts1)
(is_passenger_at p_beta ts1)
(is_passenger_at p_gamma ts2)
(not (is_boarded p_alfa tA))
(not (is_boarded p_alfa tB))
(not (is_boarded p_alfa tC))
(not (is_boarded p_beta tA))
(not (is_boarded p_beta tB))
(not (is_boarded p_beta tC));;
(not (is_boarded p_gamma tA))
(not (is_boarded p_gamma tB))
(not (is_boarded p_gamma tC))
(is_along_sidewalk tA)
(is_along_sidewalk tB)
(is_along_sidewalk tC)
(is_waiting p_alfa)
(is_waiting p_beta)
(is_waiting p_gamma)
)

(:goal (and

(is_passenger_at p_alfa ts3)
(is_passenger_at p_beta ts2)
(is_passenger_at p_gamma ts3)
(is_along_sidewalk tA)
(is_along_sidewalk tB)
(is_along_sidewalk tC)
(is_taxi_at tA ts3)
(is_taxi_at tB ts2)
(is_taxi_at tC ts1)
(not (is_waiting p_alfa))
(not (is_waiting p_beta))
(not (is_waiting p_gamma))
(is_passenger_at p_alfa ts3)
(is_passenger_at p_beta ts2)
(is_passenger_at p_gamma ts3)

))

(:metric minimize (total-cost))

)
