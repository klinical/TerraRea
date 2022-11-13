extends Node

const PLAYER := preload("res://player/Player.tscn")
const WEAPON := preload("res://weapon/WeaponScythe.tscn")
const COUNTDOWN_TIMER := preload("res://RoundCountdown.tscn")

var round_number: int = 1
var round_complete: bool = false
var round_started: bool = false
var score: int
var game_started: bool
var player: Player

func _ready() -> void:
	pass

func _process(delta) -> void:
	if game_started:
		if Input.is_action_just_pressed("debug"):
			$UI/DebugMenu.visible = !$UI/DebugMenu.visible
		$UI/DebugMenu/PlayerVel.text = str("Velocity: ", $GameScene/Player.velocity)
		$UI/DebugMenu/PlayerPos.text = str("Player: ", $GameScene/Player.position)
		$UI/DebugMenu/PlayerState.text = str("State: ", $GameScene/Player/StateMachine.state.name)
		
		if round_started:
			var enemies_remaining = 0
			for child in $GameScene.get_children():
				if child is MeleeEnemy:
					enemies_remaining += 1
					
			if enemies_remaining == 0:
				round_complete = true
				round_started = false
				start_round()

func start_game() -> void:
	$UI/Menu.visible = false
	$GameScene/floor.visible = true
	
	var player = PLAYER.instance()
	$GameScene.add_child(player)
	player.position = Vector2(50, 506)
	
	var weapon = WEAPON.instance()
	$GameScene.add_child(weapon)
	weapon.player = player
	
	start_round()
	game_started = true
	self.player = player
	
func on_round_timer_complete() -> void:
	$GameScene/MeleeEnemySpawnZone.spawn_mob(1 + int(round_number * .25), player)
	round_complete = false
	round_started = true

func start_round() -> void:
	var countdown_screen = COUNTDOWN_TIMER.instance()
	countdown_screen.set_round_number(round_number)
	$GameScene.add_child(countdown_screen)
	countdown_screen.connect("done", self, "on_round_timer_complete")
	round_number += 1
