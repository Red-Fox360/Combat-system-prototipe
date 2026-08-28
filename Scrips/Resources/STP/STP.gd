extends Resource
class_name STP

#region Stats
var Max_life:int = 100
var Current_life:int = 0
var Base_body_v:int = 100 # base velocity
var Base_body_s:int = 100 # Base strength
var Base_body_e:int = 100 # Base endurance
#endregion

#region Pillars points
var Category:int = 0
var Null_points:int = 100

var Max_body_p:int = 100 # puntos maximos del pilar del cuerpo
var Max_mind_p:int = 100 # puntos maximos del pilar de la mente
var Max_soul_p:int = 100 # puntos maximos del pilar del alma

var Curr_body_p:int = 0 # puntos actuales del pilar del cuerpo
var Curr_mind_p:int = 0 # puntos actuales del pilar de la mente
var Curr_soul_p:int = 0 # puntos actuales del pilar del alma

var LP_body:int = 1 # nivel del pilar del cuerpo
var LP_soul:int = 1 # nivel del pilar del alma
var LP_mind:int = 1 # nivel del pilar de la mente
#endregion

#region Body pillar
var Limit_body_p:int = 20 # Limit points of the body pillar
var Strength:int = 0 # strength / Body_s
var Endurance:int = 0 # physical resistance / Body_e
var Agility:int = 0 # physical agility / Body_a
var Technique:int = 0 # combat technique / Body_t
var Velocity:int = 0 # movement and running speed / Body_v
#endregion

#region Mind pillar
var Limit_mind_p:int = 20 # Limit of points of the soul pillar
var Concent:int = 0 # Concentration or election time / Mind_c
var Perception:int = 0 # Perception of dangers / Mind_p
var Instinct:int = 0 # Survival instinct / Mind_i
var Will_power:int = 0 # Will_power / Mind_w
var Reaction:int = 0 # Reaction to attacks / Mind_r
#endregion

#region Soul pillar
var Limit_soul_p:int = 20 # Limit of points of the soul pillar
var Mag_aff:int = 0 # Magic affinity / Soul_Ma
var Mag_cap:int = 0 # Magic capacity / Soul_Mc
var Spirit_per:int = 0 # Spiritual perception / Soul_s
var Arc_aff:int = 0 # Arcane affinity / Soul_Aa
var Arc_cap:int = 0 # Arcane capacity / Soul_Ac
#endregion

func _init() -> void:
	Set_Stats.call_deferred()
	Set_atributes("Set")

func Set_Stats():
	Current_life = Max_life
	Set_hab_points("Set", 0)

func Set_hab_points(Hability:String, Point:int):
	match Hability:
		"Set":
			# Body
			Strength = clamp(Point, 0, Limit_body_p)
			Endurance = clamp(Point, 0, Limit_body_p)
			Agility = clamp(Point, 0, Limit_body_p)
			Velocity = clamp(Point, 0, Limit_body_p)
			Technique = clamp(Point, 0, Limit_body_p)
			# Mind
			Concent = clamp(Point, 0, Limit_mind_p)
			Perception = clamp(Point, 0, Limit_mind_p)
			Instinct = clamp(Point, 0, Limit_mind_p)
			Will_power = clamp(Point, 0, Limit_mind_p)
			Reaction = clamp(Point, 0, Limit_mind_p)
			# Soul
			Mag_aff = clamp(Point, 0, Limit_soul_p)
			Mag_cap = clamp(Point, 0, Limit_soul_p)
			Spirit_per = clamp(Point, 0, Limit_soul_p)
			Arc_aff = clamp(Point, 0, Limit_soul_p)
			Arc_cap = clamp(Point, 0, Limit_soul_p)
		#region Body
		"Body_s": Strength= clamp(Point, 0, Limit_body_p)
		"Body_e": Endurance = clamp(Point, 0, Limit_body_p)
		"Body_a": Agility = clamp(Point, 0, Limit_body_p)
		"Body_v": Velocity = clamp(Point, 0, Limit_body_p)
		"Body_t": Technique = clamp(Point, 0, Limit_body_p)
		#endregion
		#region Mind
		"Mind_c": Concent = clamp(Point, 0, Limit_mind_p)
		"Mind_p": Perception = clamp(Point, 0, Limit_mind_p)
		"Mind_i": Instinct = clamp(Point, 0, Limit_mind_p)
		"Mind_w": Will_power = clamp(Point, 0, Limit_mind_p)
		"Mind_r": Reaction = clamp(Point, 0, Limit_mind_p)
		#endregion
		#region Soul
		"Soul_Ma":Mag_aff = clamp(Point, 0, Limit_soul_p)
		"Soul_Mc": Mag_cap = clamp(Point, 0, Limit_soul_p)
		"Soul_s": Spirit_per = clamp(Point, 0, Limit_soul_p)
		"Soul_Aa": Arc_aff = clamp(Point, 0, Limit_soul_p)
		"Soul_Ac": Arc_cap = clamp(Point, 0, Limit_soul_p)
		#endregion

