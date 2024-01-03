(define (domain taxi)
  (:requirements :strips :typing :action-costs :conditional-effects :negative-preconditions)

  (:types
    taxi taxistand passenger 
  )
  (:constants p_alfa p_beta p_gamma - passenger 
              tA tB tC - taxi  )                 ;;we need these to avoid the use of quantifiers

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

  (:action move_from_double_parked_tA                             ;;this is the action for moving tA starting from a double-parked position 
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tA ?from)
                   (is_double_parked tA)                  ;;not exists P becomes forall not P and forall is expressed with constants

                    (not 
                                (and (is_double_parked tB)   ;;one of them must be false
                                     (is_taxi_at tB ?to)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?to)
                                )
                         
                    )               
                  )                                           
    :effect (and
             (not (is_taxi_at tA ?from))
             (is_taxi_at tA ?to)


             (when (and (not (is_taxi_at tB ?to))        ;;not exist <-> forall not
                        (not (is_taxi_at tC ?to))
                    )
		         
               	   (and (is_along_sidewalk tA)
                   	   (not (is_double_parked tA))
               	   )
              )
              (when 
                    (and (is_taxi_at tB ?to)
                         (is_along_sidewalk tB)
                    )

                    (is_double_parked tA)
              )
              (when 
                    (and (is_taxi_at tC ?to)
                         (is_along_sidewalk tC)
                    )

                    (is_double_parked tA)
              )
               
              
            (increase (total-cost) (distance ?from ?to))

            )

  )

