module readvalues
  implicit none
    integer :: N,i,j,ios,k,l,p,b,c,timesteps,itersteps
    integer(kind=16):: Time
    real :: dt,T
  real,allocatable::M(:),x(:),y(:),z(:),vx(:),vy(:),vz(:),F(:),ax(:),ay(:),az(:)
  character(len=80)::filename


contains
  subroutine readval() ! Reads values for arrays from a text file that
    call get_command_argument(1,filename)
  open(unit=1,file=filename,iostat=ios,status='old')
  if (ios/=0) then
     print '(a,a,5x,i0)','Error in opening file',trim(filename),ios
     stop
  end if
  read(1,*),N
  allocate(M(N),x(N),y(N),z(N),vx(N),vy(N),vz(N),F(N),ax(N),ay(N),az(N)) 
  i=1
  Masses: do
     read(1,*) M(i)
    if (i==N) exit
     i=i+1
  end do Masses
  i=1
  PosX: do
     read(1,*) x(i)
     if (i==N) exit
     i=i+1
  end do PosX 
    i=1
  PosY: do
     read(1,*) y(i)
     if (i==N) exit
     i=i+1
  end do PosY
  i=1
  PosZ: do
     read(1,*) z(i)
     if (i==N) exit
     i=i+1
  end do PosZ
  i=1
  Velocity_x: do
     read(1,*) vx(i)
     if (i==N) exit
     i=i+1
  end do Velocity_x
    i=1
  Velocity_y: do
     read(1,*) vy(i)
     if (i==N) exit
     i=i+1
  end do Velocity_y
    i=1
  Velocity_z: do
     read(1,*) vz(i)
     if (i==N) exit
     i=i+1
  end do Velocity_z
  read(1,*) Time ! read the total length of the simulation
  read(1,*) dt   ! read the time step used in the simulation
  read(1,*) c    ! read the interval at which to print info about the simulation to the screen
  read(1,*) k    ! read the interval at which to save the positions of the objects in a text file
  close(1)
end subroutine readval
end module readvalues
