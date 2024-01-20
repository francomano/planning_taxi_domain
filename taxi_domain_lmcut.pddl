(define (domain taxi)
  (:requirements :strips :typing :action-costs :negative-preconditions)

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

<<<<<<< HEAD
  (:action move_tA_from_double_parked_to_sidewalk                             
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tA ?from)
                   (is_double_parked tA)                  
=======
  (:action move_tA_from_double_parked_to_sidewalk                            
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tA ?from)
                   (is_double_parked tA)                 
>>>>>>> 377c7dd8ef1fa3979ed6f4e9ddf7aad1af5350c5
                    (not (is_taxi_at tB ?to))        
                    (not (is_taxi_at tC ?to))
                                
                  )                                           
    :effect (and
             (not (is_taxi_at tA ?from))
             (is_taxi_at tA ?to)

             (is_along_sidewalk tA)
             (not (is_double_parked tA))
               	   
    
               
              
            (increase (total-cost) (distance ?from ?to))

            )

  )


  (:action move_tA_from_double_parked_along_tB                             
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tA ?from)
                   (is_double_parked tA)                  
                    (not (is_taxi_at tC ?to))
                    (is_taxi_at tB ?to)
                    (is_along_sidewalk tB)            
                  ) 


    :effect (and
             (not (is_taxi_at tA ?from))
             (is_taxi_at tA ?to)

             (increase (total-cost) (distance ?from ?to))

            )

  )

<<<<<<< HEAD
(:action move_tA_from_double_parked_along_tC                           
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tA ?from)
                   (is_double_parked tA)                  
=======
(:action move_tA_from_double_parked_along_tC                       
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tA ?from)
                   (is_double_parked tA)                
>>>>>>> 377c7dd8ef1fa3979ed6f4e9ddf7aad1af5350c5
                    (is_taxi_at tC ?to)
                    (not (is_taxi_at tB ?to))
                    (is_along_sidewalk tC)           
                  ) 


    :effect (and
             (not (is_taxi_at tA ?from))
             (is_taxi_at tA ?to) 
             (increase (total-cost) (distance ?from ?to))

            )

  )




  (:action move_tA_from_sidewalk_to_sidewalk
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tA ?from)
                    (is_along_sidewalk tA)
                    (not 
                                (and (is_double_parked tB)   
                                     (is_taxi_at tB ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?from)
                                )
                         
                    )               
                    (not 
                          (is_taxi_at tB ?to)
                                
                         
                    )
                    (not 
                          (is_taxi_at tC ?to)
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tA ?from))
             (is_taxi_at tA ?to)
              

            (increase (total-cost) (distance ?from ?to))

            )

  )

  (:action move_tA_from_sidewalk_along_tB
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tA ?from)
                    (is_along_sidewalk tA)
                    (not 
                                (and (is_double_parked tB)   
                                     (is_taxi_at tB ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?from)
                                ) 
                         
                    )  
                    (is_taxi_at tB ?to)
                    (is_along_sidewalk tB)             
                    (not 
                          (is_taxi_at tC ?to)
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tA ?from))
             (is_taxi_at tA ?to)

             (is_double_parked tA)
             (not (is_along_sidewalk tA))
              

            (increase (total-cost) (distance ?from ?to))

            )

  )

  (:action move_tA_from_sidewalk_along_tC
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tA ?from)
                    (is_along_sidewalk tA)
                    (not 
                                (and (is_double_parked tB)   
                                     (is_taxi_at tB ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?from)
                                ) 
                         
                    )  
                    (is_taxi_at tC ?to)
                    (is_along_sidewalk tC)             
                    (not 
                          (is_taxi_at tB ?to)
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tA ?from))
             (is_taxi_at tA ?to)

             (is_double_parked tA)
             (not (is_along_sidewalk tA))
              

            (increase (total-cost) (distance ?from ?to))

            )

  )



<<<<<<< HEAD
(:action move_tB_from_double_parked_to_sidewalk                             
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tB ?from)
                   (is_double_parked tB)                  
=======
(:action move_tB_from_double_parked_to_sidewalk                            
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tB ?from)
                   (is_double_parked tB)                
>>>>>>> 377c7dd8ef1fa3979ed6f4e9ddf7aad1af5350c5
                    (not (is_taxi_at tA ?to))        
                    (not (is_taxi_at tC ?to))
                                  
                  )                                           
    :effect (and
             (not (is_taxi_at tB ?from))
             (is_taxi_at tB ?to)

             (is_along_sidewalk tB)
             (not (is_double_parked tB))
               
              
            (increase (total-cost) (distance ?from ?to))

            )
  )

<<<<<<< HEAD
(:action move_tB_from_double_parked_along_tA                             
=======
(:action move_tB_from_double_parked_along_tA                        
>>>>>>> 377c7dd8ef1fa3979ed6f4e9ddf7aad1af5350c5
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tB ?from)
                   (is_double_parked tB)                  
                    (not (is_taxi_at tC ?to))
                    (is_taxi_at tA ?to)
                    (is_along_sidewalk tA)           
                  ) 


    :effect (and
             (not (is_taxi_at tB ?from))
             (is_taxi_at tB ?to)

             (increase (total-cost) (distance ?from ?to))

            )
  )
  
<<<<<<< HEAD
  (:action move_tB_from_double_parked_along_tC                           
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tB ?from)
                   (is_double_parked tB)                 
=======
  (:action move_tB_from_double_parked_along_tC                        
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tB ?from)
                   (is_double_parked tB)                  
