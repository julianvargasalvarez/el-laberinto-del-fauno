El laberinto del Fauno
  ...   .....
..|.  ..|
   |..|


Para iniciar el juego debemos navegar al 


GET /maleta
x-nombre: julian
x-tesoros: ""

GET /
x-nombre: julian

200 OK
x-nombre: julian
x-current: /aa


GET /aaa
x-nombre: julian

200 OK
x-current: /aa

GET /up/aa
x-nombre: julian
x-current: /aa

200 OK
x-nombre: julian
x-current: /aa
x-arriba: nada

GET /down/aa
x-current: /aa

200 OK
x-nombre: julian
x-current: /aa
x-abajo: nada

GET /izquierda/aa
x-current: /aa

200 OK
x-nombre: julian
x-current: /aa
x-abajo: /ab

GET /ab
x-nombre: julian

200 OK
x-current: /ab
x-premios: hacha

POST /maleta
x-nombre: julian
x-current: /ab
-d 'hacha'

GET /maleta
x-nombre: julian

200
x-nombre: julian
hacha

DELETE /maleta/hacha
x-nombre: julian
x-current: /fauno

