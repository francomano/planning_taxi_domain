;;This is the original domain with full ADL requirements

(define (domain taxi)
  (:requirements :strips :typing :action-costs :adl)

  (:types
    taxi taxistand passenger 
  )

  (:predicates
    (is_taxi ?t - taxi)
    (is_taxistand ?ts - taxistand)
    (is_taxi_at ?t - taxi ?ts - taxistand)
    (is_passenger_at ?p - passenger ?ts - taxistand)
    (is_along_sidewalk ?t - taxi)
    (is_double_parked ?t - taxi)
    (is_waiting ?p - passenger)
    (is_boarded ?p - passenger ?t - taxi)
    (is_destination ?p - passenger ?ts - taxistand)
  )

  (:action move
    :parameters (?t - taxi ?from - taxistand ?to - taxistand)
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
                                              (not (= ?t ?other))
                                              )))))
                   (not (exists (?other - taxi)
                                (and (is_taxi ?other)
                                     (is_double_parked ?other)
                                     (is_taxi_at ?other ?to))))   
    )                                           
    :effect (and
             (not (is_taxi_at ?t ?from))
             (is_taxi_at ?t ?to)
             (when (not (exists (?other - taxi)
                                  (and (is_taxi ?other)
                                  (is_taxi_at ?other ?to)
                                      (not (= ?t ?other))
                                      )))
               (is_along_sidewalk ?t))
              (when (exists (?other - taxi)
                             (and (is_taxi ?other)
                                 (is_taxi_at ?other ?to)))
               (is_double_parked ?t))
              (forall (?person - passenger)
                (when (is_boarded ?person ?t)
                    (and (is_passenger_at ?person ?to)
                         (not (is_passenger_at ?person ?from))))
         )
  )

  )
  
  (:action load
  :parameters (?t - taxi ?loc - taxistand)
  :precondition (and 
                (is_taxi ?t)
                (is_taxistand ?loc)
                (is_taxi_at ?t ?loc)
                (is_along_sidewalk ?t)
                (exists (?person - passenger)
                    (and (is_passenger_at ?person ?loc)
                        (is_waiting ?person)
                        (not (is_boarded ?person ?t))
                    )))
  :effect 
            (forall (?person - passenger)
                    (when (is_waiting ?person)
                        (and (not (is_waiting ?person))
                            (is_boarded ?person ?t))))
  
  
  )
  
(:action unload
  :parameters (?t - taxi ?loc - taxistand)
  :precondition (and 
                (is_taxi ?t)
                (is_taxistand ?loc)
                (is_taxi_at ?t ?loc)
                (is_along_sidewalk ?t)
                (exists (?person - passenger)
                    (and (is_passenger_at ?person ?loc)
                        (is_destination ?person ?loc)
                        (is_boarded ?person ?t)
                    )))
  
  :effect 
        (forall (?person - passenger)
                (when (and (is_boarded ?person ?t)
                      (is_destination ?person ?loc))
                        (and (not (is_boarded ?person ?t))
                            (is_passenger_at ?person ?loc)
                            )))
  
  
 )
  
  
  
)
