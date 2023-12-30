(define (domain taxi-domain)
  (:requirements :typing)

  (:types
    taxi taxistand passenger - object
  )

  (:predicates
    (is_taxi ?x - taxi)
    (is_taxistand ?x - taxistand)
    (is_taxi_at ?x -taxi ?y - taxistand)
    (is_passenger_at ?x -passenger ?y - taxistand)
    (is_along_sidewalk ?x - taxi)
    (is_double_parked ?x - taxi)
    (is_waiting ?x -passenger)
    (is_boarded ?x -passenger ?y -taxi)
    (is_destination ?x -passenger ?y -taxistand)
;;    (at_taxistand ?t - taxi ?loc - taxistand)
;;    (no_double_parked_at_taxistand ?t - taxi ?loc - taxistand)
  )

  (:action move
    :parameters (?t - taxi ?from -taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi ?t)
                   (is_taxistand ?from)
                   (is_taxistand ?to)
                   (is_taxi_at ?t ?from)
                   (or (is_double_parked ?t)
                       (and (is_along_sidewalk ?t)
                            (not (exists (?other - taxi)
                                         (and (is_taxi ?other)
                                              (is_double_parked ?other)
                                              (is_taxi_at ?other ?from)
                                              (not(= ?t ?other))
                                              ))))))
                   (not (exists (?other - taxi)
                                (and (is_taxi ?other)
                                     (is_double_parked ?other)
                                     (is_taxi_at ?other ?to))))                                              
    :effect (and
             (not (is_taxi_at ?t ?from))
             (is_taxi_at ?t ?to)
             (when (not (exists (?other - taxi)
                                 (and (is_taxi ?other)
                                      (is_taxi_at ?other ?to))))
               (is_along_sidewalk ?t))
             (when (exists (?other - taxi)
                            (and (is_taxi ?other)
                                 (is_taxi_at ?other ?to)))
               (is_double_parked ?t))
             (forall (?person - passenger)
                (when (is_boarded ?person ?t)
                    (and (is_passenger_at ?person ?to)
                         (not(is_passenger_at ?person ?to))))
         )
  )

  )
  
  (:action load
  :parameters (?t -taxi ?loc -taxistand)
  :precondition (and 
                (is_taxi ?t)
                (is_taxistand ?loc)
                (is_taxi_at ?t ?loc)
                (is_along_sidewalk ?t)
                (exists (?person - passenger)
                    (and(is_passenger_at ?person ?loc)
                        (is_waiting ?person)
                        (not (is_boarded ?person ?t))
                    )))
  :effect 
            (forall (?person - passenger)
                    (when (is_waiting ?person)
                        (and(not(is_waiting ?person))
                            (is_boarded ?person ?t))))
  
  
  )
  
(:action unload
  :parameters (?t -taxi ?loc -taxistand)
  :precondition (and 
                (is_taxi ?t)
                (is_taxistand ?loc)
                (is_taxi_at ?t ?loc)
                (is_along_sidewalk ?t)
                (exists (?person - passenger)
                    (and(is_passenger_at ?person ?loc)
                        (is_destination ?person ?loc)
                        (is_boarded ?person ?t)
                    )))
  
  :effect 
        (forall (and(?person - passenger)
                    (is_destination ?person ?loc))
                (when (is_boarded ?person ?t)
                        (and(not(is_boarded ?person ?t))
                            (is_passenger_at ?person ?loc)
                            )))
  
  
  )
  
  
  
)
