;;This is the original domain with full ADL requirements

(define (domain taxi)
  (:requirements :strips :typing :action-costs :adl)

  (:types
    taxi taxistand passenger 
  )

  (:predicates
    (is_taxi_at ?t - taxi ?ts - taxistand)
    (is_passenger_at ?p - passenger ?ts - taxistand)
    (is_along_sidewalk ?t - taxi)
    (is_double_parked ?t - taxi)
    (is_waiting ?p - passenger)
    (is_boarded ?p - passenger ?t - taxi)
  )


  (:functions
    (distance ?ts1 ?ts2 - taxistand)
    (total-cost)  
  )

  (:action move
    :parameters (?t - taxi ?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at ?t ?from)
                   (or (is_double_parked ?t)
                       (and (is_along_sidewalk ?t)
                            (not (exists (?other - taxi)
                                         (and (is_double_parked ?other)
                                              (is_taxi_at ?other ?from)
                                              (not (= ?t ?other))
                                              )))))
                   (not (exists (?other - taxi)
                                (and (is_double_parked ?other)
                                     (is_taxi_at ?other ?to))))
                                      
    )                                           
    :effect (and
             (not (is_taxi_at ?t ?from))
             (is_taxi_at ?t ?to)
             (when (not (exists (?other - taxi)
                                (and (is_taxi_at ?other ?to)
                                     (not (= ?t ?other))
                                )
		         )
		   )
               	   (and (is_along_sidewalk ?t)
                   	(not (is_double_parked ?t))
               	   )
              )
              (when (exists (?other - taxi)
                             (and (is_taxi_at ?other ?to)
                                 (is_along_sidewalk ?other)
                                 (not (= ?t ?other))
                             )
		    )
              	    (and (is_double_parked ?t)
                         (not (is_along_sidewalk ?t))
                    )
              )
              
            (increase (total-cost) (distance ?from ?to))

            )

  )
  
  (:action load
  :parameters (?t - taxi ?loc - taxistand)
  :precondition (and 
                (is_taxi_at ?t ?loc)
                (is_along_sidewalk ?t)
                (not (is_double_parked ?t))
                (exists (?person - passenger)
                    (and (is_passenger_at ?person ?loc)
                        (is_waiting ?person)
                        (not (is_boarded ?person ?t))
                    )
                )


                (not (exists (?other -taxi)
                             (is_boarded ?person ?other)
                     )
                )
                )

  :effect 
            (forall (?person - passenger)
                    (when (and (is_waiting ?person)
                               (is_passenger_at ?person ?loc)
                          )
                          (and (not (is_waiting ?person))
                               (is_boarded ?person ?t)
                          )
                    )
            )
  
  
  )
  
  (:action unload
    :parameters (?t - taxi ?loc - taxistand ?person - passenger)
    :precondition (and 
                  (is_taxi_at ?t ?loc)
                  (is_along_sidewalk ?t)
                  (not (is_double_parked ?t))
                  (is_boarded ?person ?t)
                  
                  )
    
    :effect 
                  (when (and (is_boarded ?person ?t))
                  (and (not (is_boarded ?person ?t))
                              (is_passenger_at ?person ?loc)
                              ))
  )
  
  
)