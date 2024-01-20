
(define (problem instance1_lmcut)
    (:domain taxi)

(:objects
ts1 ts2 ts3 - taxistand      
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
(is_passenger_at p_alfa ts3)
(is_passenger_at p_beta ts2)
(is_passenger_at p_gamma ts3)
))

(:metric minimize (total-cost))

)