>>>>>>> 377c7dd8ef1fa3979ed6f4e9ddf7aad1af5350c5
                    (not (is_taxi_at tA ?to))
                    (is_taxi_at tC ?to)
                    (is_along_sidewalk tC)           
                  ) 


    :effect (and
             (not (is_taxi_at tB ?from))
             (is_taxi_at tB ?to)

             (increase (total-cost) (distance ?from ?to))

            )
  )



(:action move_tB_from_sidewalk_to_sidewalk
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tB ?from)
                    (is_along_sidewalk tB)
                    (not 
                                (and (is_double_parked tA)   
                                     (is_taxi_at tA ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?from)
                                )
                         
                    )               
                    (not 
                          (is_taxi_at tA ?to)
                                
                         
                    )
                    (not 
                          (is_taxi_at tC ?to)
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tB ?from))
             (is_taxi_at tB ?to)
              

            (increase (total-cost) (distance ?from ?to))

            )

  )



  (:action move_tB_from_sidewalk_along_tA
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tB ?from)
                    (is_along_sidewalk tB)
                    (not 
                                (and (is_double_parked tA)   
                                     (is_taxi_at tA ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?from)
                                ) 
                         
                    )  
                    (is_taxi_at tA ?to)
                    (is_along_sidewalk tA)             
                    (not 
                          (is_taxi_at tC ?to)
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tB ?from))
             (is_taxi_at tB ?to)

             (is_double_parked tB)
             (not (is_along_sidewalk tB))
              

            (increase (total-cost) (distance ?from ?to))

            )

  )

  (:action move_tB_from_sidewalk_along_tC
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tB ?from)
                    (is_along_sidewalk tB)
                    (not 
                                (and (is_double_parked tA)   
                                     (is_taxi_at tA ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tC)
                                     (is_taxi_at tC ?from)
                                ) 
                         
                    )  
                    (is_taxi_at tC ?to)
                    (is_along_sidewalk tC)             
                    (not 
                          (is_taxi_at tA ?to)
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tB ?from))
             (is_taxi_at tB ?to)

             (is_double_parked tB)
             (not (is_along_sidewalk tB))
              

            (increase (total-cost) (distance ?from ?to))

            )

  )



(:action move_tC_from_double_parked_to_sidewalk                              
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tC ?from)
                   (is_double_parked tC)                  
                    (not (is_taxi_at tA ?to))        
                    (not (is_taxi_at tB ?to))
                                  
                  )                                           
    :effect (and
             (not (is_taxi_at tC ?from))
             (is_taxi_at tC ?to)

             (is_along_sidewalk tC)
             (not (is_double_parked tC))
               
              
            (increase (total-cost) (distance ?from ?to))

            )
  )

  (:action move_tC_from_double_parked_along_tA                             
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tC ?from)
                   (is_double_parked tC)                  
                    (not (is_taxi_at tB ?to))
                    (is_taxi_at tA ?to)
                    (is_along_sidewalk tA)           
                  ) 


    :effect (and
             (not (is_taxi_at tC ?from))
             (is_taxi_at tC ?to)

             (increase (total-cost) (distance ?from ?to))

            )
  )

  (:action move_tC_from_double_parked_along_tB                           
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                   (is_taxi_at tC ?from)
                   (is_double_parked tC)                  
                    (not (is_taxi_at tA ?to))
                    (is_taxi_at tB ?to)
                    (is_along_sidewalk tB)           
                  ) 


    :effect (and
             (not (is_taxi_at tC ?from))
             (is_taxi_at tC ?to)

             (increase (total-cost) (distance ?from ?to))

            )
  )


  (:action move_tC_from_sidewalk_to_sidewalk
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tC ?from)
                    (is_along_sidewalk tC)
                    (not 
                                (and (is_double_parked tA)   
                                     (is_taxi_at tA ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tB)
                                     (is_taxi_at tB ?from)
                                )
                         
                    )               
                    (not 
                          (is_taxi_at tA ?to)
                                
                         
                    )
                    (not 
                          (is_taxi_at tB ?to)
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tC ?from))
             (is_taxi_at tC ?to)
              

            (increase (total-cost) (distance ?from ?to))

            )

  )

(:action move_tC_from_sidewalk_along_tA
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tC ?from)
                    (is_along_sidewalk tC)
                    (not 
                                (and (is_double_parked tA)   
                                     (is_taxi_at tA ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tB)
                                     (is_taxi_at tB ?from)
                                ) 
                         
                    )  
                    (is_taxi_at tA ?to)
                    (is_along_sidewalk tA)             
                    (not 
                          (is_taxi_at tB ?to)
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tC ?from))
             (is_taxi_at tC ?to)

             (is_double_parked tC)
             (not (is_along_sidewalk tC))
              

            (increase (total-cost) (distance ?from ?to))

            )

  )

(:action move_tC_from_sidewalk_along_tB
    :parameters (?from - taxistand ?to - taxistand)
    :precondition (and
                    (is_taxi_at tC ?from)
                    (is_along_sidewalk tC)
                    (not 
                                (and (is_double_parked tA)   
                                     (is_taxi_at tA ?from)
                                )
                         
                    )
                    (not 
                                (and (is_double_parked tB)
                                     (is_taxi_at tB ?from)
                                ) 
                         
                    )  
                    (is_taxi_at tB ?to)
                    (is_along_sidewalk tB)             
                    (not 
                          (is_taxi_at tA ?to)
                    )               
                                      
                  )                                           
    :effect (and
             (not (is_taxi_at tC ?from))
             (is_taxi_at tC ?to)

             (is_double_parked tC)
             (not (is_along_sidewalk tC))
              

            (increase (total-cost) (distance ?from ?to))

            )

  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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