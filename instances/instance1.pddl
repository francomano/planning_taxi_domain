;; Instance 1 we consider a scenario composed of three sidewalks, three taxis and two
;; people waiting to be taken to their destination. Specifically, we consider the initial state
;; where person p1 is waiting at sidewalk 1 and person p2 is waiting at sidewalk 3. The taxis in
;; the initial configuration are positioned as follows: taxi_A is parked at sidewalk 1, taxi_B is
;; parked at sidewalk 2, and taxi_C is parked at sidewalk 3. The goal state, on the other hand,
;; is represented by the following configuration: person p1 is at sidewalk 2, person p2 is at
;; sidewalk 3, taxi_A is parked at sidewalk 2, taxi_B is parked at sidewalk 3 and taxi_C is
;; parked at sidewalk 1.

(define (problem instance1)
    (:domain taxi)

(:objects
ts1 ts2 ts3 - taxistand   
p_alfa p_beta p_gamma - passenger   
tA tB tC - taxi       
)
(:init

(is_taxi tA)
(is_taxi tB)
(is_taxi tC)
(is_taxistand ts1)
(is_taxistand ts2)
(is_taxistand ts3)

(is_taxi_at tA ts1)
(is_taxi_at tB ts2)
(is_taxi_at tC ts3)
(is_passenger_at p_alfa ts1)
(is_passenger_at p_beta ts1)
(is_passenger_at p_gamma ts2)
(is_destination p_alfa ts3)
(is_destination p_beta ts2)
(is_destination p_gamma ts3)
(not (is_boarded p_alfa tA))
(not (is_boarded p_alfa tB))
(not (is_boarded p_alfa tC))
(not (is_boarded p_beta tA))
(not (is_boarded p_beta tB))
(not (is_boarded p_beta tC))
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
(not (is_boarded p_alfa tA))
(not (is_boarded p_alfa tB))
(not (is_boarded p_alfa tC))
(not (is_boarded p_beta tA))
(not (is_boarded p_beta tB))
(not (is_boarded p_beta tC))
(not (is_boarded p_gamma tA))
(not (is_boarded p_gamma tB))
(not (is_boarded p_gamma tC))
(is_passenger_at p_alfa ts3)
(is_passenger_at p_beta ts2)
(is_passenger_at p_gamma ts3)
(is_along_sidewalk tA)
(is_along_sidewalk tB)
(is_along_sidewalk tC)
(not (is_waiting p_alfa))
(not (is_waiting p_beta))
(not (is_waiting p_gamma))

))
)
