extends Node

var current_scene  = null
var previous_level = null
var global_score  = 0
var level_score   = 0
var max_score     = 0
var next_level    = ""

####### Salvar Partida #######
var save_data = {"current_level":"res://Scenes/Niveles/Nivel0.xscn",
				 "global_score":0}
var savegame  = File.new()
var save_path = "res://savegame.bin"

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
    get_tree().set_current_scene( current_scene)

#Carga la escena anterior
func retry():
	goto_scene(previous_level)
	
func check_savegame():
	if not savegame.file_exists(save_path):
		savegame.open_encrypted_with_pass(save_path, File.WRITE, OS.get_unique_ID())
		savegame.store_var(save_data)
		savegame.close()
		return false
	else:
		return true
		
func load_game():
	savegame.open_encrypted_with_pass(save_path, File.READ, OS.get_unique_ID())
	save_data = savegame.get_var()
	savegame.close()
	global_score = save_data["global_score"]
	goto_scene(save_data["current_level"])

func save_game():
	save_data = {"current_level": next_level,
				 "global_score" :global_score}
	savegame.open_encrypted_with_pass(save_path, File.WRITE, OS.get_unique_ID())
	savegame.store_var(save_data)
	savegame.close()