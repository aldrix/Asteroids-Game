extends Node

var current_scene = null
var global_score  = 0
var level_score   = 0
var max_score     = 0
var next_level    = ""


func _ready():
        var root = get_tree().get_root()
        current_scene = root.get_child( root.get_child_count() -1 )

func goto_scene(path):

	# Llama a la funcion que cambia la escena cuando no hay nada corriendo.
    call_deferred("_deferred_goto_scene",path)


func _deferred_goto_scene(path):

	# Libra la escena actual.
    current_scene.free()

    #  Carga la nueva escena.
    var s = ResourceLoader.load(path)

    # crea una nueva instancia de la nueva escena
    current_scene = s.instance()

    # Agrega la nueva escena al arbol de nodos
    get_tree().get_root().add_child(current_scene)
    get_tree().set_current_scene( current_scene )