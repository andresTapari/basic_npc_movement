extends Area2D

var coordenadas: Array = [				#Lista de coordenadas a donde moverse
						 Vector2(200,150),
						 Vector2(200,400),
						 Vector2(800,400),
						 Vector2(800,150),
						 Vector2(200,150)
						#Podes agregar o modificar coordenadas aqui dentro
						]
var speed = 200.0						#Velocidad de movimiento
var velocity:Vector2= Vector2()			#Vector velocidad
var position_counter = 0				#Contador de coordenada a donde moverse
var target: Vector2 = coordenadas[0]	#Posicion actual a donde moverse


func _process(delta):					#Se ejecuta una vez por fotograma
	#Determina la direccion hacia la coordeanada target
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 10:
		# Si no llego a la posicion, se mueve a la posicion
		position += velocity * delta
	else:
		#Si llego reinicia el timer
		if $Timer.is_stopped():
			#Si el timer no esta contando
			$Timer.start()

func _on_Timer_timeout():
	#Incrementa el contador
	position_counter += 1
	#si llego al final de la lista reinicia
	if(position_counter == coordenadas.size()):
		position_counter = 0
	#Establece la cordenada a donde moverse
	target = coordenadas[position_counter]
