  program planetsimulation
    use constants
    use readvalues
    use velocity_verlet
    implicit none

    call readval
    
  p=1
  l=0
  b=0
  timesteps=0
  itersteps=0
  T=0
  ax=0
  ay=0
  az=0
  print*,"Number of objects is",N
  print*,"Time at the beginning is",T,"seconds."
  print*,"Length of the timestep is",dt,"seconds."
  print*,"Length of the simulation is",Time,"seconds."
  
  open(unit=2,file='positions.xyz',iostat=ios,status='new') ! Creates a new text file for writing the obejct positions in
  if (ios/=0) then
     print*, "Error in opening file for positions"
     stop
  end if

  simulation: do while (T<Time)
     printpositions: if (b==c) then  ! This loop prints info about the simulation to the screen at user defined intervals
        print*,""
        print*,"Number of objects is ",N
        print*,"Time is",T," seconds and the number of steps from the beginning is",timesteps
        print*,"Number of iterationsteps written so far is",itersteps
        do i=1,N
           print*,"Position of object",i,": x=",x(i),"y=",y(i),"z=",z(i)
        end do
        b=0
     end if printpositions
        b=b+1
     if (l==0) then
        plotpositions: do i=1,N  ! This loop plots positions to an outputfile called positions.xyz at user defined intervals
           if (i==1) then
              write(2,*) N
              write(2,*) "# animation (frame",p,")"
           end if
              write(2,*) i, x(i)/100,y(i)/100,z(i)/100  ! The values of positions are divided by 100 to make animating the results easier
        end do plotpositions
        l=0
        p=p+1
        itersteps=itersteps+1
     end if
     
     i=1
     call velocityverlet
     
     l=l+1
     if (l==k) then
        l=0
     end if
     T=T+dt
     timesteps=timesteps+1
  end do simulation
  close(2)
  print*,""
  print*,"Number of objects is ",N
  print*,"Time at the end of the simulation is",T,"and number of steps from the beginning is",timesteps
  print*,"Number of iterationsteps written at the end of the simulation is",itersteps
end program Planetsimulation

  
