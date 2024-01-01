;; Instance 5

(define (problem instance1)
    (:domain taxi)

(:objects
ts1 ts2 - taxistand   
p_alfa - passenger   
tA tB - taxi     
)


(:init
(= (total-cost) 0)
(= (distance ts1 ts2) 1)
(= (distance ts2 ts1) 1)
(= (distance ts2 ts2) 0)
(= (distance ts1 ts1) 0)

(is_taxi tA)
(is_taxi tB)
(is_taxistand ts1)
(is_taxistand ts2)

(is_taxi_at tA ts1)
(is_taxi_at tB ts1)
(is_passenger_at p_alfa ts1)
(is_destination p_alfa ts2)

(not (is_boarded p_alfa tA))
(not (is_boarded p_alfa tB))

(is_along_sidewalk tA)
(is_double_parked tB)
(not (is_along_sidewalk tB))

(is_waiting p_alfa)

)

(:goal (and
(not (is_boarded p_alfa tA))
(not (is_boarded p_alfa tB))
(not (is_boarded p_alfa tC))
(is_passenger_at p_alfa ts2)

(not (is_waiting p_alfa))

))

(:metric minimize (total-cost))

)