(:action move_from_double_parked_tB                             ;;this is the action for moving tB starting from a double-parked position 
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tB ?from)
                   (is_double_parked tB)                  ;;not exists P becomes forall not P and forall is expressed with constants

                    (not 
                                (and (is_double_parked tA)   ;;one of them must be false
                                     (is_taxi_at tA ?to)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?to)
                                )
                         
                    )               
                  )                                           
    :effect (and
             (not (is_taxi_at tB ?from))
             (is_taxi_at tB ?to)


             (when (and (not (is_taxi_at tA ?to))        ;;not exist <-> forall not
                        (not (is_taxi_at tC ?to))
                    )
		         
               	   (and (is_along_sidewalk tB)
                   	   (not (is_double_parked tB))
               	   )
              )
              (when 
                    (and (is_taxi_at tA ?to)
                         (is_along_sidewalk tA)
                    )

                    (is_double_parked tB)
              )
              (when 
                    (and (is_taxi_at tC ?to)
                         (is_along_sidewalk tC)
                    )

                    (is_double_parked tB)
              )
               
              
            (increase (total-cost) (distance ?from ?to))

            )

  )

  (:action move_from_double_parked_tC                             ;;this is the action for moving tC starting from a double-parked position 
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tC ?from)
                   (is_double_parked tC)                  ;;not exists P becomes forall not P and forall is expressed with constants

                    (not 
                                (and (is_double_parked tA)   ;;one of them must be false
                                     (is_taxi_at tA ?to)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tB)
                                     (is_taxi_at tB ?to)
                                )
                         
                    )               
                  )                                           
    :effect (and
             (not (is_taxi_at tC ?from))
             (is_taxi_at tC ?to)


             (when (and (not (is_taxi_at tA ?to))        ;;not exist <-> forall not
                        (not (is_taxi_at tB ?to))
                    )
		         
               	   (and (is_along_sidewalk tC)
                   	   (not (is_double_parked tC))
               	   )
              )
              (when 
                    (and (is_taxi_at tA ?to)
                         (is_along_sidewalk tA)
                    )

                    (is_double_parked tC)
              )
              (when 
                    (and (is_taxi_at tB ?to)
                         (is_along_sidewalk tB)
                    )

                    (is_double_parked tC)
              )
               

              
            (increase (total-cost) (distance ?from ?to))

            )

  )




  (:action move_from_sidewalk_tA
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tA ?from)
                    (is_along_sidewalk tA)
                    (not 
                                (and (is_double_parked tB)   ;;one of them must be false
                                     (is_taxi_at tB ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?from)
                                )
                         
                    )               
                    (not 
                                (and (is_double_parked tB)   ;;one of them must be false
                                     (is_taxi_at tB ?to)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?to)
                                )
                         
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tA ?from))
             (is_taxi_at tA ?to)

             (when (and (not (is_taxi_at tB ?to))        ;;not exist <-> forall not
                        (not (is_taxi_at tC ?to))
                    )
		         
               	   (and (is_along_sidewalk tA)
                   	   (not (is_double_parked tA))
               	   )
              )
              (when 
                    (and (is_taxi_at tB ?to)
                         (is_along_sidewalk tB)
                    )

                    (is_double_parked tA)
              )
              (when 
                    (and (is_taxi_at tC ?to)
                         (is_along_sidewalk tC)
                    )

                    (is_double_parked tA)
              )

            (increase (total-cost) (distance ?from ?to))

            )

  )


  (:action move_from_sidewalk_tB
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tB ?from)
                    (is_along_sidewalk tB)
                    (not 
                                (and (is_double_parked tA)   ;;one of them must be false
                                     (is_taxi_at tA ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?from)
                                )
                         
                    )               
                    (not 
                                (and (is_double_parked tA)   ;;one of them must be false
                                     (is_taxi_at tA ?to)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?to)
                                )
                         
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tB ?from))
             (is_taxi_at tB ?to)


             (when (and (not (is_taxi_at tA ?to))        ;;not exist <-> forall not
                        (not (is_taxi_at tC ?to))
                    )
		         
               	   (and (is_along_sidewalk tB)
                   	   (not (is_double_parked tB))
               	   )
              )
              (when 
                    (and (is_taxi_at tA ?to)
                         (is_along_sidewalk tA)
                    )

                    (is_double_parked tB)
              )
              (when 
                    (and (is_taxi_at tC ?to)
                         (is_along_sidewalk tC)
                    )

                    (is_double_parked tB)
              )

            (increase (total-cost) (distance ?from ?to))

            )

  )


  (:action move_from_sidewalk_tC
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tC ?from)
                    (is_along_sidewalk tC)
                    (not 
                                (and (is_double_parked tA)   ;;one of them must be false
                                     (is_taxi_at tA ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tB)
                                     (is_taxi_at tB ?from)
                                )
                         
                    )               
                    (not 
                                (and (is_double_parked tA)   ;;one of them must be false
                                     (is_taxi_at tA ?to)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tB)
                                     (is_taxi_at tB ?to)
                                )
                         
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tC ?from))
             (is_taxi_at tC ?to)


             (when (and (not (is_taxi_at tA ?to))        ;;not exist <-> forall not
                        (not (is_taxi_at tB ?to))
                    )
		         
               	   (and (is_along_sidewalk tC)
                   	   (not (is_double_parked tC))
               	   )
              )
              (when 
                    (and (is_taxi_at tA ?to)
                         (is_along_sidewalk tA)
                    )

                    (is_double_parked tC)
              )
              (when 
                    (and (is_taxi_at tB ?to)
                         (is_along_sidewalk tB)
                    )

                    (is_double_parked tC)
              )

            (increase (total-cost) (distance ?from ?to))

            )
  )



  (:action load_p_alfa
  :parameters (?t - taxi ?loc - taxistand)
  :precondition (and 
                (is_taxi_at ?t ?loc)
                (is_along_sidewalk ?t)
                (not (is_double_parked ?t))

                (and (is_passenger_at p_alfa ?loc)
                     (is_waiting p_alfa)
                     (not (is_boarded p_alfa ?t))
                )
                
                )

  :effect 
                (and (not (is_waiting p_alfa))
                          (is_boarded p_alfa ?t)
                )
  
  )

  (:action load_p_beta
  :parameters (?t - taxi ?loc - taxistand)
  :precondition (and 
                (is_taxi_at ?t ?loc)
                (is_along_sidewalk ?t)
                (not (is_double_parked ?t))

                (and (is_passenger_at p_beta ?loc)
                     (is_waiting p_beta)
                     (not (is_boarded p_beta ?t))
                )
                
                )

  :effect 

                     (and (not (is_waiting p_beta))
                          (is_boarded p_beta ?t)
                    )

            
  
  
  )
  
  (:action load_p_gamma
  :parameters (?t - taxi ?loc - taxistand)
  :precondition (and 
                (is_taxi_at ?t ?loc)
                (is_along_sidewalk ?t)
                (not (is_double_parked ?t))

                (and (is_passenger_at p_gamma ?loc)
                     (is_waiting p_gamma)
                     (not (is_boarded p_gamma ?t))
                )
                
                )

  :effect 


                     (and (not (is_waiting p_gamma))
                          (is_boarded p_gamma ?t)
                    )

            
  
  
  )
  
  (:action unload_p_alfa
    :parameters (?t - taxi ?loc - taxistand)
    :precondition (and 
                  (is_taxi_at ?t ?loc)
                  (is_along_sidewalk ?t)
                  (not (is_double_parked ?t))
                  (is_boarded p_alfa ?t)
                  
                  
                  )
    
    :effect 
                     (and (not (is_boarded p_alfa ?t))
                          (is_passenger_at p_alfa ?loc)
                     )
 
    
    
  )

  (:action unload_p_beta
    :parameters (?t - taxi ?loc - taxistand)
    :precondition (and 
                  (is_taxi_at ?t ?loc)
                  (is_along_sidewalk ?t)
                  (not (is_double_parked ?t))
                  (is_boarded p_beta ?t)
                  
                  
                  )
    
    :effect 

                     (and (not (is_boarded p_beta ?t))
                          (is_passenger_at p_beta ?loc)
                     )
    
    
  )

  (:action unload_p_gamma
    :parameters (?t - taxi ?loc - taxistand)
    :precondition (and 
                  (is_taxi_at ?t ?loc)
                  (is_along_sidewalk ?t)
                  (not (is_double_parked ?t))
                  (is_boarded p_gamma ?t)
                  
                  
                  )
    
    :effect 
                     (and (not (is_boarded p_gamma ?t))
                          (is_passenger_at p_gamma ?loc)
                     )

    
    
  )
  
  
)