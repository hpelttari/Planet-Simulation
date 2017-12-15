module velocity_verlet
  use readvalues
  use constants
  implicit none

contains
  subroutine velocityverlet()
   velocity_verlet:do i=2,N  ! Calculates the positions and velocities of the objects (except the center object) using velocity verlet algorithm
        x(i)=x(i)+vx(i)*dt+0.5*ax(i)*(dt**2.)
        vx(i)=vx(i)+0.5*ax(i)*dt
        y(i)=y(i)+vy(i)*dt+0.5*ay(i)*(dt**2.)
        vy(i)=vy(i)+0.5*ay(i)*dt
        z(i)=z(i)+vz(i)*dt+0.5*az(i)*(dt**2.)
        vz(i)=vz(i)+0.5*az(i)*dt
        ax(i)=0
        ay(i)=0
        az(i)=0
        acceleration:do j=1,N
           if (i/=j) then
              ax(i)=ax(i)-G*((M(j))/(((x(i)-x(j))**2.)+((y(i)-y(j))**2.)+((z(i)-z(j))**2.))*((x(i)-x(j))/&
                   (sqrt(((x(i)-x(j))**2.)+((y(i)-y(j))**2.)+((z(i)-z(j))**2.)))))
              ay(i)=ay(i)-G*((M(j))/(((x(i)-x(j))**2.)+((y(i)-y(j))**2.)+((z(i)-z(j))**2))*((y(i)-y(j))/&
                   (sqrt(((x(i)-x(j))**2.)+((y(i)-y(j))**2.)+((z(i)-z(j))**2.)))))
              az(i)=az(i)-G*((M(j))/(((x(i)-x(j))**2.)+((y(i)-y(j))**2.)+((z(i)-z(j))**2.))*((z(i)-z(j))/&
                   (sqrt(((x(i)-x(j))**2.)+((y(i)-y(j))**2.)+((z(i)-z(j))**2.)))))
           else
              ax(i)=ax(i)
              ay(i)=ay(i)
              az(i)=az(i)
           end if
        end do acceleration
        vx(i)=vx(i)+0.5*ax(i)*dt
        vy(i)=vy(i)+0.5*ay(i)*dt
        vz(i)=vz(i)+0.5*az(i)*dt
     end do velocity_verlet

end subroutine velocityverlet
end module velocity_verlet
