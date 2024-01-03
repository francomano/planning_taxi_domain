
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