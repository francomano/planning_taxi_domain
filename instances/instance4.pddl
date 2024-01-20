

(define (problem instance4)
    (:domain taxi)

(:objects
ts1 ts2 ts3 - taxistand   
p_alfa p_beta - passenger   
tA tB tC tD - taxi       
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
(is_taxi_at tB ts1)
(is_taxi_at tC ts2)
(is_taxi_at tD ts3)
(is_passenger_at p_alfa ts1)
(is_passenger_at p_beta ts2)
(is_destination p_alfa ts3)
(is_destination p_beta ts3)
(is_along_sidewalk tA)
(is_double_parked tB)
(is_along_sidewalk tC)
(is_along_sidewalk tD)
(is_waiting p_alfa)
(is_waiting p_beta)

)

(:goal (and
(not (is_boarded p_alfa tA))
(not (is_boarded p_alfa tB))
(not (is_boarded p_alfa tC))
(not (is_boarded p_alfa tD))
(not (is_boarded p_beta tA))
(not (is_boarded p_beta tB))
(not (is_boarded p_beta tC))
(not (is_boarded p_beta tD))
(is_passenger_at p_alfa ts3)
(is_passenger_at p_beta ts3)
(is_along_sidewalk tA)
(is_along_sidewalk tC)
(is_double_parked tB)
(is_double_parked tD)
(is_taxi_at tA ts1)
(is_taxi_at tB ts1)
(is_taxi_at tC ts2)
(is_taxi_at tD ts2)
(not (is_waiting p_alfa))
(not (is_waiting p_beta))
))

(:metric minimize (total-cost))

)