func Update_hability(Hability:String):
	match Hability:
		#region Body habilities
		"Body_s": # Stregnth
			if Strength == Limit_body_p || Null_points <=0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Strength + 1)
				Update_pilars_points("Body")
				Set_atributes(Hability)
		"Body_e": # Endurance
			if Endurance == Limit_body_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Endurance + 1)
				Update_pilars_points("Body")
				Set_atributes(Hability)
		"Body_a": # Agility
			if Agility == Limit_body_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Agility + 1)
				Update_pilars_points("Body")
				Set_atributes(Hability)
		"Body_v": #Velocity
			if Velocity == Limit_body_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Velocity + 1)
				Update_pilars_points("Body")
				Set_atributes(Hability)
		"Body_t": #technique
			if Technique == Limit_body_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Technique + 1)
				Update_pilars_points("Body")
				Set_atributes(Hability)
		#endregion
		#region Soul habilities
		"Soul_Ma": # Magic affinity
			if Mag_aff == Limit_soul_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Mag_aff + 1)
				Update_pilars_points("Soul")
				Set_atributes(Hability)
		"Soul_Mc": # Magic capacity
			if Mag_cap == Limit_soul_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Mag_cap + 1)
				Update_pilars_points("Soul")
				Set_atributes(Hability)
		"Soul_s": # Spirit perception
			if Spirit_per == Limit_soul_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Spirit_per + 1)
				Update_pilars_points("Soul")
				Set_atributes(Hability)
		"Soul_Aa": # Arcane affinity
			if Arc_aff == Limit_soul_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Arc_aff + 1)
				Update_pilars_points("Soul")
				Set_atributes(Hability)
		"Soul_Ac": # Arcane capacity
			if Arc_cap == Limit_soul_p || Null_points <= 0:
				print("Limite o sin punntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Arc_cap + 1)
				Update_pilars_points("Soul")
				Set_atributes(Hability)
		#endregion
		#region Mind habilities
		"Mind_c": # Concentration
			if Concent == Limit_mind_p || Null_points <= 0:
				print("L:imite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Concent + 1)
				Update_pilars_points("Mind")
				Set_atributes(Hability)
		"Mind_p": # Perception
			if Perception == Limit_mind_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Perception + 1)
				Update_pilars_points("Mind")
				Set_atributes(Hability)
		"Mind_i": # Instinct
			if Instinct == Limit_mind_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Instinct + 1)
				Update_pilars_points("Mind")
				Set_atributes(Hability)
		"Mind_w": # Will power
			if Will_power == Limit_mind_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Will_power + 1)
				Update_pilars_points("Mind")
				Set_atributes(Hability)
		"Mind_r": # Reaction
			if Reaction == Limit_mind_p || Null_points <= 0:
				print("Limite o sin puntos disponibles")
			else:
				Null_points -= 1
				Set_hab_points(Hability, Reaction + 1)
				Update_pilars_points("Mind")
				Set_atributes(Hability)
		#endregion

func Set_pilars_points(Pillar:String, Point:int):
	match Pillar:
		"Body": Curr_body_p = clamp(Point, 0, Max_body_p)
		"Soul": Curr_soul_p = clamp(Point, 0 , Max_soul_p)
		"Mind": Curr_mind_p = clamp(Point, 0, Max_mind_p)
		"Set":
			Curr_body_p = clamp(Point, 0, Max_body_p)
			Curr_soul_p = clamp(Point, 0 , Max_soul_p)
			Curr_mind_p = clamp(Point, 0, Max_mind_p)

func Update_pilars_points(Pillar:String):
	match Pillar:
		"Body": 
			if Curr_body_p == Max_body_p:
				print("limite")
			else:
				Set_pilars_points(Pillar, Curr_body_p + 1)
		"Soul":
			if Curr_soul_p == Max_soul_p:
				print("limite")
			else:
				Set_pilars_points(Pillar, Curr_soul_p + 1)
		"Mind": 
			if Curr_mind_p == Max_mind_p:
				print("limite")
			else:
				Set_pilars_points(Pillar, Curr_mind_p + 1)
	Update_pilars_levels()

func Update_pilars_levels():
	if Curr_soul_p == Max_soul_p:
		LP_soul += 1
		Set_max_points_pilars("Soul")
	if Curr_body_p == Max_body_p:
		LP_body += 1
		Set_max_points_pilars("Body")
	if Curr_mind_p == Max_mind_p:
		LP_mind += 1
		Set_max_points_pilars("Mind")

func Set_max_points_pilars(Pillar:String):
	match Pillar:
		"Soul":Max_soul_p = LP_soul * 100
		"Body":Max_body_p= LP_body * 100
		"Mind":Max_mind_p = LP_mind * 100
	Set_Limit_points(Pillar)

func Set_Limit_points(Pillar:String):
	match Pillar:
		@warning_ignore("integer_division")
		"Body": Limit_body_p = Max_body_p / 5
		@warning_ignore("integer_division")
		"Mind": Limit_mind_p = Max_mind_p / 5
		@warning_ignore("integer_division")
		"Soul": Limit_soul_p = Max_soul_p / 5
	Set_atributes("Set")

func Set_atributes(Atrib:String):
	match Atrib:
		"Set":
			PlayerAtrib.Run_speed = (100 * Velocity) + Base_body_v
		#region Body
		"Body_v": PlayerAtrib.Run_speed = (100 * Velocity) + Base_body_v
		"Body_s": PlayerAtrib.Stregnth = (100 * Strength) + Base_body_s
		"Body_e": pass
		"Body_a": pass
		"Body_t": pass
		#endregion
		#region Mind
		"Mind_c": pass
		"Mind_p": pass
		"Mind_i": pass
		"Mind_w": pass
		"Mind_r": pass
		#endregion
		#region Soul
		"Soul_Ma":pass
		"Soul_Mc":pass
		"Soul_s": pass
		"Soul_Aa":pass
		"Soul_Ac":pass
		#endregion
